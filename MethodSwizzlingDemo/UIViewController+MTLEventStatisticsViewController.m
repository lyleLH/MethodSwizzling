//
//  UIViewController+MTLEventStatisticsViewController.m
//  MethodSwizzlingDemo
//
//  Created by lyleKP on 2017/3/6.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "UIViewController+MTLEventStatisticsViewController.h"
#import "MTLEventStatistics.h"
#import <objc/runtime.h>

@implementation UIViewController (MTLEventStatisticsViewController)

void swizzleMethod(Class class,SEL originalSelector,SEL swizzledSelector) {
    static dispatch_once_t onceToken;
     dispatch_once(&onceToken, ^{
         Method originalMethod = class_getInstanceMethod(class, originalSelector);
         Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
         BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
         if(didAddMethod){
             class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
         }else{
             method_exchangeImplementations(originalMethod, swizzledMethod);
         }
     });
}
/*
 1.一般情况下，类别里的方法会重写掉主类里相同命名的方法。如果有两个类别实现了相同命名的方法，只有一个方法会被调用。
 2.但 +load: 是个特例，当一个类被读到内存的时候， runtime 会给这个类及它的每一个类别都发送一个 +load: 消息。
 */



+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(swizzled_viewWillAppear:);
        
        swizzleMethod(class, originalSelector, swizzledSelector);
    });
}


- (void)swizzled_viewWillAppear:(BOOL)animated {
    [self swizzled_viewWillAppear:animated];
    
    [MTLEventStatistics viewControllerDisplayEvent:NSStringFromClass([self class])];
}




@end


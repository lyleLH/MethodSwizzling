//
//  MTLEventStatistics.m
//  MethodSwizzlingDemo
//
//  Created by lyleKP on 2017/3/6.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTLEventStatistics.h"

@implementation MTLEventStatistics
+ (void)buttonClickedEvent:(NSString*)buttonName inClass:(NSString*)className  {
    NSLog(@"cliced button:%@ in class:%@",buttonName,className);
}

+ (void)viewControllerDisplayEvent:(NSString*)className {
    NSLog(@"viewControllerDisplayEvent,className is :%@",className);
    
}

@end

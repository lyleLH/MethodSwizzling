//
//  MTLEventStatistics.h
//  MethodSwizzlingDemo
//
//  Created by lyleKP on 2017/3/6.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTLEventStatistics : NSObject


+ (void)buttonClickedEvent:(NSString*)buttonName inClass:(NSString*)className;

+ (void)viewControllerDisplayEvent:(NSString*)className;

@end

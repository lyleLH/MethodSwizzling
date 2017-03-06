//
//  MTLViewController.m
//  MethodSwizzlingDemo
//
//  Created by lyleKP on 2017/3/6.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTLViewController.h"

#import "MTLLoginViewController.h"

#import "MTLEventStatistics.h"

@interface MTLViewController ()

@end

@implementation MTLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)eventLogin:(id)sender {

    [self.navigationController pushViewController:[[MTLLoginViewController alloc] init] animated:YES];
    
    //    [MTLEventStatistics buttonClickedEvent:@"登陆" inClass:NSStringFromClass([self class])];
}
@end

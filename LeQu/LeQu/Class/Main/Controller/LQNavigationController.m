//
//  LQNavigationController.m
//  LeQu
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQNavigationController.h"

@interface LQNavigationController ()

@end

@implementation LQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏的背景图片为透明的
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsCompact];
    [[[self.navigationBar subviews ]objectAtIndex:0]setAlpha:0];
    
    
//    self.navigationBar.backgroundColor = [UIColor redColor];
//    self.navigationBar.barTintColor = [UIColor orangeColor];
    
//    self.navigationBar.translucent = YES;
}


@end

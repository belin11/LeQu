//
//  LQRootViewControllerTool.m
//  LeQu
//
//  Created by apple on 16/7/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQRootViewControllerTool.h"
#import "LQTabBarController.h"
#import "LQNewFeatureController.h"

@implementation LQRootViewControllerTool

+ (void)chooseRootViewController:(UIWindow *)window {
    
    //1. 获得当前的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    //2. 获得上一次的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"version"];
    //3. 判断当前是否有新版本
    if ([currentVersion isEqualToString:lastVersion]) { // 没有新版本
        
        LQTabBarController *tab = [[LQTabBarController alloc]init];
        window.rootViewController = tab;
        
    } else { // 有新版本
        
        LQNewFeatureController *newFeatureVC = [LQNewFeatureController new];
        window.rootViewController = newFeatureVC;
        // 保存当前版本
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"version"];
    }
}
@end

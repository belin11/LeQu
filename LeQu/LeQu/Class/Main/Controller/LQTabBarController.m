//
//  LQTabBarController.m
//  LeQu
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQTabBarController.h"
#import "LQNavigationController.h"

#import "LQHomeViewController.h"
#import "LQActivityController.h"
#import "LQOrganizationController.h"
#import "LQProfileController.h"

#import "UIImage+Image.h"
#import "LQTabBar.h"



@interface LQTabBarController ()

@end

@implementation LQTabBarController
//第一次调用类的时间会调用这个
+ (void)initialize {
//    //获取所有UITabBarItem 的外观标识
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor cyanColor];
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
}

- (void)viewDidAppear:(BOOL)animated {
    
//    NSArray *array = self.tabBar.subviews;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTabBar];
    [self setUpAllChildViewController];
}
#pragma mark - 自定义tabbar
- (void)setUpTabBar {
    
    LQTabBar *tabBar = [[LQTabBar alloc]initWithFrame:self.tabBar.bounds];
    tabBar.backgroundColor = [UIColor whiteColor];
    [self setValue:tabBar forKey:@"tabBar"];
//    [self.tabBar addSubview:tabBar];
    
}
#pragma mark - 添加所有的子控制器
- (void)setUpAllChildViewController {
    
    LQHomeViewController *homeVC = [[LQHomeViewController alloc]init];

    [self setUpOneChildViewControllerWith:homeVC andImage:[UIImage imageNamed:@"0_normal"] andSelectedImage:[UIImage originImagewithImageName:@"0_selected"] andTitle:@"首页"];

    LQActivityController *activityVC = [[LQActivityController alloc]init];
    [self setUpOneChildViewControllerWith:activityVC andImage:[UIImage imageNamed:@"1_normal"] andSelectedImage:[UIImage originImagewithImageName:@"1_selected"] andTitle:@"查活动"];

     LQOrganizationController*organizationVC = [[LQOrganizationController alloc]init];
    
    [self setUpOneChildViewControllerWith:organizationVC andImage:[UIImage imageNamed:@"3_normal"] andSelectedImage:[UIImage originImagewithImageName:@"3_selected"] andTitle:@"找组织"];

    
    LQProfileController *profileVC = [[LQProfileController alloc]init];
    [self setUpOneChildViewControllerWith:profileVC andImage:[UIImage imageNamed:@"4_normal"] andSelectedImage:[UIImage originImagewithImageName:@"4_selected"] andTitle:@"我的"];

}

#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewControllerWith:(UIViewController *)vc andImage:(UIImage *)image andSelectedImage:(UIImage *)selectedImage andTitle:(NSString *)title {
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    
    LQNavigationController *nav = [[LQNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];

}

@end

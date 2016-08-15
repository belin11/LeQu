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
#import "LQUserTool.h"
#import "LQUserResult.h"



@interface LQTabBarController () <UITabBarControllerDelegate>
{
    LQHomeViewController *_homeVC;
    LQActivityController *_activityVC;
    LQOrganizationController *_organizationVC;
    LQProfileController *_profileVC;
    NSInteger _selectIndex;
}
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
    // 第隔一段时间请求未读数
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(loadUnread) userInfo:nil repeats:YES];
 
}
#pragma mark - 请求未读数
- (void)loadUnread {
    
    // 请求微博的未读数
    [LQUserTool unReadWithSuccess:^(LQUserResult *result) {
        // 设置微博消息未读数
        _organizationVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",result.status];
        // 设置消息的未读数
        _homeVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",result.messageCount];
        // 设置我的未读数
        _profileVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",result.follower];
        // 设置应用程序的未读数
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.totalCount;
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    
    if (tabBarController.selectedIndex == 2 && _selectIndex == tabBarController.selectedIndex) {
        // 点击item刷新微博
        [_organizationVC refresh];
    }
    
    _selectIndex = tabBarController.selectedIndex;
    
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
    
    _homeVC = [[LQHomeViewController alloc]init];
    [self setUpOneChildViewControllerWith:_homeVC andImage:[UIImage imageNamed:@"0_normal"] andSelectedImage:[UIImage originImagewithImageName:@"0_selected"] andTitle:@"首页"];

    _activityVC = [[LQActivityController alloc]init];
    [self setUpOneChildViewControllerWith:_activityVC andImage:[UIImage imageNamed:@"1_normal"] andSelectedImage:[UIImage originImagewithImageName:@"1_selected"] andTitle:@"查活动"];

    _organizationVC = [[LQOrganizationController alloc]init];
    [self setUpOneChildViewControllerWith:_organizationVC andImage:[UIImage imageNamed:@"3_normal"] andSelectedImage:[UIImage originImagewithImageName:@"3_selected"] andTitle:@"找组织"];

    
    LQProfileController *profileVC = [[LQProfileController alloc]init];
    [self setUpOneChildViewControllerWith:profileVC andImage:[UIImage imageNamed:@"4_normal"] andSelectedImage:[UIImage originImagewithImageName:@"4_selected"] andTitle:@"我的"];
    _profileVC = profileVC;
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

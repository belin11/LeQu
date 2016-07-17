//
//  ViewController.m
//  LeQu
//
//  Created by apple on 16/6/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQActivityController.h"
#import "LQSearchBar.h"
#import "LQLocationButton.h"
#import "LQToolKit.h"

@interface LQActivityController ()

@end

@implementation LQActivityController

- (instancetype)init {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor purpleColor];

    [self setUpNavigationBar];
}
#pragma mark - 设置导航栏
- (void)setUpNavigationBar {
    
    // 左边
    LQLocationButton *positionBtn = [LQLocationButton buttonWithType:UIButtonTypeCustom];
    [positionBtn addTarget:self action:@selector(didClickedPosition:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithCustomView:positionBtn];
    self.navigationItem.leftBarButtonItem = barBtnItem;

    // 中间
    LQSearchBar *searchBar = [[LQSearchBar alloc]initWithFrame:CGRectMake(0, 0, kLQScreenWidth, 35)];
    searchBar.placeholder = @"活动查询";
    self.navigationItem.titleView = searchBar;

}

- (void)didClickedPosition:(UIButton *)sender {
    NSLog(@"...");
}



@end

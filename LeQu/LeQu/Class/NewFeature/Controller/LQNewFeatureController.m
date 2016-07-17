//
//  LQNewFeatureController.m
//  LeQu
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQNewFeatureController.h"
#import "LQTabBarController.h"
#import <Masonry.h>
#import "LQNewFeatureCell.h"

@interface LQNewFeatureController ()
{
    UIPageControl *_pageControl;
}
@end

@implementation LQNewFeatureController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
    
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc]init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = [UIScreen mainScreen].bounds.size;
//    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    return [super initWithCollectionViewLayout:layout];
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[LQNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.frame = CGRectMake(0, self.view.bounds.size.height - 20, self.view.bounds.size.width, 10);
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    _pageControl.numberOfPages = 3;
    _pageControl.enabled = NO;
    [self.view addSubview:_pageControl];

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LQNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
   NSArray *imageNames = @[@"1",@"2",@"3"];
    cell.imageName = imageNames[indexPath.row];
    
    if (indexPath.row == 2) {
        
        UIButton *experienceBtn = [cell createButtonWithTitle:@"立即体验"];
        [experienceBtn addTarget:self action:@selector(presentMainController:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

- (void)presentMainController:(UIButton *)sender {
    
    LQTabBarController *tab = [[LQTabBarController alloc] init];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.rootViewController = tab; //设置根控制器
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    _pageControl.currentPage = page;
    
}
@end

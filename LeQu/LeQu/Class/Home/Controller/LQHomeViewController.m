//
//  LQHomeViewController.m
//  LeQu
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQHomeViewController.h"
#import "LQToolKit.h"
#import "LQSearchBar.h"
#import "LQLocationButton.h"
#import "LQFirstSectionHeaderView.h"
#import "LQFirstCell.h"
#import "LQSecondCell.h"
#import "LQThirdCell.h"
#import "LQForthCell.h"
#import "LQTitleCell.h"

#import "UIBarButtonItem+Item.h"

#import "LQSecondSectionCell.h"

@interface LQHomeViewController ()<UICollectionViewDelegateFlowLayout>
{
    UICollectionViewFlowLayout *_layout;
}
@end

@implementation LQHomeViewController

static NSString * const reuseIdentifier = @"Cell";
//初始化要布局
- (instancetype)init {
    
    _layout = [[UICollectionViewFlowLayout alloc] init];
    return [super initWithCollectionViewLayout:_layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 当有导航栏时，不自动加64的高度
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.backgroundColor = [UIColor grayColor];
    // 第一段4种不同的cell
    [self.collectionView registerClass:[LQFirstCell class] forCellWithReuseIdentifier:@"cell1"];
    [self.collectionView registerClass:[LQSecondCell class] forCellWithReuseIdentifier:@"cell2"];
    [self.collectionView registerClass:[LQThirdCell class] forCellWithReuseIdentifier:@"cell3"];
    [self.collectionView registerClass:[LQForthCell class] forCellWithReuseIdentifier:@"cell4"];
    // 第二段2处不同的cell
    [self.collectionView registerClass:[LQTitleCell class] forCellWithReuseIdentifier:@"titleCell"];
    [self.collectionView registerClass:[LQSecondSectionCell class] forCellWithReuseIdentifier:@"secondSectionCell"];

    [self.collectionView registerClass:[LQFirstSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header2"];
    
    // 设置导航栏
    [self setUpNavigationBar];
    //设置透明
//    self.navigationController.navigationBar.translucent= NO;

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
    searchBar.placeholder = @"关键字";
    self.navigationItem.titleView = searchBar;
    
    // 右边    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"附近" image:[UIImage imageNamed:@"Location_white~iphone"] Target:self action:@selector(didClickedPosition:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didClickedPosition:(UIButton *)sender {
    NSLog(@"...");
}

#pragma mark - CollectionViewFlowDelegate
// 设置第段不同cell的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (indexPath.row >= 0 && indexPath.row < 4) {
            
            return CGSizeMake((kLQScreenWidth - 2) / 4.0, 110);
        } else if (indexPath.row >= 4 && indexPath.row < 6) {
            
            return CGSizeMake((kLQScreenWidth - 1) / 2.0, 90);
        } else if (indexPath.row >= 6 && indexPath.row < 9) {
            
            return CGSizeMake((kLQScreenWidth - 1.5) / 3.0, 120);
        } else {
            
            return CGSizeMake((kLQScreenWidth - 1) / 2.0, 100);
        }

    } else {
        
        if (indexPath.row == 0 || indexPath.row == 5) {
            
            return CGSizeMake(kLQScreenWidth, 50);
        }else {
            
            return CGSizeMake(kLQScreenWidth, 250);
        }
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return CGSizeMake(kLQScreenWidth, 250);
    }
    else {
        
        return CGSizeMake(kLQScreenWidth, 10);
    }
}
// 行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.5;
}
// 列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.5;
}

#pragma mark <UICollectionViewDataSource>
// 段数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

// cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 11;
    }
    else {
        return 10;
    }
}
// 返回4种不同的cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (indexPath.row >= 0 && indexPath.row < 4) {
            
            LQFirstCell *firstCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];

            firstCell.backgroundColor = [UIColor whiteColor];
            NSArray *imageNames = @[
                                    @"2shortLine~iphone",
                                    @"4date~iphone",
                                    @"3longLine~iphone",
                                    @"1determine~iphone"
                                    ];
            NSArray  *titles = @[
                                 @"周边游",
                                 @"国内游",
                                 @"出境游",
                                 @"目的地"
                                 ];
            firstCell.title = titles[indexPath.row];
            firstCell.imageName = imageNames[indexPath.row];
            
            return firstCell;
        } else if (indexPath.row >= 4 && indexPath.row < 6) {
            
            LQSecondCell *secondCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
            
            NSArray *titles = @[
                                @"游记分享",
                                @"当季特惠"];
            NSArray *subTitels = @[
                                   @"SHARE",
                                   @"ON SALE"];
            NSArray *imageNames = @[
                                    @"icon_car",
                                    @"icon_tiket"];
            secondCell.title = titles[indexPath.row - 4];
            secondCell.subTitle = subTitels[indexPath.row - 4];
            secondCell.imageName = imageNames[indexPath.row - 4];
            
            return secondCell;
        } else if (indexPath.row >= 6 && indexPath.row < 9) {
            
            LQThirdCell *thirdCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell3" forIndexPath:indexPath];

            NSArray *imageNames = @[
                                    @"icon_left~iphone",
                                    @"icon_middle~iphone",
                                    @"icon_right~iphone"
                                    ];
            NSArray *titles = @[
                                @"跟谁玩",
                                @"怎么玩",
                                @"去哪玩"
                                ];
            NSArray *leftTitles = @[
                                    @"达人",
                                    @"登山",
                                    @"法国"
                                    ];
            NSArray *rightTiles = @[
                                    @"俱乐部",
                                    @"徙步",
                                    @"西藏"
                                    ];
            thirdCell.imageName = imageNames[indexPath.row - 6];
            thirdCell.title = titles[indexPath.row - 6];
            thirdCell.leftTitle = leftTitles[indexPath.row - 6];
            thirdCell.rightTitle = rightTiles[indexPath.row - 6];
            
            return thirdCell;
        } else {
            
            LQForthCell *forthCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell4" forIndexPath:indexPath];

            NSArray *imageNames = @[
                                    @"text4.jpg",
                                    @"text5.jpg"
                                    ];
            forthCell.imageName = imageNames[indexPath.row - 9];
            
            return forthCell;
        }
    }
    
    else {
        
        
        if (indexPath.row == 0 || indexPath.row == 5) {
            
            LQTitleCell *titleCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"titleCell" forIndexPath:indexPath];
            if (indexPath.row ==0) {
                
                titleCell.title = @"官方活动";
            } else {
                titleCell.title = @"组织活动";
            }
            return titleCell;
        } else {
            
            LQSecondSectionCell *secondSectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"secondSectionCell" forIndexPath:indexPath];
            return secondSectionCell;
        }
    }
    
    
}

// 返回两种不同的headerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    LQFirstSectionHeaderView *header = nil;

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            
            header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
            header.backgroundColor = [UIColor greenColor];
            header.imageUrlsString = @[
                                       @"http://a.hiphotos.baidu.com/zhidao/pic/item/09fa513d269759eef5123c16b0fb43166c22dfa9.jpg",
                                       @"http://c.hiphotos.baidu.com/zhidao/pic/item/730e0cf3d7ca7bcb48f80cb9bc096b63f724a8a1.jpg",
                                       @"http://tupian.enterdesk.com/2014/lxy/2014/05/24/2/11.jpg"];
        } else {
            
            header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header2" forIndexPath:indexPath];
            header.backgroundColor = [UIColor grayColor];
        }

    }

    return header;
    
}

#pragma mark <UICollectionViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    CGFloat offY = self.collectionView.contentOffset.y;
//    CGFloat h = _layout.headerReferenceSize.height;
    CGFloat scale = self.collectionView.contentOffset.y / 250;
    if (scale <= 1) {
        
        self.navigationController.navigationBar.subviews[0].alpha = scale;
    }
    NSLog(@"%f",scale);
    
}



/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

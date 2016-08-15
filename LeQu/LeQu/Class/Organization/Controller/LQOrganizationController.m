//
//  LQOrganizationController.m
//  LeQu
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQOrganizationController.h"
#import "LQSearchBar.h"
#import "LQLocationButton.h"
#import "LQToolKit.h"
#import "UIBarButtonItem+Item.h"
// 业务层
#import "LQAccountTool.h"
//#import "LQHttpTool.h"
#import "LQStatusTool.h"
#import "LQUserTool.h"
// 数据模型层
#import "LQAccount.h"
#import "LQStatus.h"
#import "LQUser.h"
#import "LQPhoto.h"
// 第三方框架
//#import "AFNetworking.h"
//#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

@interface LQOrganizationController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
}
@property (nonatomic, strong)NSMutableArray *statuses;

@end

@implementation LQOrganizationController
/**
 *  微博数组
 *
 *  @return 微博的数组
 */
- (NSMutableArray *)statuses {
    
    if (_statuses == nil) {
        
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.view.backgroundColor = [UIColor grayColor];
    // 添加导航栏
    [self setUpNavigationBar];
    // 添加tableView
    [self createTableView];
    
    // 添加下拉刷新控件
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //请求最新的微博数据
        [self loadNewStatus];
    }];
    // 自动下拉刷新
    [_tableView.mj_header beginRefreshing];
    
    // 添加上拉加载控件
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 请求更多的微博
        [self loadMoreStatus];
    }];
    
    // 请求当前用户的昵称
    [LQUserTool userInfoWithSuccess:^(LQUser *user) {
        // 设置导航栏标题
        self.navigationItem.title = user.name;
        // 获取当前的账号
        LQAccount *account = [LQAccountTool account];
        account.name = user.name;
        
        // 保存账号
        [LQAccountTool saveAccount:account];
        
    } failure:^(NSError *error) {
        
        NSLog(@"error:%@",error);
    }];
    
    
}
#pragma mark - 创建tableView
- (void)createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kLQScreenWidth, kLQScreenHeight - 64 - 49) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma mark - 设置导航栏
- (void)setUpNavigationBar {
#if 0
    // 左边
    LQLocationButton *positionBtn = [LQLocationButton buttonWithType:UIButtonTypeCustom];
    [positionBtn addTarget:self action:@selector(didClickedPosition:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithCustomView:positionBtn];
    self.navigationItem.leftBarButtonItem = barBtnItem;
    
    // 中间
    LQSearchBar *searchBar = [[LQSearchBar alloc]initWithFrame:CGRectMake(0, 0, kLQScreenWidth, 35)];
    searchBar.placeholder = @"俱乐部";
    self.navigationItem.titleView = searchBar;
    
    // 右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"附近" image:[UIImage imageNamed:@"Location_white~iphone"] Target:self action:@selector(didClickedPosition:) forControlEvents:UIControlEventTouchUpInside];
#endif
    // 中间
    
        self.navigationItem.title = [LQAccountTool account].name?:@"首页";
}

#pragma mark - 点击tabar的第3个item刷新微博
- (void)refresh {
    
    // 自动下拉刷新
    [_tableView.mj_header beginRefreshing];
}
#pragma mark - 请求最新的微博
- (void)loadNewStatus{
    
    NSString *sinceId = nil;
    if (self.statuses.count) { // 第一次请求时self.statuses.count为空
        // 下拉刷新请求比since_id大的微博
        sinceId = [[self.statuses firstObject] idstr];
    }
    // 请求最新的微博数据
    [LQStatusTool newStatusWithSinceId:sinceId success:^(NSArray *statuses) {
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        // 把最新的微博插入到最前面
        [self.statuses insertObjects:statuses atIndexes:indexSet];
        
        [_tableView reloadData];
        // 结束下拉刷新
        [_tableView.mj_header endRefreshing];

    } failure:^(NSError *error) {
        
    }];
    
}
#pragma mark - 请求更多的旧的微博
- (void)loadMoreStatus {
        
    NSString *maxIdStr = nil;
    if (self.statuses.count) {
        
        long long maxId = [[[self.statuses lastObject] idstr] longLongValue] - 1;
        maxIdStr = [NSString stringWithFormat:@"%lld",maxId];
    }
    // 请求更多的微博数据
    [LQStatusTool moreStatusWithSinceId:maxIdStr success:^(NSArray *statuses) {
        
        [self.statuses addObjectsFromArray:statuses];
        
        [_tableView reloadData];
        // 结束上拉加载
        [_tableView.mj_footer endRefreshing];
        
    } failure:^(NSError *error) {
        
    }];

}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.statuses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    // 获取数据模型
    LQStatus *status = self.statuses[indexPath.row];
    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:nil];
    cell.textLabel.text = status.user.name;
    cell.detailTextLabel.text = status.text;
    return cell;
}


@end

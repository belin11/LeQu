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

@interface LQOrganizationController ()

@end

@implementation LQOrganizationController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.view.backgroundColor = [UIColor grayColor];
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
    searchBar.placeholder = @"俱乐部";
    self.navigationItem.titleView = searchBar;
    
    // 右边

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"附近" image:[UIImage imageNamed:@"Location_white~iphone"] Target:self action:@selector(didClickedPosition:) forControlEvents:UIControlEventTouchUpInside];
;
    
}

- (void)didClickedPosition:(UIButton *)sender {
    NSLog(@"...");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

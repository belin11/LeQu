//
//  LQStatus.h
//  LeQu
//
//  Created by apple on 16/7/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQUser.h"

@interface LQStatus : NSObject

/**
 *  微博创建时间
*/
@property (nonatomic, copy)NSString *created_at;
/**
 *  字符串型的微博ID
 */
@property (nonatomic, copy)NSString *idstr;
/**
 *  微博信息内容
 */
@property (nonatomic, copy)NSString *text;
/**
 *  微博来源
 */
@property (nonatomic, copy)NSString *source;
/**
 *  配图数组
 */
@property (nonatomic, strong)NSArray *pic_ids;
/**
 *  用户数据模型
 */
@property (nonatomic, strong)LQUser *user;
/**
 *  转发数据模型，与用户数据模型一样
 */
@property (nonatomic, strong)LQStatus *retweeted_status;
/**
 *  转发数
 */
@property (nonatomic, assign)int reposts_count;
/**
 *  评论数
 */
@property (nonatomic, assign)int comments_count;
/**
 *  点赞数
 */
@property (nonatomic, assign)int attitudes_count;

@end

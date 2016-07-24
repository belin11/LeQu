//
//  LQStatusParam.h
//  LeQu
//
//  Created by apple on 16/7/23.
//  Copyright © 2016年 Apple. All rights reserved.
//  请求参数模型

#import <Foundation/Foundation.h>

@interface LQStatusParam : NSObject
/**
 *  访问命令牌
 */
@property (nonatomic, copy)NSString *access_token;
/**
 *  比第一条微博大的id
 */
@property (nonatomic, copy)NSString *since_id;
/**
 *  比最后一条微博小的id
 */
@property (nonatomic, copy)NSString *max_id;

@end

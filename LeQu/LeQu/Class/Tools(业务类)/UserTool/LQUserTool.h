//
//  LQUserTool.h
//  LeQu
//
//  Created by apple on 16/7/24.
//  Copyright © 2016年 Apple. All rights reserved.
//  处理用户信息的业务 

#import <Foundation/Foundation.h>

@class LQUserResult, LQUser;
@interface LQUserTool : NSObject
/**
 *  用户未读数
 *
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)unReadWithSuccess:(void (^)(LQUserResult *result))success failure:(void (^)(NSError *error))failure;
/**
 *  用户信息的网络请求
 *
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)userInfoWithSuccess:(void (^)(LQUser *user))success failure:(void (^)(NSError *error))failure;

@end

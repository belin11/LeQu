//
//  LQAccountTool.h
//  LeQu
//
//  Created by apple on 16/7/10.
//  Copyright © 2016年 Apple. All rights reserved.
//  账号存储和读取的业务

#import <Foundation/Foundation.h>

@class LQAccount;
@interface LQAccountTool : NSObject
// 存储账号
+ (void)saveAccount:(LQAccount *)account;
// 取账号
+ (LQAccount *)account;
/**
 *  获取accessToken和保存账号
 *
 *  @param code    返回的code
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
+ (void)accountWithCode:(NSString *)code
                    success:(void(^)())success
                    failure:(void(^)(NSError *error))failure;
@end

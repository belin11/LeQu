//
//  LQAccount.h
//  LeQu
//
//  Created by apple on 16/7/10.
//  Copyright © 2016年 Apple. All rights reserved.
//  授权成功后的数据模型

#import <Foundation/Foundation.h>
/*
 "access_token" = "2.002QZZWGDRxicDb5a56e7adaotApwC";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 5978116777;
 */
@interface LQAccount : NSObject<NSCoding>

@property (nonatomic, copy)NSString *access_token; // 获取数据的访问命令牌
@property (nonatomic, copy)NSString *expires_in; // 账号的有效期
@property (nonatomic, copy)NSString *remind_in;// 账号的有效期
@property (nonatomic, copy)NSString *uid;// 用户唯一标识符
@property (nonatomic, copy)NSDate *expires_date; // 账号的过期时间
/**
 *  用户的昵称
 */
@property (nonatomic, strong) NSString *name;

+ (instancetype)accountWithDict:(NSDictionary *)dict;
@end

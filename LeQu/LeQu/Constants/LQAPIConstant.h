//
//  LQAPIConstant.h
//  LeQu
//
//  Created by apple on 16/7/23.
//  Copyright © 2016年 Apple. All rights reserved.
//  API接口

#import <Foundation/Foundation.h>

@interface LQAPIConstant : NSObject
// 获取微博数据的接口
FOUNDATION_EXTERN NSString * const friends_timeline_URLString;
// 获取某个用户的各种消息未读数的接口
FOUNDATION_EXTERN NSString * const unread_count_URLString;
// 获取用户信息的接口
FOUNDATION_EXTERN NSString * const userInfo_URLString;



@end

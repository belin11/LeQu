//
//  LQStatusTool.h
//  LeQu
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 Apple. All rights reserved.
//  处理微博数据的业务（数据层）

#import <Foundation/Foundation.h>

@interface LQStatusTool : NSObject
/**
 *  请求最新的微博数据
 *
 *  @param sinceId 返回比这个数更大的微博数据
 *  @param success 请求成功回调（数组里放LQStatus模型）
 *  @param failuer 请求失败回调
 */
+ (void)newStatusWithSinceId:(NSString *)sinceId
                     success:(void (^)(NSArray *statuses))success
                     failure:(void(^)(NSError *error))failure;
/**
 *  请求更多的微博数据
 *
 *  @param maxId   返回比这个数小的微博数据
 *  @param success 请求成功回调
 *  @param failure 请求失败回调
 */
+ (void)moreStatusWithSinceId:(NSString *)maxId
                     success:(void (^)(NSArray *statuses))success
                     failure:(void(^)(NSError *error))failure;
@end

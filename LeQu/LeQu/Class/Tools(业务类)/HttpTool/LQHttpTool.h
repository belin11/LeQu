//
//  LQHttpTool.h
//  LeQu
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 Apple. All rights reserved.
//  处理网络请求的业务

#import <Foundation/Foundation.h>

@interface LQHttpTool : NSObject
/**
 *  GET网络请求
 *
 *  @param URLString  请求的地址
 *  @param parameters 请求的参数
 *  @param success    请求成功的时候调用
 *  @param failure    请求失败的时候调用
 */
+ (void)GET:(NSString *)URLString
                parameters:(id)parameters
                success:(void(^)(id responseObject))success
                failuer:(void(^)(NSError *error))failure;
/**
 *  POST网络请求
 *
 *  @param URLString  请求的地址
 *  @param parameters 请求的参数
 *  @param success    请求成功的时候调用
 *  @param failure    请求失败的时候调用
 */
+ (void)POST:(NSString *)URLString
                parameters:(id)parameters
                success:(void(^)(id responseObject))success
                failuer:(void(^)(NSError *error))failure;

@end

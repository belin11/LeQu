//
//  LQStatusTool.m
//  LeQu
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQStatusTool.h"
#import "LQHttpTool.h"
#import "LQAccountTool.h"
#import "LQAccount.h"
#import "LQStatus.h"
#import "MJExtension.h"
#import "LQStatusParam.h"
#import "LQStatusResult.h"
#import "LQAPIConstant.h"

@implementation LQStatusTool

+ (void)newStatusWithSinceId:(NSString *)sinceId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure {
    
//    NSString *baseURL = @"https://api.weibo.com/2/statuses/friends_timeline.json";
//    // 创建参数字典
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    
//    params[@"access_token"] = [LQAccountTool account].access_token;
//    
//    if (sinceId) { // 第一次请求时self.statuses.count为空
//        // 下拉刷新请求比since_id大的微博
//        params[@"since_id"] = sinceId;
//    }
    
    // 创建参数模型
    LQStatusParam *param = [[LQStatusParam alloc] init];
    param.access_token = [LQAccountTool account].access_token;
    if (sinceId) {
        param.since_id = sinceId;
    }
    // 模型转字典
    NSDictionary *params = param.mj_keyValues;
    
    [LQHttpTool GET:friends_timeline_URLString parameters:params success:^(id responseObject) {
        
//        // 获取微博数据，转化为模型
//        // 获取字典数组
//        NSArray *dicArr = responseObject[@"statuses"];
//        // 字典数组转为模型
//        NSArray *statuses = [LQStatus mj_objectArrayWithKeyValuesArray:dicArr];
        // 结果字典转为结果模型
        LQStatusResult *result = [LQStatusResult mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failuer:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)moreStatusWithSinceId:(NSString *)maxId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure {
    
//    NSString *baseURL = @"https://api.weibo.com/2/statuses/friends_timeline.json";
    // 创建参数字典
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    
//    params[@"access_token"] = [LQAccountTool account].access_token;
//    
//    if (maxId) { // 第一次请求时self.statuses.count为空
//        
//        params[@"max_id"] = maxId;
//    }
    
    // 创建参数模型
    LQStatusParam *param = [[LQStatusParam alloc] init];
    param.access_token = [LQAccountTool account].access_token;
    if (maxId) {
        param.max_id = maxId;
    }

    [LQHttpTool GET:friends_timeline_URLString parameters:param.mj_keyValues success:^(id responseObject) {
        
        LQStatusResult *result = [LQStatusResult mj_objectWithKeyValues:responseObject];

        if (success) {
            success(result.statuses);
        }
        
    } failuer:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end

//
//  LQUserTool.m
//  LeQu
//
//  Created by apple on 16/7/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQUserTool.h"
#import "LQHttpTool.h"
#import "LQUserParam.h"
#import "LQBaseParam.h"
#import "LQAccountTool.h"
#import "LQAccount.h"
#import "MJExtension.h"
#import "LQAPIConstant.h"
#import "LQUserResult.h"
#import "LQUser.h"

@implementation LQUserTool

+ (void)unReadWithSuccess:(void (^)(LQUserResult *))success failure:(void (^)(NSError *))failure {
    
    // 创建参数模型
    LQUserParam *param = [LQUserParam param];
    param.uid = [LQAccountTool account].uid;
    
    // 模型转字典
    NSDictionary *params = (NSDictionary *)param.mj_keyValues;
    
    [LQHttpTool GET:unread_count_URLString parameters:params success:^(id responseObject) {
        // 字典转模型
        LQUserResult *result = [LQUserResult mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(result);
        }
    } failuer:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+ (void)userInfoWithSuccess:(void (^)(LQUser *))success failure:(void (^)(NSError *))failure {
    
    // 创建参数模型
    LQUserParam *param = [LQUserParam param];
    param.uid = [LQAccountTool account].uid;
    
    // 模型转字典
    NSDictionary *params = (NSDictionary *)param.mj_keyValues;

    [LQHttpTool GET:userInfo_URLString parameters:params success:^(id responseObject) {
        // 用户字典转用户模型
        LQUser *user = [LQUser mj_objectWithKeyValues:responseObject];
        if (success) {
            success(user);
        }
        
    } failuer:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
}
@end

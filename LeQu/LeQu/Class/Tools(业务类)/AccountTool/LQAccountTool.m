//
//  LQAccountTool.m
//  LeQu
//
//  Created by apple on 16/7/10.
//  Copyright © 2016年 Apple. All rights reserved.
//  专门处理账号的业务（存储和读取）

#import "LQAccountTool.h"
#import "LQAccount.h"
#import "LQHttpTool.h"
#import "LQRootViewControllerTool.h"
#import "LQAccountParam.h"
#import "MJExtension.h"

#define AccountPath  [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/account.plist"]
#define LQBaseURL @"https://api.weibo.com/oauth2/authorize"
#define LQClient_id  @"3320613549"
#define LQRedirect_uri @"http://www.baidu.com"
#define LQClient_secret @"e0a90f8a1df848177baebe1367aebaf5"
#define LQGrant_type @"authorization_code"


#define LQKeyWindow [UIApplication sharedApplication].keyWindow

@implementation LQAccountTool

+ (void)saveAccount:(LQAccount *)account{
    
    [NSKeyedArchiver archiveRootObject:account toFile:AccountPath];

}
// 相当于懒加载 类方法用静态变量代替成员属性
static LQAccount *_account;
+ (LQAccount *)account {
    
    if (_account == nil) {
        
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountPath];
    }
   // 判断账号有没有过期,过期就返回nil
    // 判断当前时间与有效日期的关系
    if ([[NSDate date] compare:_account.expires_date] != NSOrderedAscending) {
        // 账号过期      
        return nil;
    }
    return _account;
}

+ (void)accountWithCode:(NSString *)code success:(void (^)())success failure:(void (^)(NSError *))failure{
    
    NSString *baseURL = @"https://api.weibo.com/oauth2/access_token";
    // 创建参数模型
    LQAccountParam *param = [[LQAccountParam alloc] init];
    param.client_id = LQClient_id;
    param.client_secret = LQClient_secret;
    param.grant_type = LQGrant_type;
    param.code = code;
    param.redirect_uri = LQRedirect_uri;
    // 模型转字典
    NSDictionary *params = (NSDictionary *)param.mj_keyValues;
    // 发送POST请求
    [LQHttpTool POST:baseURL parameters:params success:^(id responseObject) {
        
        // 字典转模型
        LQAccount *account = [LQAccount accountWithDict:responseObject];
        // 保存账号信息,抽出一个业务类 以后想保存到数据库 只要对业务类进行操作
        [LQAccountTool saveAccount:account];
        
        if (success) {
            success(); // 一定要回调出去 告诉外面
        }
        
    } failuer:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}
@end

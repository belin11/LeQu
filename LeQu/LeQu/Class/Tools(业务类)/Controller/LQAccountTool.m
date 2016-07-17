//
//  LQAccountTool.m
//  LeQu
//
//  Created by apple on 16/7/10.
//  Copyright © 2016年 Apple. All rights reserved.
//  专门处理账号的业务（存储和读取）

#import "LQAccountTool.h"
#import "LQAccount.h"

#define AccountPath  [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/account.plist"]
@implementation LQAccountTool

+ (void)saveAccount:(LQAccount *)account{
    
    NSLog(@"%@",AccountPath);
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
@end

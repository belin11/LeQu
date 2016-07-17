//
//  LQAccountTool.h
//  LeQu
//
//  Created by apple on 16/7/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LQAccount;
@interface LQAccountTool : NSObject
// 存储账号
+ (void)saveAccount:(LQAccount *)account;
// 取账号
+ (LQAccount *)account;
@end

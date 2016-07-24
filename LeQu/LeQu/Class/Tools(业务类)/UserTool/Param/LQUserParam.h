//
//  LQUserParam.h
//  LeQu
//
//  Created by apple on 16/7/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQBaseParam.h"

@interface LQUserParam : LQBaseParam

/**
 *  需要获取消息未读数的用户UID，必须是当前登录用户
 */
@property (nonatomic, copy) NSString *uid;

@end

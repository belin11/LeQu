//
//  LQBaseParam.h
//  LeQu
//
//  Created by apple on 16/7/23.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQBaseParam : NSObject
/**
 *  访问命令牌
 */
@property (nonatomic, copy)NSString *access_token;

+ (instancetype)param;
@end

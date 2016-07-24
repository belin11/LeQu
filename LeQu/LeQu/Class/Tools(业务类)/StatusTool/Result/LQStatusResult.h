//
//  LQStatusResult.h
//  LeQu
//
//  Created by apple on 16/7/23.
//  Copyright © 2016年 Apple. All rights reserved.
//  结果的参数模型

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface LQStatusResult : NSObject <MJKeyValue>
/**
 *  请求的微博数据(LQStatus模型) 
 */
@property (nonatomic, strong)NSArray *statuses;

@end

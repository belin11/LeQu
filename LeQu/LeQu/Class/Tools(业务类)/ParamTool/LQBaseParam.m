//
//  LQBaseParam.m
//  LeQu
//
//  Created by apple on 16/7/23.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQBaseParam.h"
#import "LQAccountTool.h"
#import "LQAccount.h"

@implementation LQBaseParam

+ (instancetype)param {
    
    LQBaseParam *param = [[self alloc] init];
    param.access_token = [LQAccountTool account].access_token;
    
    return param;
}
@end

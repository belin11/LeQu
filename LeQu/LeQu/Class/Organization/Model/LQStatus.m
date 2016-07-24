//
//  LQStatus.m
//  LeQu
//
//  Created by apple on 16/7/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQStatus.h"
#import "LQPhoto.h"
#import "MJExtension.h"

@interface LQStatus () <MJKeyValue>

@end

@implementation LQStatus

// 把数组中的字典转化为数据模型
+ (NSDictionary *)mj_objectClassInArray {
    
    return @{@"pic_ids":[LQPhoto class]};
}

@end

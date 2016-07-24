//
//  LQStatusResult.m
//  LeQu
//
//  Created by apple on 16/7/23.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQStatusResult.h"
#import "LQStatus.h"

@implementation LQStatusResult

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{
             @"statuses":[LQStatus class]
             };
}
@end

//
//  LQUserTool.h
//  LeQu
//
//  Created by apple on 16/7/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQUserResult.h"

@interface LQUserTool : NSObject

+ (void)unReadWithSuccess:(void (^)(LQUserResult *result))success failure:(void (^)(NSError *error))failure;

@end

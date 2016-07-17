//
//  LQAccount.m
//  LeQu
//
//  Created by apple on 16/7/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQAccount.h"

#define kAccess_token @"access_token"
#define KExpires_in @"expires_in"
#define KUid @"uid"
#define KExpires_date @"expires_date"

@implementation LQAccount

+ (instancetype)accountWithDict:(NSDictionary *)dict {
    
    LQAccount *acconut = [[self alloc] init];
    [acconut setValuesForKeysWithDictionary:dict];
    
    return acconut;
}

- (void)setExpires_in:(NSString *)expires_in {
    
    _expires_in = expires_in;
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:_expires_in.floatValue];
    
}
// 归档的时候调用
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_access_token forKey:kAccess_token];
    [aCoder encodeObject:_expires_in forKey:KExpires_in];
    [aCoder encodeObject:_uid forKey:KUid];
    [aCoder encodeObject:_expires_date forKey:KExpires_date];
}
// 解归的时候调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        // 一定要记行赋值
        _access_token = [aDecoder decodeObjectForKey:kAccess_token];
        _expires_in = [aDecoder decodeObjectForKey:KExpires_in];
        _uid = [aDecoder decodeObjectForKey:KUid];
        _expires_date = [aDecoder decodeObjectForKey:KExpires_date];
    }
    return self;
}
@end

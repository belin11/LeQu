//
//  LQUserResult.m
//  LeQu
//
//  Created by apple on 16/7/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQUserResult.h"

@implementation LQUserResult

- (NSInteger)messageCount {
    
    return _dm + _mention_cmt + _mention_status + _cmt;
}

- (NSInteger)totalCount {
    
    return self.messageCount + _status + _follower;
}
@end

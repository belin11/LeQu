//
//  LQUserResult.h
//  LeQu
//
//  Created by apple on 16/7/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQUserResult : NSObject

/**
*  	新微博未读数
*/
@property (nonatomic, assign) NSInteger status;

/**
 *  新评论数
 */
@property (nonatomic, assign) NSInteger cmt;

/**
 *  新提及我的微博数
 */
@property (nonatomic, assign) NSInteger mention_status;

/**
 *  新提及我的评论数
 */
@property (nonatomic, assign) NSInteger mention_cmt;

/**
 *  新私信数
 */
@property (nonatomic, assign) NSInteger dm;

/**
 *  新粉丝数
 */
@property (nonatomic, assign) NSInteger follower;
/**
 *  消息的总和
 *
 *  @return 消息的个数
 */
- (NSInteger)messageCount;
/**
 *  未读数的总和
 *
 *  @return 个数
 */
- (NSInteger)totalCount;
@end

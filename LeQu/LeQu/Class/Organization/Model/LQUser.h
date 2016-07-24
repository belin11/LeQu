//
//  LQUser.h
//  LeQu
//
//  Created by apple on 16/7/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQUser : NSObject

/**
*  用户的昵称
*/
@property (nonatomic, copy)NSString *name;
/**
 *  用户的头像
 */
@property (nonatomic, copy)NSURL *profile_image_url;

@end

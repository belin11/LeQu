//
//  LQAccountParam.h
//  LeQu
//
//  Created by apple on 16/7/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQAccountParam : NSObject
/**
*  申请应用时分配的AppKey。
*/
@property (nonatomic, copy) NSString *client_id;
/**
 *  申请应用时分配的AppSecret
 */
@property (nonatomic, copy) NSString *client_secret;
/**
 *  请求的类型，填写authorization_code
 */
@property (nonatomic, copy) NSString *grant_type;
/**
 *  调用authorize获得的code值
 */
@property (nonatomic, copy) NSString *code;
/**
 *  回调地址，需需与注册应用里的回调地址一致
 */
@property (nonatomic, copy) NSString *redirect_uri;

@end
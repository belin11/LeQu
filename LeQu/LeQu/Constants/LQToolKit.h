//
//  LQToolKit.h
//  LeQu
//
//  Created by apple on 16/6/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLQIsIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kLQIsRetina  ([UIScreen mainScreen].scale >= 2.0)

#define kLQScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kLQScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define kLQScreenMaxLength (MAX(kGBScreenHeight, kGBScreenWidth))
#define kLQScreenMinLength (MIN(kGBScreenHeight, kGBScreenWidth))

#define kLQIsIPone4SOrLess (kGBIsIPhone && kGBScreenMaxLength < 568.0)
#define kLQIsIPone5or5S (kGBIsIPhone && kGBScreenMaxLength == 568.0)
#define kLQIsIPone6or6S (kGBIsIPhone && kGBScreenMaxLength == 667.0)
#define kLQIsIPone6Por6SP (kGBIsIPhone && kGBScreenMaxLength == 736.0)

#define IMG(name) ([UIImage ImageNamed: name])
#define Color(red,green,blue) ([UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0])

#define Notif_Post(name,obj,data) [[NSNotificationCenter defaultCenter] postNotificationName:(name) object:(obj) userInfo:(data)];

#define Notif_Add(name1,method,name2,obj)     [[NSNotificationCenter defaultCenter]addObserver:name1 selector:@selector(method) name:kGBCategoryNotif object:nil];

//
//  UIBarButtonItem+Item.h
//  LeQu
//
//  Created by apple on 16/6/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title image:(UIImage *)image Target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end

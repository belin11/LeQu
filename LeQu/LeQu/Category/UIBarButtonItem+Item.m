//
//  UIBarButtonItem+Item.m
//  LeQu
//
//  Created by apple on 16/6/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title image:(UIImage *)image Target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 35);
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    
    // 向右偏移5个pt
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button addTarget:target action:action forControlEvents:controlEvents];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
    
}

@end

//
//  LQTabBar.m
//  LeQu
//
//  Created by apple on 16/6/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQTabBar.h"

@implementation LQTabBar

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat heigth = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    //self.items 获取所有的子控制器
    CGFloat btnW = width / (self.items.count + 1);
    CGFloat btnH = heigth;
    
    NSInteger i = 0;
    for (UIView *tabBarButton in self.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i++;
        }
    }
    //设置按钮的位置
    self.plusButton.center = CGPointMake(width * 0.5, heigth * 0.5);
}

- (UIButton *)plusButton {
    
    if (_plusButton == nil) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        
        _plusButton = button;
        //大小跟背景图片一样大
        [_plusButton sizeToFit];
        [self addSubview:_plusButton];
    }
    
    return _plusButton;
}

@end

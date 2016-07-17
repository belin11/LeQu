//
//  LQSearchBar.m
//  LeQu
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQSearchBar.h"

@implementation LQSearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.font = [UIFont systemFontOfSize:13];
        // 设置背景图片
        self.background = [UIImage imageNamed:@"searchBar_bk~iphone"];
        // 设置左边图片
        UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_white~iphone"]];
        CGRect rect = leftImageView.bounds;
        rect.size.width += 10;
        leftImageView.frame = rect;
        leftImageView.contentMode = UIViewContentModeCenter;
        self.leftView = leftImageView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        // 设置右边图片
        UIImageView *rigthImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"code_bk~iphone"]];
        UIImageView *codeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"code~iphone"]];
        codeImageView.center = rigthImageView.center;
        [rigthImageView addSubview:codeImageView];
        self.rightView = rigthImageView;
        self.rightViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
}

@end

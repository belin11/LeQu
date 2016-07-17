//
//  LQFirstCell.m
//  LeQu
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQFirstCell.h"
#import <Masonry.h>

@interface LQFirstCell ()
{
    UIButton *_button;
}

@end

@implementation LQFirstCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = self.bounds;
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        _button.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_button];
        
    }
    return self;
}

- (void)setImageName:(NSString *)imageName {
    
    [_button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    // 获得高度和宽度
    CGFloat imageH = _button.imageView.frame.size.height;
    CGFloat imageW = _button.imageView.frame.size.width;
    CGFloat titleH = _button.titleLabel.frame.size.height;
    CGFloat titleW = _button.titleLabel.frame.size.width;
    // 设置button标题偏移量
    [_button setTitleEdgeInsets:UIEdgeInsetsMake(0, - imageW,  - imageH, 0)];
    // 设置button图片偏移量
    [_button setImageEdgeInsets:UIEdgeInsetsMake(- titleH, 0, 0, - titleW)];
//    NSLog(@"image:%@",NSStringFromUIEdgeInsets(_button.imageEdgeInsets));
//    NSLog(@"title:%@",NSStringFromUIEdgeInsets(_button.titleEdgeInsets));

}

- (void)setTitle:(NSString *)title {
    
    [_button setTitle:title forState:UIControlStateNormal];
}

@end

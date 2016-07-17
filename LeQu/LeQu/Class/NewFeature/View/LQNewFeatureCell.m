//
//  LQNewFeatureCell.m
//  LeQu
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQNewFeatureCell.h"
#import <Masonry.h>

@interface LQNewFeatureCell ()

@property (nonatomic, weak)UIImageView *imageView;

@end

@implementation LQNewFeatureCell

- (UIImageView *)imageView {
    
    if (_imageView == nil) {
        
       UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView = imageView;
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (void)setImageName:(NSString *)imageName {
    
    self.imageView.image = [UIImage imageNamed:imageName];
}

- (UIButton *)createButtonWithTitle:(NSString *)title{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.top.equalTo(self.contentView.mas_bottom).offset(-120);
    }];
    return button;
}
@end

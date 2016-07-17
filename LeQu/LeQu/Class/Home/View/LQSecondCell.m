//
//  LQSecondCell.m
//  LeQu
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQSecondCell.h"
#import <Masonry.h>

@interface LQSecondCell ()
{
    UIImageView *_imageView;
    UILabel *_titleLable;
    UILabel *_subLabel;
}

@end

@implementation LQSecondCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        // 设置左边图片
        _imageView = [UIImageView new];
        [self.contentView addSubview:_imageView];
        // 设置标题
        _titleLable = [[UILabel alloc]init];
        [self.contentView addSubview:_titleLable];
        // 设置子标题
        _subLabel = [[UILabel alloc] init];
        _subLabel.font = [UIFont systemFontOfSize:13];
        _subLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_subLabel];
    }
    
    return self;
}
#pragma mark - 设置标题
- (void)setSubTitle:(NSString *)subTitle {
    _subLabel.text = subTitle;
}
- (void)setTitle:(NSString *)title {
    _titleLable.text = title;
}

- (void)setImageName:(NSString *)imageName {
    
    _imageView.image = [UIImage imageNamed:imageName];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(self.contentView.bounds.size.width * 1/2);
    }];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(25);
        make.left.equalTo(_imageView.mas_right).offset(5);
        make.height.equalTo(@20);
        
    }];
    
    [_subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleLable.mas_bottom).offset(5);
        make.left.equalTo(_titleLable.mas_left);
        make.height.equalTo(@16);
    }];
}
@end

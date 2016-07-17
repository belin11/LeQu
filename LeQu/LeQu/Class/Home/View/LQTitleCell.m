//
//  LQTitleCell.m
//  LeQu
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQTitleCell.h"
#import <Masonry.h>

@interface LQTitleCell ()
{
    UILabel *_titleLable;
    UIImageView *_arrowImageView;
}

@end
@implementation LQTitleCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        // 设置标题lable
        _titleLable = [UILabel new];
        _titleLable.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLable];
        // 设置箭头
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"more~iphone"]];
        [self.contentView addSubview:_arrowImageView];
        
    }
    return self;
}


- (void)setTitle:(NSString *)title {
    
    _titleLable.text = title;
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(5);
        make.centerY.equalTo(self.contentView.mas_centerY);
        
    }];
    
    [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(@(-10));
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
}
@end

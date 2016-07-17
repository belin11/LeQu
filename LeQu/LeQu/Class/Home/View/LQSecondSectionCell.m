//
//  LQSecondSectionFirstCell.m
//  LeQu
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQSecondSectionCell.h"
#import <Masonry.h>


@interface LQSecondSectionCell ()
{
    UIImageView *_fillImageView;
    UILabel *_priceLable;
    UILabel *_titleLable;
    UILabel *_timeLable;
    UILabel *_daysLable;
    UIImageView *_starsImageView;
    UILabel *_starsLabel;
}

@end

@implementation LQSecondSectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        // 背景图片
        _fillImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, 180)];
        _fillImageView.image= [UIImage imageNamed:@"text6"];
        [self.contentView addSubview:_fillImageView];
        // 价格lable
        _priceLable = [UILabel new];
        _priceLable.textColor = [UIColor whiteColor];
        _priceLable.text = @"¥100.00";
        _priceLable.layer.cornerRadius = 10;
        _priceLable.layer.masksToBounds = YES;
        _priceLable.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_priceLable];
        
        // 标题lable
        _titleLable = [UILabel new];
        _timeLable.font = [UIFont systemFontOfSize:15];
        _titleLable.text = @"2016 UTMB发现之旅";
        [self.contentView addSubview:_titleLable];
        
        // 时间lable
        _timeLable = [UILabel new];
        _timeLable.text = @"出发08/19";
        _timeLable.layer.cornerRadius = 3;
        _timeLable.layer.borderWidth = 0.5;
        [self.contentView addSubview:_timeLable];
        
        // 天数lable
        _daysLable = [UILabel new];
        _daysLable.text = @"14天";
        _daysLable.layer.cornerRadius = 3;
        _daysLable.layer.borderWidth = 0.5;
        [self.contentView addSubview:_daysLable];

        // 关注数lable
        _starsLabel = [UILabel new];
        _starsLabel.text = @"10";
        [self.contentView addSubview:_starsLabel];
        
        // 心形图片
        _starsImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart_34_blue~iphone"]];
        [self.contentView addSubview:_starsImageView];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [_priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_fillImageView.mas_left).offset(10);
        make.bottom.equalTo(_fillImageView.mas_bottom).offset(-10);
        make.height.equalTo(@25);
    }];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_fillImageView.mas_bottom).offset(5);
        make.left.equalTo(@10);
        make.right.equalTo(@(-10));
    }];
    
    [_timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleLable.mas_bottom).offset(5);
        make.left.equalTo(@10);
    }];
    
    [_daysLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_timeLable.mas_top);
        make.left.equalTo(_timeLable.mas_right).offset(10);
    }];
    
    [_starsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_daysLable.mas_top);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    [_starsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_starsLabel.mas_centerY);
        make.right.equalTo(_starsLabel.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
}
@end

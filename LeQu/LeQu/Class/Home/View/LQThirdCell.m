//
//  LQThirdCollectionViewCell.m
//  LeQu
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQThirdCell.h"
#import <Masonry.h>

@interface LQThirdCell ()
{
    UIImageView *_backgroundImageView;
    UIView *_view;
    UILabel *_titleLable;
    UIButton *_leftBtn;
    UIButton *_rigthBtn;
}
@end

@implementation LQThirdCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        // 设置背景图片
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.frame = self.contentView.bounds;
        [self.contentView addSubview:_backgroundImageView];
        
        //  有点透明的view
        _view = [[UIView alloc] init];
        _view.alpha = 0.5;
        _view.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_view];
        
        //  设置主题lable
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:13];
        [_view addSubview:_titleLable];
        
        // 设置左边button
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _leftBtn.layer.cornerRadius = 5;
        _leftBtn.layer.borderWidth = 1;
        [_view addSubview:_leftBtn];
        
        // 设置右边button
        _rigthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rigthBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _rigthBtn.layer.cornerRadius = 5;
        _rigthBtn.layer.borderWidth = 1;
        [_view addSubview:_rigthBtn];
    }
    return self;
}

- (void)setImageName:(NSString *)imageName {
    
    _backgroundImageView.image = [UIImage imageNamed:imageName];
    
}

- (void)setTitle:(NSString *)title {
    
    _titleLable.text = title;
}

- (void)setLeftTitle:(NSString *)leftTitle {
    
    [_leftBtn setTitle:leftTitle forState:UIControlStateNormal];
}

- (void)setRightTitle:(NSString *)rightTitle {
    
    [_rigthBtn setTitle:rightTitle forState:UIControlStateNormal];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(self.contentView.bounds.size.height * 0.5));
    }];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.mas_top).offset(5);
        make.centerX.equalTo(_view.mas_centerX);
        make.height.equalTo(@16);
    }];
    
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@5);
        make.top.equalTo(_titleLable.mas_bottom).offset(5);
        make.bottom.equalTo(_view.mas_bottom).offset(-5);
        make.right.equalTo(_view.mas_right).multipliedBy(0.5).offset(-2.5);
    }];
    
    [_rigthBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(@(-5));
        make.top.equalTo(_leftBtn.mas_top);
        make.bottom.equalTo(_leftBtn.mas_bottom);
        make.left.equalTo(_leftBtn.mas_right).offset(5);
    }];
    
}
@end

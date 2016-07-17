//
//  LQForthCell.m
//  LeQu
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQForthCell.h"
#import <Masonry.h>

@interface LQForthCell ()
{
    UIImageView *_imageView;
}
@end

@implementation LQForthCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];

        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_imageView];
        
    }
    return self;
}

- (void)setImageName:(NSString *)imageName {
    
    _imageView.image = [UIImage imageNamed:imageName];
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(@5);
        make.right.bottom.equalTo(@(-5));
    }];
}
@end

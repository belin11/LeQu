//
//  LQPositionButton.m
//  LeQu
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQLocationButton.h"

@implementation LQLocationButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitle:@"长沙市" forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"more_white~iphone"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)didMoveToSuperview {
    
    [super didMoveToSuperview];
    
    self.frame = CGRectMake(0, 0, 60, 35);

    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 14)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 48, 0, 0)];

}


@end


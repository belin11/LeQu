//
//  LQHeaderView.m
//  LeQu
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LQFirstSectionHeaderView.h"
#import <SDCycleScrollView.h>
@interface LQFirstSectionHeaderView () <SDCycleScrollViewDelegate>
{
    SDCycleScrollView *_cycleScrollView;
}
@end

@implementation LQFirstSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:nil];

        _cycleScrollView.showPageControl = YES;
        _cycleScrollView.autoScroll = YES;
        _cycleScrollView.autoScrollTimeInterval =2;
        _cycleScrollView.infiniteLoop = YES;
        _cycleScrollView.pageDotColor  = [UIColor grayColor];
        _cycleScrollView .currentPageDotColor = [UIColor whiteColor];
        [self addSubview:_cycleScrollView];
        
    }
    return self;
}

- (void)setImageUrlsString:(NSArray *)imageUrlsString {
    
    _imageUrlsString = imageUrlsString;
    _cycleScrollView.imageURLStringsGroup = _imageUrlsString;
    
}

@end

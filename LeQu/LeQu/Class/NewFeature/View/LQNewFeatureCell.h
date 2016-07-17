//
//  LQNewFeatureCell.h
//  LeQu
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQNewFeatureCell : UICollectionViewCell

@property (nonatomic, strong)NSString *imageName;

- (UIButton *)createButtonWithTitle:(NSString *)title;
@end

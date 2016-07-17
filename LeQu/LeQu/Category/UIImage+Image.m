
//
//  UIImage+Image.m
//  LeQu
//
//  Created by apple on 16/6/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
//返回原图渲染
+(instancetype)originImagewithImageName:(NSString *)imageName {
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end

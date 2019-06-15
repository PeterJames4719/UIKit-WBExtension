//
//  UIButton+Adjust.m
//  BustVideo
//
//  Created by wubing on 16/9/6.
//  Copyright © 2016年 wubing. All rights reserved.
//

#import "UIButton+Adjust.h"

@implementation UIButton (Adjust)

- (void)ext_adjustImageUpTitleDownWithSpace:(CGFloat)space
{
    CGSize imageSize = self.imageView.image.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + space), 0.0);
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + space), 0.0, 0.0, - titleSize.width);
    
    self.imageView.clipsToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    CGFloat edgeOffset = fabs(titleSize.height - imageSize.height) / 2.0;
    self.contentEdgeInsets = UIEdgeInsetsMake(edgeOffset, 0.0, edgeOffset, 0.0);
}

@end

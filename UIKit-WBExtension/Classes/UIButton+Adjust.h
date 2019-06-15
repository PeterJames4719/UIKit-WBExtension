//
//  UIButton+Adjust.h
//  BustVideo
//
//  Created by wubing on 16/9/6.
//  Copyright © 2016年 wubing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Adjust)

/**
 *  图片在上，title在下
 *
 *  @param space 图片和title的间距
 */
- (void)ext_adjustImageUpTitleDownWithSpace:(CGFloat)space;

@end

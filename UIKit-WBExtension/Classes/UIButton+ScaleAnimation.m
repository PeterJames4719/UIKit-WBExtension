//
//  UIButton+ScaleAnimation.m
//  BustVideo
//
//  Created by wubing on 2016/12/23.
//  Copyright © 2016年 360Video. All rights reserved.
//

#import "UIButton+ScaleAnimation.h"

@implementation UIButton(ScaleAnimation)

- (void)ext_scaleAnimateWithScale:(CGFloat)scale andDuration:(CGFloat)duration
{
    UIView *animateView = self;
    if ([self titleForState:UIControlStateNormal]) {
        animateView = self.imageView;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithDouble:scale];
    animation.repeatCount = 1;
    animation.duration = duration;
    animation.autoreverses = YES;
    animation.removedOnCompletion = YES;
    [animateView.layer removeAnimationForKey:@"transform.scale"];
    [animateView.layer addAnimation:animation forKey:@"transform.scale"];
}

@end

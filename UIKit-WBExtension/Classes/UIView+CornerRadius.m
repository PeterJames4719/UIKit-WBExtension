//
//  UIView+CornerRadius.m
// 
//
//  Created by 兵伍 on 2019/3/26.
//  Copyright © 2019年 兵伍. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView(CornerRadius)

- (void)ext_setCorner:(UIRectCorner)corner radius:(NSInteger)radius {
    [self ext_setCorner:corner radius:radius bounds:self.bounds];
}

- (void)ext_setCorner:(UIRectCorner)corner radius:(NSInteger)radius bounds:(CGRect)bounds {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = self.layer.mask;
    if (!maskLayer) {
        maskLayer = [[CAShapeLayer alloc] init];
    }
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}




@end

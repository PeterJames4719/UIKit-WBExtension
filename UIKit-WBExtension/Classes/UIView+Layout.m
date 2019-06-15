//
//  UIView+(Layout).m
//  WBFramework
//
//  Created by peter on 16/2/27.
//  Copyright © 2016年 wubing. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView(Layout)

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}
- (void)setHeight: (CGFloat) newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}
- (void)setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat)top
{
    return CGRectGetMinY(self.frame);
}
- (void)setTop: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat)left
{
    return CGRectGetMinX(self.frame);
}
- (void)setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}
- (void)setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}
- (void)setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}
- (CGFloat)centerX
{
    return CGRectGetMidX(self.frame);
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}
- (CGFloat)centerY
{
    return CGRectGetMidY(self.frame);
}

@end

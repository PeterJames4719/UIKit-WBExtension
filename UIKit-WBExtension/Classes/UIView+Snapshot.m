//
//  UIView+Snapshot.m
// 
//
//  Created by 兵伍 on 2019/4/14.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import "UIView+Snapshot.h"

@implementation UIView(Snapshot)

- (UIImage *)ext_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

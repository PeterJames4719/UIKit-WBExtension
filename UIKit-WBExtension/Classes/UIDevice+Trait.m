//
//  UIDevice+Trait.m
//  BustVideo
//
//  Created by wubing on 2017/11/14.
//  Copyright © wubing. All rights reserved.
//

#import "UIDevice+Trait.h"

BOOL ext_isIPhoneX;

@implementation UIDevice(Trait)

- (BOOL)ext_isIPhoneX {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {
            if ([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom > 0) {
                ext_isIPhoneX = YES;
            }
        } else {
            NSInteger height = MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            ext_isIPhoneX = (height == 812) || (height == 896);
        }
        
    });
    return ext_isIPhoneX;
}

@end

//
//  UIScreen+Utility.m
// 
//
//  Created by 兵伍 on 2019/4/5.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import "UIScreen+Utility.h"
#import "UIDevice+Trait.h"

@implementation UIScreen(Utility)

+ (CGFloat)ext_screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)ext_navigationBarHeight {
    if ([UIDevice currentDevice].ext_isIPhoneX) {
        return 88;
    }
    return 64;
}

+ (CGFloat)ext_tabBarHeight {
    if ([UIDevice currentDevice].ext_isIPhoneX) {
        return 83;
    }
    return 49;
}

+ (CGFloat)ext_statusBarHeight {
    if ([UIDevice currentDevice].ext_isIPhoneX) {
        return 44;
    }
    return 20;
}

+ (CGFloat)ext_homeIndicatorHeight {
    if ([UIDevice currentDevice].ext_isIPhoneX) {
        return 35;
    }
    return 0;
}

+ (CGRect)ext_safeArea {
    if ([UIDevice currentDevice].ext_isIPhoneX) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        return CGRectMake(0, 44, MIN(screenSize.width, screenSize.height), MAX(screenSize.width, screenSize.height) - 44 - 35);
    } else {
        return [UIScreen ext_screenRect];
    }
}

+ (CGRect)ext_safeAreaForLandscape {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ([UIDevice currentDevice].ext_isIPhoneX) {
        return CGRectMake(44, 0, MAX(screenSize.width, screenSize.height) - 88, MIN(screenSize.width, screenSize.height));
    } else {
        return [[self class] ext_screenRectForLandscape];
    }
}

+ (CGRect)ext_screenRect {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    return CGRectMake(0, 0, MIN(screenSize.width, screenSize.height), MAX(screenSize.width, screenSize.height));
}

+ (CGRect)ext_screenRectForLandscape {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    return CGRectMake(0, 0, MAX(screenSize.width, screenSize.height), MIN(screenSize.width, screenSize.height));
}

+ (CGFloat)ext_onePixelWidth {
    return 1.0 / [UIScreen mainScreen].scale;
}

@end

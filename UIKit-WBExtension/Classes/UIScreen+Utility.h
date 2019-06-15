//
//  UIScreen+Utility.h
// 
//
//  Created by 兵伍 on 2019/4/5.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen(Utility)
+ (CGFloat)ext_screenWidth;
+ (CGFloat)ext_navigationBarHeight;
+ (CGFloat)ext_tabBarHeight;
+ (CGFloat)ext_statusBarHeight;
+ (CGRect)ext_safeArea;
+ (CGRect)ext_safeAreaForLandscape;
+ (CGFloat)ext_homeIndicatorHeight;
+ (CGRect)ext_screenRect;
+ (CGRect)ext_screenRectForLandscape;

// 返回一像素宽度
+ (CGFloat)ext_onePixelWidth;

@end

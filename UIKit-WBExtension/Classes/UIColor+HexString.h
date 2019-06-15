//
//  UIColor+HexString.h
// 
//
//  Created by 兵伍 on 2019/4/5.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(HexString)
+ (UIColor *)ext_colorForHex:(NSString *)hexColor;
+ (UIColor *)ext_colorForHex:(NSString *)hexColor forAlpha:(CGFloat)alpha;
@end

//
//  UIDevice+Utility.h
// 
//
//  Created by 兵伍 on 2019/4/5.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice(Utility)

// 系统版本
+ (CGFloat)ext_systemVersionFloat;
+ (NSString *)ext_systemVersion;

+ (void)setDeviceUniqueIdLocalKey:(NSString *)key;
+ (NSString *)ext_uniqueId;
+ (BOOL)ext_isJailBreak;
+ (void)ext_impact;
@end

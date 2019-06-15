//
//  UIApplication+Utility.h
// 
//
//  Created by 兵伍 on 2019/4/5.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication(Utility)
// 打开App设置
+ (void)ext_openSystemAppSetting;

// App 版本
+ (NSString *)ext_appFullVersion;
+ (NSString *)ext_appBuildVersion;
+ (NSString *)ext_appVersion;
@end

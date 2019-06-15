//
//  UIApplication+Utility.m
// 
//
//  Created by 兵伍 on 2019/4/5.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import "UIApplication+Utility.h"

static NSString *version;
static NSString *buildVersion;
static NSString *fullVersion;

@implementation UIApplication(Utility)

+ (void)ext_openSystemAppSetting {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

// App版本
+ (NSString *)ext_appFullVersion {
    if (!fullVersion) {
        NSString *version = [[self class] ext_appVersion];
        NSString *build = [[self class] ext_appBuildVersion];
        NSString *full = [version stringByAppendingFormat:@"(%@)", build];
        fullVersion = full;
    }
    return fullVersion;
}

+ (NSString *)ext_appBuildVersion
{
    if (!buildVersion) {
        NSDictionary *infoDict =[[NSBundle mainBundle] infoDictionary];
        NSString *applicationVersion = [infoDict objectForKey:@"CFBundleVersion"];
        buildVersion = applicationVersion;
    }
    return buildVersion;
}

+ (NSString *)ext_appVersion
{
    if (!version) {
        NSDictionary *infoDict =[[NSBundle mainBundle] infoDictionary];
        NSString *applicationVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
        version = applicationVersion;
    }
    return version;
}

@end

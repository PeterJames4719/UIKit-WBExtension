//
//  UIDevice+Utility.m
// 
//
//  Created by 兵伍 on 2019/4/5.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import "UIDevice+Utility.h"
#import "SAMKeychain.h"
#import "NSString+MD5.h"


static UIImpactFeedbackGenerator *impactFeedback = nil;

char* printEnv(void) {
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    NSLog(@"DYLD inert libs:%s", env);
    return env;
}


static NSString *deviceUniqueId;
static NSString *deviceUniqueIdLocalKey;
static NSInteger isJailBreak = -1;

@implementation UIDevice(Utility)

// 系统版本
+ (CGFloat)ext_systemVersionFloat {
    return [[[self class] ext_systemVersion] floatValue];
}

+ (NSString *)ext_systemVersion {
    UIDevice *device = [UIDevice currentDevice];
    NSString *iOSVersion = [device systemVersion];
    return iOSVersion;
}

// bundleId
+ (NSString *)getBundleId {
    return [NSBundle mainBundle].bundleIdentifier;
}

+ (void)setDeviceUniqueIdLocalKey:(NSString *)key {
    deviceUniqueIdLocalKey = key;
}

// 设备ID
+ (NSString *)ext_uniqueId {
    if (deviceUniqueId.length > 0) {
        return deviceUniqueId;
    }
    
    NSString *bundleId = [[self class] getBundleId];
    NSString *uuidKey = deviceUniqueIdLocalKey;
    if (!uuidKey) {
        uuidKey = @"*device_unique_id_local_key#";
    }
    //本地获取uniqueId
    NSString *uniqueId = [SAMKeychain passwordForService:bundleId
                                                 account:uuidKey];
    
    if (uniqueId == nil || uniqueId.length == 0) {
        //uniqueId
        NSUUID *uuid = [UIDevice currentDevice].identifierForVendor;
        uniqueId = [uuid.UUIDString md5_string];
        deviceUniqueId = uniqueId;
        //本地保存uniqueId
        [SAMKeychain setPassword:uniqueId
                      forService:bundleId
                         account:uuidKey];
    } else {
        deviceUniqueId = uniqueId;
    }
    
    return uniqueId;
}

+ (BOOL)ext_isJailBreak {
#if TARGET_IPHONE_SIMULATOR
    return YES;
#else
    if (isJailBreak >= 0) {
        return isJailBreak;
    }
    
    // 2
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        isJailBreak = YES;
        return YES;
    }
    
    // 3
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"User/Applications/"]) {
        isJailBreak = YES;
        return YES;
    }
    
    // 4
    if (printEnv()) {
        isJailBreak = YES;
        return YES;
    }
    
    // 1
    NSArray *jailbreak_tool_paths = @[
                                      @"/Applications/Cydia.app",
                                      @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                                      @"/bin/bash",
                                      @"/usr/sbin/sshd",
                                      @"/etc/apt"
                                      ];
    
    for (int i = 0; i < jailbreak_tool_paths.count; i++) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:jailbreak_tool_paths[i]]) {
            isJailBreak = YES;
            return YES;
        }
    }

    isJailBreak = NO;
    return NO;
#endif
    
}

+ (void)ext_impact {
    if (@available(iOS 10.0, *)) {
        if (!impactFeedback) {
           impactFeedback = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleMedium];
        }
        [impactFeedback prepare];
        [impactFeedback impactOccurred];
    } else {
        // Fallback on earlier versions
    }
}

@end






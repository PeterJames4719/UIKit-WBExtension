//
//  UIDevice+Authorization.m
// 
//
//  Created by 兵伍 on 2019/8/7.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import "UIDevice+Authorization.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

@implementation UIDevice(Authorization)

+ (BOOL)ext_isAlbumEnable {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}

+ (BOOL)ext_isCameraEnable
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}

@end

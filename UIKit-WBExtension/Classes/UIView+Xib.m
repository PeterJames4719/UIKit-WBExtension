//
//  UIView+Xib.m
// 
//
//  Created by 兵伍 on 2019/4/11.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import "UIView+Xib.h"

@implementation UIView(Xib)

+ (instancetype)ext_loadViewFromXib
{
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"className:%@", className);
    NSArray *tmpArray = [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil];
    if (tmpArray.count > 0)
    {
        return tmpArray[0];
    }
    return nil;
}

@end

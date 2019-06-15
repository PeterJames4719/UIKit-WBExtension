//
//  UIView+CornerRadius.h
// 
//
//  Created by 兵伍 on 2019/3/26.
//  Copyright © 2019年 兵伍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(CornerRadius)
- (void)ext_setCorner:(UIRectCorner)corner radius:(NSInteger)radius;
- (void)ext_setCorner:(UIRectCorner)corner radius:(NSInteger)radius bounds:(CGRect)bounds;
@end



//
//  UIButton+Value.m
//  BustVideo
//
//  Created by wubing on 16/8/19.
//  Copyright © 2016年 wubing. All rights reserved.
//

#import "UIButton+Value.h"
#import <objc/runtime.h>
@implementation UIButton(Value)

- (void)setValue:(id)value {
    objc_setAssociatedObject(self, @selector(value), value, OBJC_ASSOCIATION_RETAIN);
}

- (id)value {
    return objc_getAssociatedObject(self, @selector(value));
}

@end

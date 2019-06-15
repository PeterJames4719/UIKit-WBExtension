//
//  ViewController1.m
//  BaseClass
//
//  Created by wubing on 15/5/29.
//  Copyright (c) 2015年 wubing. All rights reserved.
//

#import "UIViewController+NavigationItem.h"
#import <objc/runtime.h>


@implementation UIViewController(UIViewController_NavigationItem)

- (id)ext_navigationTitle
{
    //subClass to implement
    return nil;
}

- (NSArray *)ext_leftNavigationItems
{
    //subClass to implement
    return nil;
}

- (NSArray *)ext_rightNavigationItems
{
    //subClass to implement
    return nil;
}

- (void)ext_leftNavigationItemClicked:(UIButton *)aItem
{
    //subClass to implement
}

- (void)ext_rightNavigationItemClicked:(UIButton *)aItem
{
    //subClass to implement
}

- (void)ext_setUpNavigationTitle
{
    id title = [self ext_navigationTitle];
    if(title)
    {
        if([title isKindOfClass:[NSString class]])
        {
            self.navigationItem.title = title;
        }
        else if ([title isKindOfClass:[UIView class]])
        {
            self.navigationItem.titleView = title;
        }
        else
        {
            NSAssert(0, @"supply a title with NSString or UIView");
        }
    }
}

- (BOOL)createBarButtonItemsWithItems:(NSArray *)items forLeft:(BOOL)isLeft
{
    if(!items || items.count == 0) {
        return NO;
    }
    NSMutableArray *tmpArray = [[NSMutableArray alloc] initWithCapacity:items.count];
    for(NSString *item in items)
    {
        UIButton *btn;
        BOOL isImage = checkWhetherIsImage(item);
        CGRect frame;
        if(isImage)
        {
            UIImage *icon = [UIImage imageNamed:item];
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:icon forState:UIControlStateNormal];
            CGSize size = icon.size;
            if (size.width < 40) {
                size = CGSizeMake(40, 40);
            }
            frame = CGRectMake(0, 0, size.width, size.height);
        }
        else
        {
            btn = [UIButton buttonWithType:UIButtonTypeSystem];
            [btn setTitle:item forState:UIControlStateNormal];
            CGSize size = [[self class] sizeWithText:item font:[btn.titleLabel font] constrainSize:CGSizeMake(60, 100)];
            frame = CGRectMake(0, 0, size.width, size.height);
        }
        btn.frame = frame;
        if (isLeft)
        {
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -28.5, 0, 0)];
        }
        else
        {
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -20)];
        }
        btn.tag = WBNavigationItemTagOrigin+[items indexOfObject:item];
        [btn addTarget:self action:isLeft?@selector(ext_leftNavigationItemClicked:):@selector(ext_rightNavigationItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [tmpArray addObject:barItem];
        
    }
    if(isLeft) {
        self.navigationItem.leftBarButtonItems = tmpArray;
    } else {
        self.navigationItem.rightBarButtonItems = tmpArray;
    }
    return YES;
}

- (void)ext_refreshNavigationItemsForLeft:(BOOL)left {
    if (left) {
        [self createBarButtonItemsWithItems:[self ext_leftNavigationItems] forLeft:YES];
    } else {
        [self createBarButtonItemsWithItems:[self ext_rightNavigationItems] forLeft:NO];
    }
}

- (void)setUpNavigationItems
{
    [self createBarButtonItemsWithItems:[self ext_leftNavigationItems] forLeft:YES];
    [self createBarButtonItemsWithItems:[self ext_rightNavigationItems] forLeft:NO];
}
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font constrainSize:(CGSize)cSize
{
    CGSize size = CGSizeZero;
    if(([[UIDevice currentDevice] systemVersion].intValue)>= 7.0)
    {
        NSDictionary *attriDict = @{NSFontAttributeName:font};
        size =  [text boundingRectWithSize:cSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attriDict context:nil].size;
    }
    else
    {
        size = [text sizeWithFont:font constrainedToSize:cSize];
    }
    return size;
}
+ (void)load
{
    SEL originalSelector = @selector(viewDidLoad);
    SEL swizzledSelector = @selector(wb_viewDidLoad);
    
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}
- (void)wb_viewDidLoad
{
    [self ext_setUpNavigationTitle];
    [self setUpNavigationItems];
    [self wb_viewDidLoad];
}

@end

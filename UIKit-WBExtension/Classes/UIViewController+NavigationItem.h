//
//  ViewController1.h
//  BaseClass
//
//  Created by wubing on 15/5/29.
//  Copyright (c) 2015年 wubing. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WBNavigationItemTagOrigin 470

NS_INLINE BOOL checkWhetherIsImage(NSString* aString)
{
    NSString *s=[aString lowercaseString];
    if([s hasSuffix:@".png"] || [s hasSuffix:@".jpg"] || [s hasSuffix:@".jpeg"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    return YES;
}

@interface UIViewController(UIViewController_NavigationItem)

- (id)ext_navigationTitle;
- (void)ext_setUpNavigationTitle;
- (NSArray *)ext_leftNavigationItems;
- (NSArray *)ext_rightNavigationItems;

- (void)ext_leftNavigationItemClicked:(UIButton *)aItem;
- (void)ext_rightNavigationItemClicked:(UIButton *)aItem;
- (void)ext_refreshNavigationItemsForLeft:(BOOL)left;
@end

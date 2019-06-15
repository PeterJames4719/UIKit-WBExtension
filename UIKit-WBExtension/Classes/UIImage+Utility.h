//
//  UIImage+Utility.h
// 
//
//  Created by 兵伍 on 2019/4/16.
//  Copyright © 2018年 WuBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Utility)
- (UIImage *)ext_cropImageAtRect:(CGRect)rect;
+ (UIImage *)ext_constituteImages:(NSArray *)images;
- (UIImage *)ext_ext_scaledImageTosizeBaseScreenScale:(CGSize)size;
- (UIImage *)ext_scaledImageTosize:(CGSize)size;
+ (UIImage *)ext_imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage*)ext_imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage *)ext_compressedImageWithMaxLength:(NSUInteger)maxLength;
- (NSData *)ext_compressedDataWithMaxLength:(NSUInteger)maxLength;
- (UIImage *)ext_imageByRoundCornerRadius:(CGFloat)radius
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin
                                 size:(CGSize)size;

- (UIImage *)ext_fixOrientation;
@end

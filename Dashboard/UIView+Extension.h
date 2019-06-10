//
//  UIView+Extension.h
//  Wlb
//
//  Created by 王灵博 on 2019/1/9.
//  Copyright © 2019年 王灵博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

-(void)addCornerRadii:(CGFloat)radii;
-(void)addCornerWithBorderRadii:(CGFloat)radii
                borderLineWidth:(CGFloat)lineWidth
                    borderColor:(UIColor *)borderColor;
-(void)addCornerRadii:(UIRectCorner)roundingCorners Radii:(CGFloat)radii;
-(void)addCornerOriginRoundingCorners:(UIRectCorner)roundingCorners
                          cornerRadii:(CGSize)cornerRadii
                      borderLineWidth:(CGFloat)lineWidth
                          borderColor:(UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END

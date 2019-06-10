//
//  UIView+Extension.m
//  Wlb
//
//  Created by 王灵博 on 2019/1/9.
//  Copyright © 2019年 王灵博. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x {
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)centerX {
    
    return self.x + self.width * 0.5;
}

- (void)setCenterX:(CGFloat)centerX {
    
    self.x = centerX - self.width * 0.5;
}

- (CGFloat)centerY {
    
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGFloat)top {
    return self.frame.origin.y;
}


- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}


- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)left {
    return self.frame.origin.x;
}


- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void)addCornerRadii:(CGFloat)radii
{
    [self addCornerOriginRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radii, radii) borderLineWidth:0 borderColor:nil];
}
-(void)addCornerRadii:(UIRectCorner)roundingCorners Radii:(CGFloat)radii
{
    [self addCornerOriginRoundingCorners:roundingCorners cornerRadii:CGSizeMake(radii, radii) borderLineWidth:0 borderColor:nil];
}
-(void)addCornerWithBorderRadii:(CGFloat)radii borderLineWidth:(CGFloat)lineWidth borderColor:(UIColor *)borderColor
{
     [self addCornerOriginRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radii, radii) borderLineWidth:lineWidth borderColor:borderColor];
}
-(void)addCornerOriginRoundingCorners:(UIRectCorner)roundingCorners
                             cornerRadii:(CGSize)cornerRadii
                         borderLineWidth:(CGFloat)lineWidth
                             borderColor:(UIColor *)borderColor
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:roundingCorners cornerRadii:cornerRadii];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    if (lineWidth!=0) {
        CAShapeLayer *borderLayer=[CAShapeLayer layer];
        borderLayer.path= maskPath.CGPath;
        borderLayer.fillColor= [UIColor clearColor].CGColor;
        borderLayer.strokeColor= borderColor.CGColor;
        borderLayer.lineWidth= lineWidth;
        borderLayer.frame=self.bounds;
        [self.layer addSublayer:borderLayer];
    }
    
}
@end

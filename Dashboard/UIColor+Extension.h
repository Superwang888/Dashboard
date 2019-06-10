//
//  UIColor+Extension.h
//  Wlb
//
//  Created by 王灵博 on 2019/1/4.
//  Copyright © 2019年 王灵博. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString  alpha:(CGFloat)alpaha;
#pragma 获取图片主色调
+(UIColor*)mostColorWithimageName:(NSString *)imgName;
@end


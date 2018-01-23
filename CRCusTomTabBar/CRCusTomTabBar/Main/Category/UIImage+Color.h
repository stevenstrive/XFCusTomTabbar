//
//  UIImage+Color.h
//  CRCusTomTabBar
//
//  Created by Seven on 2018/1/23.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
/**
 *  根据颜色生成一张图片
 *  @param imageName 提供的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end

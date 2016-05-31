//
//  UIImage+Color.h
//  SmartLife
//
//  Created by 钱权 on 16/5/18.
//  Copyright © 2016年 rhxtune.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIColor *)colorAtPixel:(CGPoint)point;

@end



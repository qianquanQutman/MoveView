//
//  ColorPickerView.h
//  moveview
//
//  Created by 钱权 on 16/5/31.
//  Copyright © 2016年 钱权. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorPickerViewDelegate <NSObject>

@optional
- (void) didEndPickColor:(UIColor *)color andRed:(int)r green:(int)g blue:(int)b;

- (void) didChangeColor:(UIColor *)color andRed:(int)r green:(int)g blue:(int)b;

@end

@interface ColorPickerView : UIImageView

@property (nonatomic, weak) id <ColorPickerViewDelegate> delegate;

@end

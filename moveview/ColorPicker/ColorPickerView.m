//
//  ColorPickerView.m
//  moveview
//
//  Created by 钱权 on 16/5/31.
//  Copyright © 2016年 钱权. All rights reserved.
//

#import "ColorPickerView.h"
#import "UIImage+Color.h"

#define centerR 143
#define lnnerR 135

@interface ColorPickerView ()
@property (nonatomic, strong) UIImageView *moveView;
@property (nonatomic, strong) UIBezierPath *lnnerRing;
@property (nonatomic, strong) UIBezierPath *centerRing;
@property (nonatomic, strong) UIBezierPath *outerRing;


@end
@implementation ColorPickerView

-(UIImageView *)moveView{
    
    if (_moveView == nil) {
        _moveView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4"]];
    }
    
    return _moveView;
}

- (UIBezierPath *)centerRing{
    if (_centerRing == nil) {
        _centerRing = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:centerR startAngle:0 endAngle:2 * M_PI clockwise:YES];
    }
    return _centerRing;
}

- (UIBezierPath *)lnnerRing{
    if (_lnnerRing == nil) {
        _lnnerRing = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:lnnerR startAngle:0 endAngle:2 * M_PI clockwise:YES];
    }
    return _lnnerRing;
}

- (UIBezierPath *)outerRing{
    if (_outerRing == nil) {
        _outerRing = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    }
    return _outerRing;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self moveView:point isMove:NO];
    [self getterColor];
    
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self moveView:point isMove:YES];
        
    [self getterColor];
    
    
}


- (void) moveView:(CGPoint)point isMove:(BOOL)isMove{
    
    
    CGFloat r = centerR;
    
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    BOOL condition = isMove ? YES : (CGPathContainsPoint(self.outerRing.CGPath, NULL, point, NO) && !CGPathContainsPoint(self.lnnerRing.CGPath, NULL, point, NO));
    
    if (condition) {
        
        
        CGFloat distance = sqrt(pow(center.x - point.x, 2) + pow(point.y - center.y, 2));
        
        CGFloat x = center.x - r / distance * (center.x - point.x);
        CGFloat y = center.y + r / distance * (point.y - center.y);
        
        self.moveView.center = CGPointMake(x, y);
        
        
    }
    
}


- (void) getterColor{
    CGPoint center = self.moveView.center;
    
    CGFloat xScale = self.image.size.width / self.bounds.size.width;
    CGFloat yScale = self.image.size.height / self.bounds.size.height;
    CGPoint img = CGPointMake(center.x * xScale, center.y * yScale);
    
    
    UIColor *uicolor = [self.image colorAtPixel:img];
    
    
    int R = 0, G = 0, B = 0;
    
    //    UIColor *red = [UIColor blueColor];
    CGColorRef color = [uicolor CGColor];
    
    int numComponents = CGColorGetNumberOfComponents(color);
    
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        R = components[0] * 255;
        G = components[1] * 255;
        B = components[2] * 255;
    }
    
    if ([self.delegate respondsToSelector:@selector(didChangeColor:andRed:green:blue:)]) {
        [self.delegate didChangeColor:uicolor andRed:R green:G blue:B];
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self addSubview:self.moveView];
    self.moveView.center = CGPointMake(self.bounds.size.width / 2, 8);
    self.moveView.userInteractionEnabled = YES;
    
}


@end

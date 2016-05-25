//
//  MoveView.m
//  moveview
//
//  Created by 钱权 on 16/5/25.
//  Copyright © 2016年 钱权. All rights reserved.
//

#import "MoveView.h"

@implementation MoveView



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    
    if (CGPathContainsPoint(path.CGPath, NULL, [touch locationInView:self], NO)) {
        
        self.black.center = [touch locationInView:self];
        
    }
    
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGFloat r = self.bounds.size.width / 2;
    
    CGPoint center = CGPointMake(r, r);
    
    UITouch *touch = [touches anyObject];
    
    CGPoint pointL = [touch locationInView:self];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    
    if (CGPathContainsPoint(path.CGPath, NULL, [touch locationInView:self], NO)) {

        self.black.center = [touch locationInView:self];
        
    }else{
        
        
        
        CGFloat juli = sqrt(pow(center.x - pointL.x, 2) + pow(pointL.y - center.y, 2));
        
        CGFloat x = center.x - r / juli * (center.x - pointL.x);
        CGFloat y = center.y + r / juli * (pointL.y - center.y);
        
        
        
        
        self.black.center = CGPointMake(x, y);
//        NSLog(@"%@", NSStringFromCGPoint(self.black.center));
    }

}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.width / 2;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;
    self.black.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);

    
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
//    
//    NSLog(@"%@", NSStringFromCGPoint(point));
//    
//    if (CGPathContainsPoint(path.CGPath, NULL, point, NO)) {
//        
//        return self;
//    }
//    
//    return self.superview;
//}




@end

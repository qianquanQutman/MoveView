//
//  MoveView.h
//  moveview
//
//  Created by 钱权 on 16/5/25.
//  Copyright © 2016年 钱权. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoveView : UIView
@property (nonatomic, weak) IBOutlet UIView *black;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

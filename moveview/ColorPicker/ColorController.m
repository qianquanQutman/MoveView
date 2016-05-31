//
//  ColorController.m
//  moveview
//
//  Created by 钱权 on 16/5/31.
//  Copyright © 2016年 钱权. All rights reserved.
//

#import "ColorController.h"
#import "ColorPickerView.h"

@interface ColorController ()<ColorPickerViewDelegate>
@property (weak, nonatomic) IBOutlet ColorPickerView *colorPickerView;
@property (weak, nonatomic) IBOutlet UIView *displayView;

@end

@implementation ColorController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorPickerView.delegate = self;
    
    self.displayView.layer.cornerRadius = 12;
    self.displayView.layer.masksToBounds = YES;
    
}

- (void)didChangeColor:(UIColor *)color andRed:(int)r green:(int)g blue:(int)b{
    
    self.displayView.backgroundColor = color;
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

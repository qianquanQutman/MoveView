//
//  ViewController.m
//  moveview
//
//  Created by 钱权 on 16/5/25.
//  Copyright © 2016年 钱权. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)moveView:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MoveView"];
    
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)colorPickerView:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ColorPickerView"];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end

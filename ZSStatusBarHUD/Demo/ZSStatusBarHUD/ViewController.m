//
//  ViewController.m
//  ZSStatusBarHUD
//
//  Created by @Zs on 16/4/12.
//  Copyright © 2016年 Hero. All rights reserved.
//

#import "ViewController.h"
#import "ZSStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showLoading:(id)sender {
    [ZSStatusBarHUD showLoading:@"加载中..."];
}
- (IBAction)showSuccess:(id)sender {
    [ZSStatusBarHUD showSuccess:@"已成功加载!"];
}
- (IBAction)showError:(id)sender {
    [ZSStatusBarHUD showError:@"加载失败!"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

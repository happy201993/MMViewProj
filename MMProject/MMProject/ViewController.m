//
//  ViewController.m
//  MMProject
//
//  Created by jack on 16/1/17.
//  Copyright © 2016年 YCompany. All rights reserved.
//

#import "ViewController.h"
#import "UIViewExt.h"

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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.view.width -= 10;
    self.view.height -= 10;
}

@end

//
//  ViewController.m
//  Application-ios
//
//  Created by 飞鱼 on 2019/5/9.
//  Copyright © 2019 xxx. All rights reserved.
//

#import "ViewController.h"
#import "DemoRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (IBAction)openFlutterPage:(UIButton *)sender {
    [[DemoRouter sharedRouter] openPage:@"page://flutter/first" params:@{@"key":@"to-flutter"} animated:YES completion:^(BOOL finished) {

    }];
}

- (IBAction)openSecondPage:(UIButton *)sender {
    [[DemoRouter sharedRouter] openPage:@"page://flutter/second" params:@{@"key":@"to-flutter"} animated:YES completion:^(BOOL finished) {

    }];
}

@end

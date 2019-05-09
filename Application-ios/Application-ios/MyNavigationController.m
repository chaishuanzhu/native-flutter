//
//  MyNavigationController.m
//  Application-ios
//
//  Created by 飞鱼 on 2019/5/9.
//  Copyright © 2019 xxx. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    return [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}

@end

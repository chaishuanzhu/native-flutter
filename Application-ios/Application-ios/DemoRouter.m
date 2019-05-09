//
//  DemoRouter.m
//  Application-ios
//
//  Created by 飞鱼 on 2019/5/9.
//  Copyright © 2019 xxx. All rights reserved.
//

#import "DemoRouter.h"
#import <flutter_boost/FlutterBoost.h>
#import "ViewController.h"

@implementation DemoRouter

+ (DemoRouter *)sharedRouter
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)openPage:(NSString *)name
          params:(NSDictionary *)params
        animated:(BOOL)animated
      completion:(void (^)(BOOL))completion
{
//    NSURL *url = [NSURL URLWithString:@"demo://flutter/pageaa?aaa=bbb"];
//    NSLog(@"url = %@, scheme=%@, target=%@, page=%@, args=%@", url.absoluteString, url.scheme, url.host, url.path, url.query);
    NSURL *url = [NSURL URLWithString:name];
    NSString *target = url.host; // 平台
    NSString *pageName = [url.path substringFromIndex:1]; // 页面
    if ([target isEqualToString:@"native"]) {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    } else if ([target isEqualToString:@"flutter"]) {
        if([params[@"present"] boolValue]){
            FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
            [vc setName:pageName params:params];
            [self.navigationController presentViewController:vc animated:animated completion:^{}];
        }else{
            FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
            [vc setName:pageName params:params];
            [self.navigationController pushViewController:vc animated:animated];
        }
    }
}


- (void)closePage:(NSString *)uid animated:(BOOL)animated params:(NSDictionary *)params completion:(void (^)(BOOL))completion
{
    FLBFlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}

@end

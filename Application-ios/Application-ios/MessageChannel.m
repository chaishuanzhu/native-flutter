//
//  MessageChannel.m
//  Application-ios
//
//  Created by 飞鱼 on 2019/5/9.
//  Copyright © 2019 xxx. All rights reserved.
//

#import "MessageChannel.h"

@implementation MessageChannel

+ (instancetype)shared {
    static MessageChannel *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MessageChannel alloc]init];
    });
    return _instance;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

    if ([@"getUserID" isEqualToString:call.method]) {
        result([@"userId: " stringByAppendingString:@"10086"]);
    } else if ([@"sendData" isEqualToString:call.method]) {
        result(call.arguments);
    } else if ([@"showDialog" isEqualToString:call.method]) {

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            result(call.arguments);
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            result(@{@"key":@"cancel"});
        }];
        [alert addAction:okAction];
        [alert addAction:cancelAction];
        [self.navigationController presentViewController:alert animated:YES completion:nil];

    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end

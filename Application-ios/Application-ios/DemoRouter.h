//
//  DemoRouter.h
//  Application-ios
//
//  Created by 飞鱼 on 2019/5/9.
//  Copyright © 2019 xxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <flutter_boost/FLBPlatform.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoRouter : NSObject<FLBPlatform>

@property (nonatomic,strong) UINavigationController *navigationController;

+ (DemoRouter *)sharedRouter;

@end

NS_ASSUME_NONNULL_END

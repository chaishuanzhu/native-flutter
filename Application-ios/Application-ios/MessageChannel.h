//
//  MessageChannel.h
//  Application-ios
//
//  Created by 飞鱼 on 2019/5/9.
//  Copyright © 2019 xxx. All rights reserved.
//

#import "ChannelPlugin.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageChannel : NSObject<ChannelDelegate>

@property (nonatomic,strong) UINavigationController *navigationController;

+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END

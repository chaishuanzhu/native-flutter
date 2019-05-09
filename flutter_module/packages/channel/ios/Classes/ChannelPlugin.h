#import <Flutter/Flutter.h>

@protocol ChannelDelegate <NSObject>

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result;

@end

@interface ChannelPlugin : NSObject<FlutterPlugin>

+ (instancetype)shared;

/**
 添加处理Method事件的代理

 @param delegate 代理
 */
+ (void)addMethodCallDelegate:(NSObject<ChannelDelegate>*)delegate;


@end

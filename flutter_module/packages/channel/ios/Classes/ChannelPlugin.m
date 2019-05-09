#import "ChannelPlugin.h"

@interface ChannelPlugin ()

@property (nonatomic, weak) id <ChannelDelegate> delegate;

@end

@implementation ChannelPlugin

+ (instancetype)shared {
    static ChannelPlugin *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ChannelPlugin alloc] init];
    });
    return instance;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"channel"
            binaryMessenger:[registrar messenger]];
  ChannelPlugin* instance = [ChannelPlugin shared];
  [registrar addMethodCallDelegate:instance channel:channel];
}

+ (void)addMethodCallDelegate:(NSObject<ChannelDelegate> *)delegate {
    [ChannelPlugin shared].delegate = delegate;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
      if (_delegate) {
          [_delegate handleMethodCall:call result:result];
      } else {
          result(FlutterMethodNotImplemented);
      }
  }
}

@end

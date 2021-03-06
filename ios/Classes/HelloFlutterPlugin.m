#import "HelloFlutterPlugin.h"

@implementation HelloFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"hello_flutter_plugin"
            binaryMessenger:[registrar messenger]];
  HelloFlutterPlugin* instance = [[HelloFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}
    
+ (void)registerWithBinaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"hello_flutter_plugin"
                                     binaryMessenger:messenger];
    HelloFlutterPlugin* instance = [[HelloFlutterPlugin alloc] init];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        [instance handleMethodCall:call result:result];
    }];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end

#import <Flutter/Flutter.h>

@interface HelloFlutterPlugin : NSObject<FlutterPlugin>
    
+ (void)registerWithBinaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
    
@end

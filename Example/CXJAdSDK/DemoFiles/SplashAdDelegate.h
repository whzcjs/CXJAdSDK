//
//  SplashAdDelegate.h
//  CXAdSDKSample
//
//  Created by AustinYang on 2025/8/25.
//

#import <Foundation/Foundation.h>
#import <CXJAdSDK/CXJAdSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface SplashAdDelegate : NSObject<CXJSplashAdDelegate>

- (instancetype)initWithWithWindow: (UIWindow *)window
                         cxjSplash: (CXJSplashAd *)cxjSplash;

@property (copy, nonatomic) void(^compeleteBlock)(void);

@end

NS_ASSUME_NONNULL_END

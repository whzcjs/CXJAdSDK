//
//  SplashAdDelegate.m
//  CXAdSDKSample
//
//  Created by AustinYang on 2025/8/25.
//

#import "SplashAdDelegate.h"

#import <Toast.h>

@interface SplashAdDelegate ()
@property (weak, nonatomic) UIWindow *window;
@property (weak, nonatomic) CXJSplashAd *cxjSplashAd;
@end


@implementation SplashAdDelegate

- (void)dealloc
{
    NSLog(@"-------------------%@ --------- dealloc", NSStringFromClass(self.class));
}

- (instancetype)initWithWithWindow:(UIWindow *)window
                         cxjSplash:(CXJSplashAd *)cxjSplash {
    if (self = [super init]) {
        self.window = window;
        self.cxjSplashAd = cxjSplash;
    }
    return self;
}

#pragma CXJSplashAdDelegate
- (void)cxj_splashAdDidLoad:(CXJSplashAd *)splashAd {
    NSLog(@"---------------广告加载成功");
    if (self.compeleteBlock) {
        self.compeleteBlock();
    }
    [self.cxjSplashAd showAdInWindow: self.window];
}
/**
 *  开屏广告展示失败
 */
- (void)cxj_splashAdFailToPresent:(CXJSplashAd *)splashAd withError:(NSError *)error {
    NSLog(@"---------------广告加载失败 = %@", error);
    if (self.compeleteBlock) {
        self.compeleteBlock();
    }
}

- (void)cxj_splashAdSuccessPresentScreen:(CXJSplashAd *)splashAd {
    NSLog(@"---------------开屏广告成功展示");
}

/**
 *  开屏广告曝光回调
 */
- (void)cxj_splashAdExposured:(CXJSplashAd *)splashAd {
    NSLog(@"----------------开屏广告曝光");
}

/**
 *  开屏广告将要关闭回调
 */
- (void)cxj_splashAdWillClosed:(CXJSplashAd *)splashAd {
    NSLog(@"-----------------开屏广告将要关闭");
}

/**
 *  开屏广告关闭回调
 */
- (void)cxj_splashAdClosed:(CXJSplashAd *)splashAd {
    NSLog(@"-----------------开屏广告已经关闭");
}

/**
 *  开屏广告点击回调
 */
- (void)cxj_splashAdClicked:(CXJSplashAd *)splashAd {
    NSLog(@"------------------开屏广告点击");
}

- (void)cxj_splashAdLifeTime:(NSUInteger)time {
    
}


@end

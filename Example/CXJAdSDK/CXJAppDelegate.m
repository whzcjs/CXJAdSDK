//
//  CXJAppDelegate.m
//  CXJAdSDK
//
//  Created by AustinYang on 08/27/2025.
//  Copyright (c) 2025 AustinYang. All rights reserved.
//

#import "CXJAppDelegate.h"
#import <CXJAdSDK/CXJAdSDK.h>
#import <Toast.h>
#import <CXJAdSDK_Example-Swift.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>

@interface CXJAppDelegate ()<CXJSplashAdDelegate>
@property (strong, nonatomic) CXJSplashAd *cxjSplashAd;
@property (strong, nonatomic) UIView *bottomView;
@end

@implementation CXJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *sdkVersion = [CXJAdSDKManager sdkVersion];
    NSLog(@"cx ad sdk version = %@", sdkVersion);
    
    
    
    [NetworkOnceTrigger.shared startMonitoringIfNeeded:^{
        [self initCXAdSDK];
    }];
    
    
    return YES;
}

- (void)initCXAdSDK {
    BOOL result = [CXJAdSDKManager initWithAppId:kAppId
                                       secretKey:kSecretKey];
    
    if (!result) {
        NSLog(@"--------SDK初始化失败");
    }
    else {
        [CXJAdSDKManager startWithCompletionHandler:^(BOOL success, NSError * _Nonnull error) {
            NSLog(@"--------sdk 初始化结果 = %@ error = %@", @(success), error);
            if (!success && error) {
                [self.window.rootViewController.view makeToast:[NSString stringWithFormat:@"%@", error]];
            }
            if (success) {
                [self.window.rootViewController.view makeToast:[NSString stringWithFormat:@"sdk初始化成功"]];
                self.cxjSplashAd = [[CXJSplashAd alloc] initWithPlacementId: kSplashId];
                self.cxjSplashAd.delegate = self;
                self.cxjSplashAd.viewController = self.window.rootViewController;
                self.cxjSplashAd.fetchDelay = 0.1;
                self.cxjSplashAd.bottomView = self.bottomView;
                [self.cxjSplashAd loadAd];
            }
        }];
    }
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 100))];
        _bottomView.backgroundColor = UIColor.orangeColor;
    }
    return _bottomView;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
                NSLog(@"--------idfa = %@", idfa);
                
            } else {
                
            }
        }];
    } else {
        
    }

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma CXJSplashAdDelegate
- (void)cxj_splashAdDidLoad:(CXJSplashAd *)splashAd {
    NSLog(@"---------------广告加载成功");
    [self.cxjSplashAd showAdInWindow: self.window];
}
/**
 *  开屏广告展示失败
 */
- (void)cxj_splashAdFailToPresent:(CXJSplashAd *)splashAd withError:(NSError *)error {
    NSLog(@"---------------广告加载失败 = %@", error);
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

//
//  CXJInterstitialAd.h
//  CXJAdSDK
//
//  Created by AustinYang on 2025/7/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CXJInterstitialAd;
@protocol CXJInterstitialAdDelegate <NSObject>
@optional

/// 插屏广告加载成功
- (void)cxj_interstitialAdLoadSuccess:(CXJInterstitialAd *)interstitialAd;

/// 插屏广告加载失败
- (void)cxj_interstitialAdLoadFail:(CXJInterstitialAd *)interstitialAd error:(NSError *)error;

/// 插屏广告曝光
- (void)cxj_interstitialAdDidShow:(CXJInterstitialAd *)interstitialAd;

/// 插屏广告点击
- (void)cxj_interstitialAdDidClick:(CXJInterstitialAd *)interstitialAd;

/// 插屏广告关闭
- (void)cxj_interstitialAdDidClose:(CXJInterstitialAd *)interstitialAd;

@end

@interface CXJInterstitialAd : NSObject

/**
 *  委托对象
 */
@property (nonatomic, weak) id<CXJInterstitialAdDelegate> delegate;

@property (nonatomic, readonly) NSString *placementId;

/**
 *  构造方法
 *  详解：placementId - 广告位 ID
 */
- (instancetype)initWithPlacementId:(NSString *)placementId;

/**
 *  广告发起请求方法
 *  详解：[必选]发起拉取广告请求
 */
- (void)loadAdData;

/**
 *  广告展示方法
 *  详解：[必选]发起展示广告请求, 必须传入用于显示插播广告的UIViewController
 */

- (void)showFromViewController:(UIViewController *)viewController;

/**
 返回广告的eCPM，单位：分

 @return 成功返回一个大于等于0的值，-1表示无权限或后台出现异常
 */
- (NSInteger)eCPM;


@end

NS_ASSUME_NONNULL_END

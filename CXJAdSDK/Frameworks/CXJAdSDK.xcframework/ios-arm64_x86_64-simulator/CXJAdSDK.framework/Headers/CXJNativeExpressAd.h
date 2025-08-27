//
//  CXJNativeExpressAd.h
//  CXJAdSDK
//
//  Created by AustinYang on 2025/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CXJNativeExpressAd;
@class CXJNativeExpressAdView;

@protocol CXJNativeExpressAdDelegate <NSObject>

@optional
/**
 * 拉取原生模板广告成功
 */
- (void)cxj_nativeExpressAdSuccessToLoad:(CXJNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof CXJNativeExpressAdView *> *)views;

/**
 * 拉取原生模板广告失败
 */
- (void)cxj_nativeExpressAdFailToLoad:(CXJNativeExpressAd *)nativeExpressAd error:(NSError *)error;

/**
 * 原生模板广告渲染成功, 此时的 nativeExpressAdView.size.height 根据 size.width 完成了动态更新。
 */
- (void)cxj_nativeExpressAdViewRenderSuccess:(CXJNativeExpressAdView *)nativeExpressAdView;

/**
 * 原生模板广告渲染失败
 */
- (void)cxj_nativeExpressAdViewRenderFail:(CXJNativeExpressAdView *)nativeExpressAdView;

/**
 * 原生模板广告曝光回调
 */
- (void)cxj_nativeExpressAdViewExposure:(CXJNativeExpressAdView *)nativeExpressAdView;

/**
 * 原生模板广告点击回调
 */
- (void)cxj_nativeExpressAdViewClicked:(CXJNativeExpressAdView *)nativeExpressAdView;

/**
 * 原生模板广告被关闭
 */
- (void)cxj_nativeExpressAdViewClosed:(CXJNativeExpressAdView *)nativeExpressAdView;

/**
 * 点击原生模板广告以后即将弹出全屏广告页
 */
- (void)cxj_nativeExpressAdViewWillPresentScreen:(CXJNativeExpressAdView *)nativeExpressAdView;

/**
 * 点击原生模板广告以后弹出全屏广告页
 */
- (void)cxj_nativeExpressAdViewDidPresentScreen:(CXJNativeExpressAdView *)nativeExpressAdView;

/**
 * 全屏广告页将要关闭
 */
- (void)cxj_nativeExpressAdViewWillDismissScreen:(CXJNativeExpressAdView *)nativeExpressAdView;

/**
 * 全屏广告页被关闭
 */
- (void)cxj_nativeExpressAdViewDidDismissScreen:(CXJNativeExpressAdView *)nativeExpressAdView;

/**
 * 详解:当点击应用下载或者广告调用系统程序打开时调用
 */
- (void)cxj_nativeExpressAdViewApplicationWillEnterBackground:(CXJNativeExpressAdView *)nativeExpressAdView;

@end

@interface CXJNativeExpressAd : NSObject
/**
 *  委托对象
 */
@property (nonatomic, weak) id<CXJNativeExpressAdDelegate> delegate;


@property (nonatomic, readonly) NSString *placementId;

/**
 *  构造方法
 *  详解：placementId - 广告位 ID
 *       adSize - 广告展示的宽高
 */

- (instancetype)initWithPlacementId:(NSString *)placementId adSize:(CGSize)size;

/**
 *  拉取广告
 */
- (void)loadAd;

@end

NS_ASSUME_NONNULL_END

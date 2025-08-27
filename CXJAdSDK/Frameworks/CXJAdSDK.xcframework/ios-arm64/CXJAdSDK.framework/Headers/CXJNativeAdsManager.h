//
//  CXJNativeAdsManager.h
//  CXJAdSDK
//
//  Created by AustinYang on 2025/7/24.
//

#import <Foundation/Foundation.h>
#import <CXJAdSDK/CXJNativeAd.h>

NS_ASSUME_NONNULL_BEGIN

@class CXJNativeAdsManager;
@protocol CXJNativeAdsManagerDelegate <NSObject>

- (void)cxj_nativeAdsManagerSuccessToLoad:(CXJNativeAdsManager *)adsManager nativeAds:(NSArray<CXJNativeAd *> *_Nullable)nativeAdDataArray;

- (void)cxj_nativeAdsManager:(CXJNativeAdsManager *)adsManager didFailWithError:(NSError *_Nullable)error;

@end

@interface CXJNativeAdsManager : NSObject
/**
 构造方法

 @param placementId 广告位ID
 @return CXNativeAd 实例
 */
- (instancetype)initWithPlacementId:(NSString *_Nullable)placementId;

@property (nonatomic, weak) id<CXJNativeAdsManagerDelegate> delegate;

/**
 加载广告
 */
- (void)loadAdWithAd;
/**
 广告位Id
 */
@property (nonatomic, readonly) NSString *placementId;

@end

NS_ASSUME_NONNULL_END

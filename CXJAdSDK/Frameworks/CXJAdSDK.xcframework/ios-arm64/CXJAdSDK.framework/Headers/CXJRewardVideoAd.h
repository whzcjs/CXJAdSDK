//
//  CXJRewardVideoAd.h
//  CXJAdSDK
//
//  Created by AustinYang on 2025/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CXJRewardVideoAd;
@protocol CXJRewardVideoAdDelegate <NSObject>
@optional

/**
 广告数据加载成功回调

 @param rewardedVideoAd CXJRewardVideoAd 实例
 */
- (void)cxj_rewardVideoAdDidLoad:(CXJRewardVideoAd *)rewardedVideoAd;

/**
 视频数据下载成功回调，已经下载过的视频会直接回调

 @param rewardedVideoAd CXJRewardVideoAd 实例
 */
- (void)cxj_rewardVideoAdVideoDidLoad:(CXJRewardVideoAd *)rewardedVideoAd;

/**
 视频播放页即将展示回调

 @param rewardedVideoAd CXJRewardVideoAd 实例
 */
- (void)cxj_rewardVideoAdWillVisible:(CXJRewardVideoAd *)rewardedVideoAd;

/**
 视频广告曝光回调

 @param rewardedVideoAd CXJRewardVideoAd 实例
 */
- (void)cxj_rewardVideoAdDidExposed:(CXJRewardVideoAd *)rewardedVideoAd;

/**
 视频播放页关闭回调

 @param rewardedVideoAd CXJRewardVideoAd 实例
 */
- (void)cxj_rewardVideoAdDidClose:(CXJRewardVideoAd *)rewardedVideoAd;

/**
 视频广告信息点击回调

 @param rewardedVideoAd CXJRewardVideoAd 实例
 */
- (void)cxj_rewardVideoAdDidClicked:(CXJRewardVideoAd *)rewardedVideoAd;

/**
 视频广告各种错误信息回调

 @param rewardedVideoAd CXJRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)cxj_rewardVideoAd:(CXJRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error;

/**
 视频广告播放达到激励条件回调

 @param rewardedVideoAd CXJRewardVideoAd 实例
 @param info 包含此次广告行为的一些信息
 */
- (void)cxj_rewardVideoAdDidRewardEffective:(CXJRewardVideoAd *)rewardedVideoAd info:(NSDictionary *)info;

/**
 视频广告视频播放完成

 @param rewardedVideoAd CXJRewardVideoAd 实例
 */
- (void)cxj_rewardVideoAdDidPlayFinish:(CXJRewardVideoAd *)rewardedVideoAd;

/**
 视频广告播放失败
 
 @param rewardedVideoAd CXJRewardVideoAd 实例
 @param error 具体错误信息
 
 */
- (void)cxj_rewardVideoAd:(CXJRewardVideoAd *)rewardedVideoAd didPlayFailWithError:(NSError *)error;

@end

@interface CXJRewardVideoAd : NSObject
/**
 构造方法
 
 @param placementId - 广告位 ID
 @return CXJRewardVideoAd 实例
 */
- (instancetype)initWithPlacementId:(NSString *)placementId;

@property (nonatomic, weak) id <CXJRewardVideoAdDelegate> delegate;

@property (readonly, nonatomic) NSString *placementId;

/**
 *  广告是否有效，以下情况会返回NO，建议在展示广告之前判断，否则会影响计费或展示失败
 *  a.广告未拉取成功
 *  b.广告已经曝光过
 *  c.广告过期
 */
@property (nonatomic, getter=isAdValid, readonly) BOOL adValid;

/**
 加载广告方法
 */
- (void)loadAd;
/**
 展示广告方法

 @param rootViewController 用于 present 激励视频 VC
 @return 是否展示成功
 */
- (BOOL)showAdFromRootViewController:(UIViewController *)rootViewController;

/**
 返回广告的eCPM，单位：分
 
 @return 成功返回一个大于等于0的值，-1表示无权限或后台出现异常
 */
- (NSInteger)eCPM;
@end

NS_ASSUME_NONNULL_END

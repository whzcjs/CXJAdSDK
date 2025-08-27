//
//  CXJSplashAd.h
//  CXJAdSDK
//
//  Created by AustinYang on 2025/7/16.
//

#import <UIKit/UIKit.h>

@class CXJSplashAd;
@protocol CXJSplashAdDelegate <NSObject>

@optional
- (void)cxj_splashAdDidLoad:(CXJSplashAd *)splashAd;
/**
 *  开屏广告展示失败
 */
- (void)cxj_splashAdFailToPresent:(CXJSplashAd *)splashAd withError:(NSError *)error;

/**
 *  开屏广告成功展示
 */
- (void)cxj_splashAdSuccessPresentScreen:(CXJSplashAd *)splashAd;
/**
 *  开屏广告曝光回调
 */
- (void)cxj_splashAdExposured:(CXJSplashAd *)splashAd;

/**
 *  开屏广告将要关闭回调
 */
- (void)cxj_splashAdWillClosed:(CXJSplashAd *)splashAd;

/**
 *  开屏广告关闭回调
 */
- (void)cxj_splashAdClosed:(CXJSplashAd *)splashAd;

/**
 *  开屏广告点击回调
 */
- (void)cxj_splashAdClicked:(CXJSplashAd *)splashAd;

/**
 * 开屏广告剩余时间回调
 */
- (void)cxj_splashAdLifeTime:(NSUInteger)time;

@end

@interface CXJSplashAd : NSObject
/**
 *  委托对象
 */
@property (weak, nonatomic) id<CXJSplashAdDelegate> delegate;

/**
 *  拉取广告超时时间，默认为5秒
 */
@property (nonatomic, assign) CGFloat fetchDelay;

@property (weak, nonatomic) UIViewController *viewController;

/// buttomView  底部视图 可为空
@property(strong, nonatomic) UIView *bottomView;

/**
 *  构造方法
 *  @param placementId - 广告位 ID
 */
- (instancetype)initWithPlacementId:(NSString *)placementId;

@property (nonatomic, readonly) NSString *placementId;

/**
 *  发起拉取广告请求，只拉取不展示
 *  详解：广告素材及广告图片拉取成功后会回调splashAdDidLoad方法，当拉取失败时会回调splashAdFailToPresent方法
 */
- (void)loadAd;

/**
 * 返回广告是否可展示
 * 对于并行请求，在调用showAdInWindow前时需判断下
 * @return 当广告已经加载完成&&未曝光&&未过期时，为YES，否则为NO
 */
- (BOOL)isAdValid;

/**
 *  展示广告
 *  详解：广告展示成功时会回调splashAdSuccessPresentScreen方法，展示失败时会回调splashAdFailToPresent方法
 */
- (void)showAdInWindow:(UIWindow *)window;

/**
 返回广告的eCPM，单位：分
 
 @return 成功返回一个大于等于0的值，-1表示无权限或后台出现异常
 */
- (NSInteger)eCPM;

@end

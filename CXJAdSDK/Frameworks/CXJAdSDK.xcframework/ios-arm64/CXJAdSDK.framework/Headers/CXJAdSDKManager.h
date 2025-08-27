//
//  CXJAdSDKManager.h
//  CXJAdSDK
//
//  Created by AustinYang on 2025/7/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXJAdSDKManager : NSObject
/**
 * SDK初始化
 * @param appId - 开发者平台注册得到的appId
 * @param secretKey - 媒体密钥
 * @return 初始化是否成功。
 * @note 调用initWithAppId接口后，请尽快调用startWithCompletionHandler接口；如果不调用startWithCompletionHandler接口，会影响SDK功能。
*/
+ (BOOL)initWithAppId: (NSString *)appId
            secretKey: (NSString *)secretKey;

/**
 * 启动SDK
 * @param handler - 启动成功|失败的结果回调
 * @note 请先调用initWithAppId:mediaId:secretKey接口，再调用startWithCompletionHandler接口。
 */
+ (void)startWithCompletionHandler:(void(^)(BOOL success, NSError * _Nullable error))handler;

/**
 SDK版本号
 */
+ (NSString *)sdkVersion;


/**
 设置IDFA，请传原始值，不需要加密
 */
+ (void)setIdfa:(NSString *)idfa;

@end

NS_ASSUME_NONNULL_END

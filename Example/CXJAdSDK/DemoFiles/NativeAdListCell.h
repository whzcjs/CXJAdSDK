//
//  NativeAdListCell.h
//  CXAdSDKDemo
//
//  Created by AustinYang on 2025/7/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CXJNativeAd;
@interface NativeAdListCell : UITableViewCell

- (void)setNativeAdDataCXJ: (CXJNativeAd *)nativeAdData;

+ (CGFloat)cellHeight;
@end

NS_ASSUME_NONNULL_END

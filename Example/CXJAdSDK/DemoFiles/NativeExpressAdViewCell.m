//
//  NativeExpressAdViewCell.m
//  CXAdSDKDemo
//
//  Created by AustinYang on 2025/7/7.
//

#import "NativeExpressAdViewCell.h"
#import <CXJAdSDK/CXJAdSDK.h>

@interface NativeExpressAdViewCell ()

@end

@implementation NativeExpressAdViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setExpressAdView:(CXJNativeExpressAdView *)expressAdView {
    if (_expressAdView != expressAdView) {
        if (_expressAdView.superview) {
            [_expressAdView removeFromSuperview];
        }
        _expressAdView = expressAdView;
        [self.contentView addSubview:_expressAdView];
        NSLog(@"-------------%@", _expressAdView.subviews);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

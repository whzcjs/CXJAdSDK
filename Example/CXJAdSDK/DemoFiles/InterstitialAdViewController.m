//
//  InterstitialAdViewController.m
//  CXAdSDKDemo
//
//  Created by AustinYang on 2025/6/27.
//

#import "InterstitialAdViewController.h"
#import <CXJAdSDK/CXJAdSDK.h>
#import <MBProgressHUD.h>
#import <Toast.h>

@interface InterstitialAdViewController ()<CXJInterstitialAdDelegate>
@property (strong, nonatomic) CXJInterstitialAd *cxj_interstitialAd;

@end

@implementation InterstitialAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"插屏广告";
}

- (IBAction)onLoadAd:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.cxj_interstitialAd loadAdData];
}

- (IBAction)onShowAd:(id)sender {
    [self.cxj_interstitialAd showFromViewController:self];
}

#pragma mark -getter

- (CXJInterstitialAd *)cxj_interstitialAd {
    if (!_cxj_interstitialAd) {
        _cxj_interstitialAd = [[CXJInterstitialAd alloc] initWithPlacementId:kInterstitialId];
        _cxj_interstitialAd.delegate = self;
    }
    return _cxj_interstitialAd;
}


#pragma mark -CXJInterstitialAdDelegate
/// 插屏广告加载成功
- (void)cxj_interstitialAdLoadSuccess:(CXJInterstitialAd *)interstitialAd {
    NSLog(@"--------------%s", __FUNCTION__);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.view makeToast:@"广告加载成功"];
}

/// 插屏广告加载失败
- (void)cxj_interstitialAdLoadFail:(CXJInterstitialAd *)interstitialAd error:(NSError *)error {
    NSLog(@"--------------%s----error = %@", __FUNCTION__, error);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.view makeToast:[NSString stringWithFormat:@"加载失败 error = %@", error]];
}

/// 插屏广告曝光
- (void)cxj_interstitialAdDidShow:(CXJInterstitialAd *)interstitialAd {
    NSLog(@"--------------%s", __FUNCTION__);
}

/// 插屏广告点击
- (void)cxj_interstitialAdDidClick:(CXJInterstitialAd *)interstitialAd {
    NSLog(@"--------------%s", __FUNCTION__);
}

/// 插屏广告关闭
- (void)cxj_interstitialAdDidClose:(CXJInterstitialAd *)interstitialAd {
    NSLog(@"--------------%s", __FUNCTION__);
}


@end

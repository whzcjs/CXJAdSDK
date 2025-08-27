//
//  RewardVideoViewController.m
//  CXAdSDKDemo
//
//  Created by AustinYang on 2025/6/13.
//

#import "RewardVideoViewController.h"
#import <MBProgressHUD.h>
#import <Toast.h>

#import <CXJAdSDK/CXJAdSDK.h>

@interface RewardVideoViewController ()<CXJRewardVideoAdDelegate>
@property (strong, nonatomic) CXJRewardVideoAd *cxj_rewardVideoAd;

@end

@implementation RewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    self.title = @"激励视频广告";
}

- (IBAction)onLoadAd:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.cxj_rewardVideoAd loadAd];
    
}

- (IBAction)onShowAd:(id)sender {
    if (self.cxj_rewardVideoAd.isAdValid) {
        BOOL showSuccess = [self.cxj_rewardVideoAd showAdFromRootViewController:self];
        if (!showSuccess) {
            [self.view makeToast:@"激励视频展示失败"];
        }
    }
    else {
        [self.view makeToast:@"广告不可展示"];
    }
}

- (CXJRewardVideoAd *)cxj_rewardVideoAd {
    if (!_cxj_rewardVideoAd) {
        _cxj_rewardVideoAd = [[CXJRewardVideoAd alloc] initWithPlacementId:kRewardVideoId];
        _cxj_rewardVideoAd.delegate = self;
    }
    return _cxj_rewardVideoAd;
}

#pragma mark - CXJRewardVideoAdDelegate

- (void)cxj_rewardVideoAdDidLoad:(CXJRewardVideoAd *)rewardedVideoAd {
    NSLog(@"-----------激励视频素材加载成功");
}

- (void)cxj_rewardVideoAdVideoDidLoad:(CXJRewardVideoAd *)rewardedVideoAd {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.view makeToast:@"----------广告视频加载成功"];
    NSLog(@"----------广告视频加载成功");
}

- (void)cxj_rewardVideoAd:(CXJRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"---------------激励视频加载失败 = %@", error);
    [self.view makeToast:error.localizedDescription];
}

- (void)cxj_rewardVideoAdDidPlayFinish:(CXJRewardVideoAd *)rewardedVideoAd {
    [self.view.window makeToast:@"视频播放完成"];
    NSLog(@"---------------激励视频播放完成");
}

- (void)cxj_rewardVideoAdDidRewardEffective:(CXJRewardVideoAd *)rewardedVideoAd info:(NSDictionary *)info {
    [self.view.window makeToast:@"达到激励条件"];
    NSLog(@"----------------激励视频达到激励条件");
}


- (void)cxj_rewardVideoAdWillVisible:(CXJRewardVideoAd *)rewardedVideoAd {
    NSLog(@"--------------激励视频将要展示");
}


- (void)cxj_rewardVideoAdDidExposed:(CXJRewardVideoAd *)rewardedVideoAd {
    NSLog(@"----------------激励视频已经曝光");
}


- (void)cxj_rewardVideoAdDidClose:(CXJRewardVideoAd *)rewardedVideoAd {
    NSLog(@"------------------激励视频已经关闭");
}

- (void)cxj_rewardVideoAdDidClicked:(CXJRewardVideoAd *)rewardedVideoAd {
    NSLog(@"----------------激励视频点击");
}

- (void)cxj_rewardVideoAd:(CXJRewardVideoAd *)rewardedVideoAd didPlayFailWithError:(NSError *)error {
    NSLog(@"-----------------激励视频播放失败 error = %@", error);
}

@end

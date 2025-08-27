//
//  BannerViewController.m
//  CXAdSDKDemo
//
//  Created by AustinYang on 2025/6/16.
//

#import "BannerViewController.h"

#import <CXJAdSDK/CXJAdSDK.h>

#import <MBProgressHUD.h>
#import <Toast.h>

@interface BannerViewController ()<CXJBannerViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *bannerBackView;
@property (strong, nonatomic) CXJBannerView *cxj_bannerView;

@end

@implementation BannerViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.cyanColor;
    
    [self.cxj_bannerView loadAdAndShow];
}

- (IBAction)onLoadAd:(id)sender {
    [self.cxj_bannerView removeFromSuperview];
    [self.cxj_bannerView loadAdAndShow];
}

- (CXJBannerView *)cxj_bannerView {
    if (!_cxj_bannerView) {
        _cxj_bannerView = [[CXJBannerView alloc] initWithFrame:CGRectMake(0,
                                                                          0,
                                                                          UIScreen.mainScreen.bounds.size.width,
                                                                          100)
                                                   placementId:kBannerId
                                                viewController:self];
        _cxj_bannerView.delegate = self;
        _cxj_bannerView.autoSwitchInterval = 30;
    }
    return _cxj_bannerView;
}

#pragma mark -CXJBannerViewDelegate
- (void)cxj_bannerViewWillClose:(CXJBannerView *)bannerView {
    NSLog(@"--------------%s", __func__);
}

- (void)cxj_bannerViewDidLoad:(CXJBannerView *)bannerView {
    if (!self.cxj_bannerView.superview) {
        [self.bannerBackView addSubview:self.cxj_bannerView];
    }
    NSLog(@"--------------%s", __func__);
}

- (void)cxj_bannerViewFailedToLoad:(CXJBannerView *)bannerView error:(NSError *)error {
    NSLog(@"------------------------banner加载失败 error = %@", error);
}

/**
 *  banner曝光回调
 */
- (void)cxj_bannerViewWillExpose:(CXJBannerView *)bannerView {
    NSLog(@"--------------%s", __func__);
    [self.view makeToast:@"banner exposed"];
}

/**
 *  banner点击回调
 */
- (void)cxj_bannerViewClicked:(CXJBannerView *)bannerView {
    NSLog(@"--------------%s", __func__);
}
@end

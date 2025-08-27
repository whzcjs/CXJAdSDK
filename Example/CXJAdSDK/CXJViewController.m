//
//  CXJViewController.m
//  CXJAdSDK
//
//  Created by AustinYang on 08/27/2025.
//  Copyright (c) 2025 AustinYang. All rights reserved.
//

#import "CXJViewController.h"
#import <CXJAdSDK/CXJAdSDK.h>
#import "AdTypeListModel.h"

#import <MBProgressHUD.h>
#import "RewardVideoViewController.h"
#import "BannerViewController.h"
#import "InterstitialAdViewController.h"
#import "NativeExpressAdViewController.h"
#import "NativeAdViewController.h"
#import <Toast.h>


@interface CXJViewController ()<CXJSplashAdDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray <AdTypeListModel *>*contentList;

@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) CXJSplashAd *cxjSplashAd;

@end

@implementation CXJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    self.contentList = [AdTypeListModel getDataList];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contentList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    AdTypeListModel *listModel = self.contentList[indexPath.row];
    cell.textLabel.text = listModel.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AdTypeListModel *listModel = self.contentList[indexPath.row];
    switch (listModel.adType) {
        case AdTypeSplash:
        {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [self.cxjSplashAd loadAd];
        }
            break;
            
        case AdTypeBanner:
        {
            BannerViewController *vc = BannerViewController.new;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case AdTypeInterstitial:
        {
            InterstitialAdViewController *vc = InterstitialAdViewController.new;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case AdTypeNativeExpress:
        {
            NativeExpressAdViewController *vc = NativeExpressAdViewController.new;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case AdTypeNative:
        {
            NativeAdViewController *vc = NativeAdViewController.new;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case AdTypeRewardVideo:
        {
            RewardVideoViewController *vc = RewardVideoViewController.new;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (CXJSplashAd *)cxjSplashAd {
    if (!_cxjSplashAd) {
        _cxjSplashAd = [[CXJSplashAd alloc] initWithPlacementId:kSplashId];
        _cxjSplashAd.delegate = self;
        _cxjSplashAd.viewController = self;
    }
    return _cxjSplashAd;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 100))];
        _bottomView.backgroundColor = UIColor.orangeColor;
    }
    return _bottomView;
}

#pragma CXJSplashAdDelegate
- (void)cxj_splashAdDidLoad:(CXJSplashAd *)splashAd {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"---------------广告加载成功");
    [self.cxjSplashAd showAdInWindow: self.view.window];
}
/**
 *  开屏广告展示失败
 */
- (void)cxj_splashAdFailToPresent:(CXJSplashAd *)splashAd withError:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"---------------广告加载失败 = %@", error);
}

- (void)cxj_splashAdSuccessPresentScreen:(CXJSplashAd *)splashAd {
    NSLog(@"---------------开屏广告成功展示");
}

/**
 *  开屏广告曝光回调
 */
- (void)cxj_splashAdExposured:(CXJSplashAd *)splashAd {
    NSLog(@"----------------开屏广告曝光");
}

/**
 *  开屏广告将要关闭回调
 */
- (void)cxj_splashAdWillClosed:(CXJSplashAd *)splashAd {
    NSLog(@"-----------------开屏广告将要关闭");
}

/**
 *  开屏广告关闭回调
 */
- (void)cxj_splashAdClosed:(CXJSplashAd *)splashAd {
    NSLog(@"-----------------开屏广告已经关闭");
}

/**
 *  开屏广告点击回调
 */
- (void)cxj_splashAdClicked:(CXJSplashAd *)splashAd {
    NSLog(@"------------------开屏广告点击");
}

- (void)cxj_splashAdLifeTime:(NSUInteger)time {
    
}


@end

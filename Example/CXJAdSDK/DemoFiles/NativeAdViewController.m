//
//  NativeAdViewController.m
//  CXAdSDKDemo
//
//  Created by AustinYang on 2025/7/8.
//

#import "NativeAdViewController.h"
#import "NativeAdListCell.h"
#import <MBProgressHUD.h>
#import <Toast.h>

#import <CXJAdSDK/CXJAdSDK.h>

@interface NativeAdViewController ()<
UITableViewDataSource,
UITableViewDelegate,
CXJNativeAdsManagerDelegate,
CXJNativeAdDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) CXJNativeAdsManager *cxj_nativeAdManager;
@property (strong, nonatomic) NSMutableArray<CXJNativeAd *> *cxj_adDataArray;
@end

@implementation NativeAdViewController

- (void)dealloc
{
    NSLog(@"--------%@----dealloc", self.class);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"信息流自渲染广告";
    self.view.backgroundColor = UIColor.orangeColor;
    [self.tableView registerNib:[UINib nibWithNibName:@"NativeAdListCell" bundle:nil] forCellReuseIdentifier:@"NativeAdListCell"];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"加载广告" style:(UIBarButtonItemStylePlain) target:self action:@selector(loadAd)];
    self.cxj_adDataArray = NSMutableArray.array;
    
    [self loadAd];
}

- (void)loadAd {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.cxj_nativeAdManager loadAdWithAd];
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cxj_adDataArray.count * 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        NativeAdListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NativeAdListCell"];
        [cell setNativeAdDataCXJ:self.cxj_adDataArray[indexPath.row / 2]];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.contentView.backgroundColor = UIColor.lightGrayColor;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        return NativeAdListCell.cellHeight;
    }
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -getter

- (CXJNativeAdsManager *)cxj_nativeAdManager {
    if (!_cxj_nativeAdManager) {
        _cxj_nativeAdManager = [[CXJNativeAdsManager alloc] initWithPlacementId:kNativeAd];
        _cxj_nativeAdManager.delegate = self;
    }
    return _cxj_nativeAdManager;
}

#pragma mark -CXJNativeAdDelegate
- (void)cxj_nativeAdsManagerSuccessToLoad:(CXJNativeAdsManager *)adsManager nativeAds:(NSArray<CXJNativeAd *> *)nativeAdDataArray {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"---------------%s, 自渲染广告数据加载成功",__FUNCTION__);
    //        self.cxj_adDataArray = nativeAdDataArray.mutableCopy;
    [self.cxj_adDataArray addObjectsFromArray:nativeAdDataArray];
    [self.tableView reloadData];
    for (CXJNativeAd *obj in nativeAdDataArray) {
        //        NSLog(@"extraInfo: %@", obj.extraInfo);
        obj.viewController = self;
        obj.delegate = self;
    }
}

- (void)cxj_nativeAdsManager:(CXJNativeAdsManager *)adsManager didFailWithError:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"-------------%s ad load fail: %@",__FUNCTION__,error);
    [self.view makeToast:error.localizedDescription];
}

#pragma mark -CXNativeAdDelegate
- (void)cxj_nativeAdViewExposure:(CXJNativeAd *)nativeAd {
    NSLog(@"-------------广告曝光");
}

- (void)cxj_nativeAdViewClicked:(CXJNativeAd *)nativeAd {
    NSLog(@"---------广告点击");
}


@end

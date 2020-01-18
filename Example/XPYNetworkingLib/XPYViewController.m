//
//  XPYViewController.m
//  XPYNetworkingLib
//
//  Created by xiangxiaopenyou on 03/04/2019.
//  Copyright (c) 2019 xiangxiaopenyou. All rights reserved.
//

#import "XPYViewController.h"

#import "XPYTestAPIManager.h"
#import "XPYLoginAPIManager.h"
#import "XPYDownloadAPIManager.h"

#import <XPYNetworkingHelper.h>

@interface XPYViewController () <XPYNetworkingAPIResponseDelegate>

@property (nonatomic, strong) XPYTestAPIManager *testApiManager;        // get请求
@property (nonatomic, strong) XPYLoginAPIManager *loginAPIManager;       // post请求
@property (nonatomic, strong) XPYDownloadAPIManager *downloadAPIManager;    //download请求

@end

@implementation XPYViewController

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [[XPYNetworkingHelper sharedInstance] networkStatusWithBlock:^(XPYNetworkStatus status) {
        switch (status) {
            case XPYNetworkStatusUnknown: {
                
            }
                break;
            case XPYNetworkStatusUnreachable: {
                
            }
                break;
            case XPYNetworkStatusReachableWWAN: {
                
            }
                break;
            case XPYNetworkStatusReachableWiFi: {
                
            }
                break;
            default:
                break;
        }
    }];
    
    // 直接使用XPYNetworkingHelper请求（集约型）
//    NSString *urlString = @"http://testapp.zhangdu.com/v1/book-city?action=db-home&channel_id=u2000&client_type=2&device_token=54A26B87-4B33-468B-99D3-1A8651B6CD81&page=1&token=0&user_id=0&version=1.4.0";
//    [[XPYNetworkingHelper sharedInstance] getWithURL:urlString parameters:nil success:^(id responseObject) {
//
//    } failure:^(NSError *error) {
//
//    }];
    
    // 使用二次封装XPYNetworkingAPIManager（离散型）
    [self.testApiManager requestData];
    [self.loginAPIManager requestData];
    [self.downloadAPIManager requestData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - XPYNetworkingAPIResponseDelegate
- (void)networkingAPIResponseDidSuccess:(XPYNetworkingBaseAPIManager *)manager {
    
}
- (void)networkingAPIResponseDidFail:(XPYNetworkingBaseAPIManager *)manager {
    
}
- (void)networkingAPIResponseProgress:(XPYNetworkingBaseAPIManager *)manager {
    
}

#pragma mark - Getters
- (XPYTestAPIManager *)testApiManager {
    if (!_testApiManager) {
        _testApiManager = [[XPYTestAPIManager alloc] init];
        _testApiManager.responseDelegate = self;
    }
    return _testApiManager;
}
- (XPYLoginAPIManager *)loginAPIManager {
    if (!_loginAPIManager) {
        _loginAPIManager = [[XPYLoginAPIManager alloc] init];
        _loginAPIManager.responseDelegate = self;
    }
    return _loginAPIManager;
}
- (XPYDownloadAPIManager *)downloadAPIManager {
    if (!_downloadAPIManager) {
        _downloadAPIManager = [[XPYDownloadAPIManager alloc] init];
        _downloadAPIManager.responseDelegate = self;
    }
    return _downloadAPIManager;
}

@end

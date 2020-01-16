//
//  XPYViewController.m
//  XPYNetworkingLib
//
//  Created by xiangxiaopenyou on 03/04/2019.
//  Copyright (c) 2019 xiangxiaopenyou. All rights reserved.
//

#import "XPYViewController.h"
#import "XPYTestAPIManager.h"

#import <XPYNetworkingHelper.h>

@interface XPYViewController () <XPYNetworkingAPIResponseDelegate>

@property (nonatomic, strong) XPYTestAPIManager *testAPIManager;

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
    [self.testAPIManager requestData];
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

#pragma mark - Getters
- (XPYTestAPIManager *)testAPIManager {
    if (!_testAPIManager) {
        _testAPIManager = [[XPYTestAPIManager alloc] init];
        _testAPIManager.responseDelegate = self;
    }
    return _testAPIManager;
}

@end

//
//  XPYViewController.m
//  XPYNetworkingLib
//
//  Created by xiangxiaopenyou on 03/04/2019.
//  Copyright (c) 2019 xiangxiaopenyou. All rights reserved.
//

#import "XPYViewController.h"
#import <XPYNetworkingHelper.h>

@interface XPYViewController ()

@end

@implementation XPYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *urlString = @"http://testapp.zhangdu.com/v1/book-city?action=db-home&channel_id=u2000&client_type=2&device_token=54A26B87-4B33-468B-99D3-1A8651B6CD81&page=1&token=0&user_id=0&version=1.4.0";
    [[XPYNetworkingHelper sharedInstance] GET:urlString parameters:nil success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

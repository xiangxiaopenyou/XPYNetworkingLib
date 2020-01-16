//
//  XPYTestAPIManager.m
//  XPYToolsAndCategories
//
//  Created by zhangdu_imac on 2020/1/14.
//  Copyright © 2020 xpy. All rights reserved.
//

#import "XPYTestAPIManager.h"
#import "XPYNetworkingService.h"

@implementation XPYTestAPIManager

- (NSString *)methodName {
    return @"book-city?action=db-home";
}

- (XPYNetworkingRequestType)requestType {
    return XPYNetworkingRequestTypeGet;
}

- (NSDictionary *)requestParams {
    return @{@"page" : @1};
}

- (NSString *)serviceIdentifier {
    return XPYNetworkingServiceIdentifier;
}
- (BOOL)logEnable {
    return YES;
}

@end

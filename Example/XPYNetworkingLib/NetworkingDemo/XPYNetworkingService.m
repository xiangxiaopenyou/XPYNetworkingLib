//
//  XPYNetworkingService.m
//  XPYToolsAndCategories
//
//  Created by zhangdu_imac on 2020/1/13.
//  Copyright © 2020 xpy. All rights reserved.
//

#import "XPYNetworkingService.h"

NSString * const XPYNetworkingServiceIdentifier = @"XPYNetworkingService";

/// 示例BaseURL
#if DEBUG
static NSString * const kXPYBaseURL = @"http://testapp.zhangdu.com/v1";
#else
static NSString * const kXPYBaseURL = @"";
#endif

/// 示例参数
static NSString * const kXPYChannelId = @"u2000";
static NSInteger const kXPYClientType = 2;
static NSString * const kXPYDeviceToken = @"54A26B87-4B33-468B-99D3-1A8651B6CD81";
static NSString * const kXPYUserId = @"0";
static NSString * const kXPYUserToken = @"0";
static NSString * const kXPYVersion = @"1.4.0";

@implementation XPYNetworkingService

/// 拼接kXPYBaseURL和methodName
- (NSString *)requestURLStringWithMethod:(NSString *)methodName {
    return [kXPYBaseURL stringByAppendingPathComponent:methodName];
}

/// 可以拼接额外参数，比如userID、token
/// 这里的例子拼接channel_id、client_type、device_token、token、user_id、version
- (NSDictionary *)completedParametersWithParams:(NSDictionary *)params {
    NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:params];
    [temp setObject:kXPYChannelId forKey:@"channel_id"];
    [temp setObject:@(kXPYClientType) forKey:@"client_type"];
    [temp setObject:kXPYDeviceToken forKey:@"device_token"];
    [temp setObject:kXPYUserId forKey:@"user_id"];
    [temp setObject:kXPYUserToken forKey:@"token"];
    [temp setObject:kXPYVersion forKey:@"version"];
    return (NSDictionary *)[temp copy];
}

/// 请求成功结果解析，可以根据服务端的数据格式自行解析，处理token失效等错误
/// 这里的例子格式为 {"data" = {}, "errno" = 0, "msg" = "请求成功"}
- (id)resultWithResponseObject:(id)responseObject {
    if (!responseObject || ![responseObject isKindOfClass:[NSDictionary class]]) {
        // 返回为空或者返回格式不正确时的错误代码可自行设计，暂时设为999999
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:999999 userInfo:@{NSUnderlyingErrorKey : @"返回格式错误"}];
        return error;
    }
    if ([responseObject[@"errno"] integerValue] == 0) {    //上述例子中当errno为0时请求成功，反之则有各种错误，错误代码可与服务端沟通
        return responseObject[@"data"];     //上述例子中把接口数据放在data中
    } else {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:[responseObject[@"errno"] integerValue] userInfo:@{NSUnderlyingErrorKey : responseObject[@"msg"]}];
        return error;
    }
}


@end

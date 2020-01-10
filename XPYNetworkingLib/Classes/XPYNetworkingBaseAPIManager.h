//
//  XPYNetworkingBaseAPIManager.h
//  AFNetworking
//
//  Created by zhangdu_imac on 2020/1/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 网络请求方式 (GET、POST、PUT)
typedef NS_ENUM(NSInteger, XPYNetworkingRequestType) {
    XPYNetworkingRequestTypeGet,
    XPYNetworkingRequestTypePost,
    XPYNetworkingRequestTypeUploadFile,
    XPYNetworkingRequestTypeDownloadFile
};

@protocol XPYNetworkingAPIManagerProtocol <NSObject>

@required

/// API名字
- (NSString *)methodName;

/// API请求类型
- (XPYNetworkingRequestType)requestType;

@optional

/// API请求参数
- (NSDictionary *)requestParams;

@end

@interface XPYNetworkingBaseAPIManager : NSObject

@end

NS_ASSUME_NONNULL_END

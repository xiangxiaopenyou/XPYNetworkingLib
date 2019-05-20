//
//  XPYNetworkingHelper.h
//  XPYToolsAndCategories
//
//  Created by zhangdu_imac on 2019/2/19.
//  Copyright © 2019 xpy. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, XPYNetworkStatus) {
    XPYNetworkStatusUnknown,        //未知网络
    XPYNetworkStatusUnreachable,    //没有网络
    XPYNetworkStatusReachableWWAN,  //手机网络
    XPYNetworkStatusReachableWiFi   //wifi网络
};
typedef NS_ENUM(NSInteger, XPYRequestSerializer) {
    XPYRequestSerializerHTTP,
    XPYRequestSerializerJSON
};
typedef NS_ENUM(NSInteger, XPYResponseSerializer) {
    XPYResponseSerializerHTTP,
    XPYResponseSerializerJSON
};

//请求成功block
typedef void (^XPYHttpRequestSuccess)(id responseObject);

//请求失败block
typedef void (^XPYHttpRequestFailure)(NSError *error);

typedef void (^XPYHttpProgress)(NSProgress *progress);

//网络状态block
typedef void (^XPYNetworkStatusHandler)(XPYNetworkStatus status);

@interface XPYNetworkingHelper : NSObject

+ (instancetype)sharedInstance;

//获取网络状态
+ (void)networkStatusWithBlock:(XPYNetworkStatusHandler)networkStatus;

//取消所有http请求
- (void)cancelAllHttpRequest;

//取消指定URL的http请求
- (void)cancelHttpRequestWithURL:(NSString *)URLString;

/**
 GET请求

 @param URLString 请求URL
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回Task对象可取消请求
 */
- (NSURLSessionTask *)GET:(NSString *)URLString
               parameters:(id)parameters
                  success:(XPYHttpRequestSuccess)success
                  failure:(XPYHttpRequestFailure)failure;

/**
 POST请求

 @param URLString 请求URL
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回Task对象可调用cancel方法取消请求
 */
- (NSURLSessionTask *)POST:(NSString *)URLString
                parameters:(id)parameters
                   success:(XPYHttpRequestSuccess)success
                   failure:(XPYHttpRequestFailure)failure;


/**
 上传文件

 @param URLString 请求URL
 @param parameters 请求参数
 @param name 文件名称对应服务器上的字段
 @param filePath 文件本地沙盒路径
 @param progress 上传进度
 @param success 上传成功回调
 @param failure 上传失败回调
 @return 返回Task对象可调用cancel方法取消
 */
- (NSURLSessionTask *)uploadFileWithURL:(NSString *)URLString
                             parameters:(id)parameters
                                   name:(NSString *)name
                               filePath:(NSString *)filePath
                               progress:(XPYHttpProgress)progress
                                success:(XPYHttpRequestSuccess)success
                                failure:(XPYHttpRequestFailure)failure;


/**
 下载文件

 @param URLString 请求URL
 @param fileDirectory 文件存储目录（默认为Download目录）
 @param progress 下载进度
 @param success 下载成功回调
 @param failure 下载失败回调
 @return 返回NSURLSessionDownloadTask实例，可暂停suspend 继续resume
 */
- (NSURLSessionTask *)downloadFileWithURL:(NSString *)URLString
                            fileDirectory:(NSString *)fileDirectory
                                 progress:(XPYHttpProgress)progress
                                  success:(XPYHttpRequestSuccess)success
                                  failure:(XPYHttpRequestFailure)failure;

#pragma mark - Properties

/**
 请求格式

 @param requestSerializer HTTP或者JSON格式
 */
- (void)resetRequestSerializer:(XPYRequestSerializer)requestSerializer;


/**
 响应数据格式

 @param responseSerializer HTTP或者JSON格式（默认JSON）
 */
- (void)resetResponseSerializer:(XPYResponseSerializer)responseSerializer;


/**
 请求超时时间

 @param timeoutInterval 时间
 */
- (void)resetRequestTimeoutInterval:(NSInteger)timeoutInterval;


@end

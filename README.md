# XPYNetworkingLib

[![CI Status](https://img.shields.io/travis/xiangxiaopenyou/XPYNetworkingLib.svg?style=flat)](https://travis-ci.org/xiangxiaopenyou/XPYNetworkingLib)
[![Version](https://img.shields.io/cocoapods/v/XPYNetworkingLib.svg?style=flat)](https://cocoapods.org/pods/XPYNetworkingLib)
[![License](https://img.shields.io/cocoapods/l/XPYNetworkingLib.svg?style=flat)](https://cocoapods.org/pods/XPYNetworkingLib)
[![Platform](https://img.shields.io/cocoapods/p/XPYNetworkingLib.svg?style=flat)](https://cocoapods.org/pods/XPYNetworkingLib)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

XPYNetworkingLib is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XPYNetworkingLib', :git => 'https://github.com/xiangxiaopenyou/XPYNetworkingLib.git'
```
## Usage

一、直接使用集约型请求

1.GET

      [[XPYNetworkingHelper sharedInstance] getWithURL:@"" parameters:params success:^(id responseObject) {
      
      } failure:^(NSError *error) {
    
      }];

2.POST

      [[XPYNetworkingHelper sharedInstance] postWithURL:@"" parameters:nil success:^(id responseObject) {
      
      } failure:^(NSError *error) {
    
      }];
    

二、2.0.0增加离散型请求方式

每一个请求必须是XPYNetworkingBaseAPIManager的子类，子类必须实现XPYNetworkingAPIManagerProtocol协议，目的是将methodName（API方法名）、requestType（请求类型）、requestParams（请求参数）等封装在子类中，我们调用请求时只需要调用requestData()方法。结果获取需要实现XPYNetworkingAPIResponseDelegate协议。
注意：XPYNetworkingService类实现了XPYNetworkingServiceProtocol协议，目的是统一拼接BaseURL和API方法名，统一处理额外添加的请求参数，如UserId、Token，以及统一解析请求成功结果。因为该类被独立拿出来了，所以这里使用CTMediator库的performTarget来获取服务。该类可以自由发挥。

    @property (nonatomic, strong) XPYTestAPIManager *testApiManager;        // get请求
    
    @property (nonatomic, strong) XPYLoginAPIManager *loginAPIManager;       // post请求
    
    @property (nonatomic, strong) XPYDownloadAPIManager *downloadAPIManager;    //download请求

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
    
    // 请求开始
    [self.testApiManager requestData];
    
    [self.loginAPIManager requestData];
    
    [self.downloadAPIManager requestData];
    
    // 结果回调
    #pragma mark - XPYNetworkingAPIResponseDelegate
    - (void)networkingAPIResponseDidSuccess:(XPYNetworkingBaseAPIManager *)manager {
        
    }
    - (void)networkingAPIResponseDidFail:(XPYNetworkingBaseAPIManager *)manager {
        
    }
    - (void)networkingAPIResponseProgress:(XPYNetworkingBaseAPIManager *)manager {
        
    }


三、Monitor Network

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
 

## Author

xiangxiaopenyou, xlp921123@163.com

## License

XPYNetworkingLib is available under the MIT license. See the LICENSE file for more info.

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
pod 'XPYNetworkingLib'
```
## Usage

1.GET Request

      [[XPYNetworkingHelper sharedInstance] getWithURL:@"" parameters:params success:^(id responseObject) {
      
      } failure:^(NSError *error) {
    
      }];

2.POST Request

      [[XPYNetworkingHelper sharedInstance] postWithURL:@"" parameters:nil success:^(id responseObject) {
      
      } failure:^(NSError *error) {
    
      }];
    
3.Monitor Network

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

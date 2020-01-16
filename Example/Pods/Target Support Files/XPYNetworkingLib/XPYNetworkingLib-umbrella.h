#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "XPYNetworkingHelper.h"
#import "XPYNetworkingBaseAPIManager.h"
#import "XPYNetworkingServiceFactory.h"
#import "XPYNetworkingDefine.h"

FOUNDATION_EXPORT double XPYNetworkingLibVersionNumber;
FOUNDATION_EXPORT const unsigned char XPYNetworkingLibVersionString[];


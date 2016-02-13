//
//  PKHReachability.h
//
//  Created by Patrick Hanlon on 3/29/15.
//  Copyright (c) 2015 pkh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

typedef NS_ENUM(NSInteger, PKHReachabilityType) {
    PKHReachabilityTypeWWAN,
    PKHReachabilityTypeWiFi,
    PKHReachabilityTypeNotConnected
};


@interface PKHReachability : NSObject

+ (BOOL)isConnectedToNetwork;
+ (PKHReachabilityType)isConnectedToNetworkOfType;

@end

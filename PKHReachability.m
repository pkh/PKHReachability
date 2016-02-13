//
//  PKHReachability.m
//
//  Created by Patrick Hanlon on 3/29/15.
//  Copyright (c) 2015 pkh. All rights reserved.
//

#import "PKHReachability.h"
#import <arpa/inet.h>
#import <CoreFoundation/CoreFoundation.h>

@implementation PKHReachability

+ (BOOL)isConnectedToNetwork
{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr *)&zeroAddress);
    
    if (reachability != NULL) {
        SCNetworkReachabilityFlags flags = 0;
        if (SCNetworkReachabilityGetFlags(reachability, &flags) == 0) {
            CFRelease(reachability);
            return NO;
        }
        
        BOOL isReachable = (flags & kSCNetworkFlagsReachable) != 0;
        BOOL needsConnection = (flags & kSCNetworkFlagsConnectionRequired) != 0;
        
        CFRelease(reachability);
        
        return (isReachable && !needsConnection) ? YES : NO;
    }
    
    return NO;
}

+ (PKHReachabilityType)isConnectedToNetworkOfType
{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr *)&zeroAddress);
    
    if (reachability != NULL) {
        SCNetworkReachabilityFlags flags = 0;
        if (SCNetworkReachabilityGetFlags(reachability, &flags) == 0) {
            CFRelease(reachability);
            return PKHReachabilityTypeNotConnected;
        }
        
        BOOL isReachable = (flags & kSCNetworkFlagsReachable) != 0;
        BOOL isWWAN = (flags & kSCNetworkReachabilityFlagsIsWWAN) != 0;
        
        CFRelease(reachability);
        
        if (isReachable && isWWAN) {
            return PKHReachabilityTypeWWAN;
        }
        
        if (isReachable && !isWWAN) {
            return PKHReachabilityTypeWiFi;
        }
    }
    
    return PKHReachabilityTypeNotConnected;
}


@end

//
//  ViewController.m
//  PKHReachability-Example
//
//  Created by Patrick Hanlon on 3/29/15.
//  Copyright (c) 2015 pkh. All rights reserved.
//

#import "ViewController.h"
#import "PKHReachability.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testConectivityButtonAction:(id)sender
{
    BOOL reachable = [PKHReachability isConnectedToNetwork];
    
    if (reachable) {
        NSLog(@"Network IS reachable!");
    } else {
        NSLog(@"Network IS NOT reachable!");
    }
    
    
    PKHReachabilityType type = [PKHReachability isConnectedToNetworkOfType];
    
    switch (type) {
        case PKHReachabilityTypeWWAN:
            NSLog(@"Connected via WWAN");
            break;
        case PKHReachabilityTypeWiFi:
            NSLog(@"Connected via WiFi");
            break;
        case PKHReachabilityTypeNotConnected:
            NSLog(@"NOT Connected!");
            break;
        default:
            break;
    }
}

@end

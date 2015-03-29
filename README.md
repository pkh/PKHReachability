# PKHReachability

Simplified network status detection for iOS.

### About

Apple has a [Reachability example project][AppleReachability] but I wanted a simplified version to simply check if the network was available, and if so, which network interface was being used.

This code is essentially an Objective-C version of [Isuru Nanayakkara's][IsuruNanayakkara] work [here][IJReachability]. His is in Swift though, and I wanted an Objective-C version.

### Installation

You can add the entire PKHReachability repo to your project as a git submodule, but all you really need is the PKHReachability `.h/.m` files.

### Usage

PKHReachability offers two methods, one to check if the network is available:

```objective-c
+ (BOOL)isConnectedToNetwork;
```

and another to check which type of network interface is available:

```objective-c
+ (PKHReachabilityType)isConnectedToNetworkOfType;
```

You can use these methods to test network connectivity like so:

```objective-c
BOOL reachable = [PKHReachability isConnectedToNetwork];
    
if (reachable) {
    // Network is reachable!
} else {
    // Network IS NOT reachable!
}
    
    
PKHReachabilityType type = [PKHReachability isConnectedToNetworkOfType];
    
switch (type) {
    case PKHReachabilityTypeWWAN:
        // Connected via WWAN (cellular service)
        break;
    case PKHReachabilityTypeWiFi:
        // Connected via WiFi
        break;
    case PKHReachabilityTypeNotConnected:
        // NOT Connected
        break;
    default:
        break;
}
```


## License

The MIT License (MIT)

Copyright (c) 2015 Patrick Hanlon

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


[AppleReachability]:https://developer.apple.com/library/ios/samplecode/Reachability/Introduction/Intro.html
[IsuruNanayakkara]:https://github.com/Isuru-Nanayakkara
[IJReachability]:https://github.com/Isuru-Nanayakkara/IJReachability
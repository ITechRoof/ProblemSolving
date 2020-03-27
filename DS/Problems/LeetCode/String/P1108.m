//
//  P1108.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/defanging-an-ip-address/
//Given a valid (IPv4) IP address, return a defanged version of that IP address.
//
//A defanged IP address replaces every period "." with "[.]".
//
//
//
//Example 1:
//
//Input: address = "1.1.1.1"
//Output: "1[.]1[.]1[.]1"
//Example 2:
//
//Input: address = "255.100.50.0"
//Output: "255[.]100[.]50[.]0"
 

#import "P1108.h"

@implementation P1108

- (NSString *)defangIPaddr:(NSString *)ip
{
    return [ip stringByReplacingOccurrencesOfString:@"." withString:@"[.]"];
}

+ (void)solution
{
    P1108 *case1 = [[P1108 alloc] init];
    NSLog(@"%@", [case1 defangIPaddr:@"1.1.1.1"]);
    NSLog(@"%@", [case1 defangIPaddr:@"255.100.50.0"]);
}
@end

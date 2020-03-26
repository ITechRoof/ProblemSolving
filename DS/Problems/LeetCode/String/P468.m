//
//  P468.m
//  DS
//
//  Created by Kiruthika on 26/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/validate-ip-address/
//Write a function to check whether an input string is a valid IPv4 address or IPv6 address or neither.
//
//IPv4 addresses are canonically represented in dot-decimal notation, which consists of four decimal numbers, each ranging from 0 to 255, separated by dots ("."), e.g.,172.16.254.1;
//
//Besides, leading zeros in the IPv4 is invalid. For example, the address 172.16.254.01 is invalid.
//
//IPv6 addresses are represented as eight groups of four hexadecimal digits, each group representing 16 bits. The groups are separated by colons (":"). For example, the address 2001:0db8:85a3:0000:0000:8a2e:0370:7334 is a valid one. Also, we could omit some leading zeros among four hexadecimal digits and some low-case characters in the address to upper-case ones, so 2001:db8:85a3:0:0:8A2E:0370:7334 is also a valid IPv6 address(Omit leading zeros and using upper cases).
//
//However, we don't replace a consecutive group of zero value with a single empty group using two consecutive colons (::) to pursue simplicity. For example, 2001:0db8:85a3::8A2E:0370:7334 is an invalid IPv6 address.
//
//Besides, extra leading zeros in the IPv6 is also invalid. For example, the address 02001:0db8:85a3:0000:0000:8a2e:0370:7334 is invalid.
//
//Note: You may assume there is no extra space or special characters in the input string.
//
//Example 1:
//Input: "172.16.254.1"
//
//Output: "IPv4"
//
//Explanation: This is a valid IPv4 address, return "IPv4".
//Example 2:
//Input: "2001:0db8:85a3:0:0:8A2E:0370:7334"
//
//Output: "IPv6"
//
//Explanation: This is a valid IPv6 address, return "IPv6".
//Example 3:
//Input: "256.256.256.256"
//
//Output: "Neither"
//
//Explanation: This is neither a IPv4 address nor a IPv6 address.

#import "P468.h"

@implementation P468

- (NSString *)validIPAddress:(NSString *)str
{
    NSArray *arr = [str componentsSeparatedByString:@"."];
    
    if(arr.count == 4)
    {
        BOOL isValid = YES;
        for(NSString *current in arr)
        {
            NSString *g = [current stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if (g.length > 0 && g.length <= 3) {
                if([g characterAtIndex:0] == '0' || (g.length == 3 && [g characterAtIndex:0] - '0' >= 2 && [g characterAtIndex:1] - '0' >= 5 && [g characterAtIndex:2] - '0' > 5))
                {
                    isValid = NO;
                    break;
                }
            }
            else
            {
                isValid = NO;
                break;
            }
        }
        return isValid ? @"IPv4" : @"Neither";
    }
    else
    {
        NSArray *arr = [str componentsSeparatedByString:@":"];
        if(arr.count == 8)
        {
            BOOL isValid = YES;
            for(NSString *current in arr)
            {
                NSString *g = [current stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                if (g.length > 0 && g.length <= 4) {
                    for (NSInteger i = 0; i < g.length; i++) {
                        char c = [g characterAtIndex:i];
                        if(!((c - 'a' <= 6 && c - 'a' >= 0) || (c - 'A' <= 6 && c - 'A' >= 0) || (c - '0' <= 9 && c - '0' >= 0)))
                        {
                            isValid = NO;
                            break;
                        }
                    }
                    if(!isValid)
                    {
                        break;
                    }
                }
                else
                {
                    isValid = NO;
                    break;
                }
            }
            return isValid ? @"IPv6" : @"Neither";
        }
    }
    return @"Neither";
}

+ (void)solution
{
    P468 *case1 = [[P468 alloc] init];
    NSLog(@"%@", [case1 validIPAddress:@"172.16.254.1"]);
    NSLog(@"%@", [case1 validIPAddress:@"2001:0db8:85A3:0:0:8A2E:0370:7334"]);
    NSLog(@"%@", [case1 validIPAddress:@"255.255.255.25"]);
}
@end

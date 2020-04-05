//
//  P1016.m
//  DS
//
//  Created by Kiruthika on 05/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/binary-string-with-substrings-representing-1-to-n/
//Given a binary string S (a string consisting only of '0' and '1's) and a positive integer N, return true if and only if for every integer X from 1 to N, the binary representation of X is a substring of S.
//
//
//
//Example 1:
//
//Input: S = "0110", N = 3
//Output: true
//Example 2:
//
//Input: S = "0110", N = 4
//Output: false
//
//
//Note:
//
//1 <= S.length <= 1000
//1 <= N <= 10^9

#import "P1016.h"

@implementation P1016

- (NSString *)binaryRepresentation:(NSInteger)n
{
    NSString *str = [NSString stringWithFormat:@""];
    while (n > 0) {
        str = [str stringByAppendingString:(n & 1) ? @"1" : @"0"];
        n = n >> 1;
    }
    return str;
}
- (BOOL)queryString:(NSString *)str n:(NSInteger)n
{
    NSString *binaryStr = [self binaryRepresentation:n];
    return [str containsString:binaryStr];
}
+ (void)solution
{
    P1016 *case1 = [[P1016 alloc] init];
    [case1 queryString:@"0110" n:3] ? NSLog(@"Contains") : NSLog(@"Do not Contain");
    [case1 queryString:@"0110" n:4] ? NSLog(@"Contains") : NSLog(@"Do not Contain");
}
@end

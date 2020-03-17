//
//  P1374.m
//  DS
//
//  Created by Kiruthika on 17/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/generate-a-string-with-characters-that-have-odd-counts/
//Given an integer n, return a string with n characters such that each character in such string occurs an odd number of times.
//
//The returned string must contain only lowercase English letters. If there are multiples valid strings, return any of them.
//
//
//
//Example 1:
//
//Input: n = 4
//Output: "pppz"
//Explanation: "pppz" is a valid string since the character 'p' occurs three times and the character 'z' occurs once. Note that there are many other valid strings such as "ohhh" and "love".
//Example 2:
//
//Input: n = 2
//Output: "xy"
//Explanation: "xy" is a valid string since the characters 'x' and 'y' occur once. Note that there are many other valid strings such as "ag" and "ur".
//Example 3:
//
//Input: n = 7
//Output: "holasss"
 
#import "P1374.h"

@implementation P1374

- (NSString *)generateString:(NSInteger)N
{
    NSInteger aCount = 0, bCount = 0;
    if(N % 2 == 0)
    {
        aCount = N - 1;
        bCount = 1;
    }
    else
    {
        aCount = N;
    }
    
    NSString *str = @"";
    for (int i = 0; i < aCount; i++) {
        str = [str stringByAppendingString:@"a"];
    }
    if(bCount != 0)
    {
        str = [str stringByAppendingString:@"b"];
    }
    return str;
}

+ (void)solution
{
    P1374 *case1 = [[P1374 alloc] init];
    NSLog(@"%@", [case1 generateString:4]);
    NSLog(@"%@", [case1 generateString:2]);
    NSLog(@"%@", [case1 generateString:7]);
    NSLog(@"%@", [case1 generateString:1]);
}
@end

//
//  P647.m
//  DS
//
//  Created by Kiruthika on 05/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/palindromic-substrings/
//Given a string, your task is to count how many palindromic substrings in this string.
//
//The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.
//
//Example 1:
//
//Input: "abc"
//Output: 3
//Explanation: Three palindromic strings: "a", "b", "c".
//
//
//Example 2:
//
//Input: "aaa"
//Output: 6
//Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
//
//
//Note:
//
//The input string length won't exceed 1000.

#import "P647.h"

@implementation P647
- (NSInteger)countSubstrings:(NSString *)str
{
    NSInteger res = 0;
    for (NSInteger center = 0; center <= 2 * str.length - 1; center++) {
        NSInteger left = center / 2;
        NSInteger right = left + (center % 2);
        while(left >= 0 && right < str.length && [str characterAtIndex:left] == [str characterAtIndex:right])
        {
            res++;
            left--;
            right++;
        }
    }
    return res;
}

+ (void)solution
{
    P647 *case1 = [[P647 alloc] init];
    NSLog(@"%ld", (long)[case1 countSubstrings:@"abc"]);
    NSLog(@"%ld", (long)[case1 countSubstrings:@"aaa"]);
}


@end

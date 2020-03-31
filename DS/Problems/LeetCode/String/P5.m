//
//  P5.m
//  DS
//
//  Created by Kiruthika on 31/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/longest-palindromic-substring/
//Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
//
//Example 1:
//
//Input: "babad"
//Output: "bab"
//Note: "aba" is also a valid answer.
//Example 2:
//
//Input: "cbbd"
//Output: "bb"

#import "P5.h"

@implementation P5
- (NSString *)longestPalindrome:(NSString *)str
{
    NSInteger start = 0, end = 0;
    for (NSInteger i = 0; i < str.length; i++) {
        NSInteger len1 = [self lengthOfLongestPalindrom:str left:i right:i];
        NSInteger len2 = [self lengthOfLongestPalindrom:str left:i right:i + 1];
        NSInteger len = MAX(len1, len2);
        if(len > end - start)
        {
            start = i - (len - 1)/2;
            end = i + len/2;
        }
    }
    return [str substringWithRange:NSMakeRange(start, end - start + 1)];
}

- (NSInteger)lengthOfLongestPalindrom:(NSString *)s left:(NSInteger)l right:(NSInteger)r
{
    while (l >= 0 && r < s.length && [s characterAtIndex:l] == [s characterAtIndex:r]) {
        l--;
        r++;
    }
    return r - l - 1;
}

+ (void)solution
{
    P5 *case1 = [[P5 alloc] init];
    NSLog(@"%@", [case1 longestPalindrome:@"babad"]);
    NSLog(@"%@", [case1 longestPalindrome:@"cbbd"]);
}
@end

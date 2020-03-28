//
//  P459.m
//  DS
//
//  Created by Kiruthika on 28/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/repeated-substring-pattern/
//Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.
//
// 
//
//Example 1:
//
//Input: "abab"
//Output: True
//Explanation: It's the substring "ab" twice.
//Example 2:
//
//Input: "aba"
//Output: False
//Example 3:
//
//Input: "abcabcabcabc"
//Output: True
//Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)

#import "P459.h"

@implementation P459
- (BOOL)repeatedSubstringPattern:(NSString *)str
{
    for (NSInteger i = 1; i <= str.length/2; i++)
    {
        NSString *s = [[str substringFromIndex:i] stringByAppendingString:[str substringToIndex:i]];
        if([s isEqualToString:str])
        {
            return YES;
        }
    }
    return NO;
}

+ (void)solution
{
    P459 *case1 = [[P459 alloc] init];
    [case1 repeatedSubstringPattern:@"abab"] ? NSLog(@"Repeated") : NSLog(@"Not Repeated");
    [case1 repeatedSubstringPattern:@"aba"] ? NSLog(@"Repeated") : NSLog(@"Not Repeated");
    [case1 repeatedSubstringPattern:@"abcabcabcabc"] ? NSLog(@"Repeated") : NSLog(@"Not Repeated");
}

@end

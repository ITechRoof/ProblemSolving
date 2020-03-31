//
//  P522.m
//  DS
//
//  Created by Kiruthika on 31/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/longest-uncommon-subsequence-ii/
//Given a list of strings, you need to find the longest uncommon subsequence among them. The longest uncommon subsequence is defined as the longest subsequence of one of these strings and this subsequence should not be any subsequence of the other strings.
//
//A subsequence is a sequence that can be derived from one sequence by deleting some characters without changing the order of the remaining elements. Trivially, any string is a subsequence of itself and an empty string is a subsequence of any string.
//
//The input will be a list of strings, and the output needs to be the length of the longest uncommon subsequence. If the longest uncommon subsequence doesn't exist, return -1.
//
//Example 1:
//Input: "aba", "cdc", "eae"
//Output: 3
//Note:
//
//All the given strings' lengths will not exceed 10.
//The length of the given list will be in the range of [2, 50].

#import "P522.h"

@implementation P522

- (BOOL)isSubsequence:(NSString *)str1 String:(NSString *)str2
{
    NSInteger i = 0;
    for (int j = 0; j < str2.length && i < str1.length; j++) {
        if([str1 characterAtIndex:i] == [str2 characterAtIndex:j])
        {
            i++;
        }
    }
    return i == str1.length;
}

- (NSInteger)findLUSlength:(NSArray <NSString *>*)strs
{
    NSInteger maxLength = -1;
    for (NSInteger i = 0; i < strs.count; i++) {
        NSInteger j = 0;
        for (; j < strs.count; j++) {
            if(i == j)
            {
                continue;
            }
            if([self isSubsequence:strs[i] String:strs[j]])
            {
                break;
            }
        }
        if(j == strs.count)
        {
            NSInteger l = strs[i].length;
            maxLength = MAX(maxLength, l);
        }
    }
    return maxLength;
}
+ (void)solution
{
    P522 *case1 = [[P522 alloc] init];
    NSLog(@"%ld", (long)[case1 findLUSlength:@[@"aba", @"cdc", @"eae"]]);
    NSLog(@"%ld", (long)[case1 findLUSlength:@[@"aaa",@"aaa",@"aa"]]);
    NSLog(@"%ld", (long)[case1 findLUSlength:@[@"aabbcc", @"aabbcc",@"cb"]]);
}
@end

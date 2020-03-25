//
//  P14.m
//  DS
//
//  Created by Kiruthika on 25/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/longest-common-prefix/
//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".
//
//Example 1:
//
//Input: ["flower","flow","flight"]
//Output: "fl"
//Example 2:
//
//Input: ["dog","racecar","car"]
//Output: ""
//Explanation: There is no common prefix among the input strings.
//Note:
//
//All given inputs are in lowercase letters a-z.

#import "P14.h"

@implementation P14

- (NSString *)commonPrefix:(NSString *)str1 string:(NSString *)str2
{
    NSInteger l = str1.length < str2.length ? str1.length : str2.length;
    NSString *prefix = @"";
    for (NSInteger i = 0; i < l; i++) {
        if([str1 characterAtIndex:i] == [str2 characterAtIndex:i])
        {
            prefix = [NSString stringWithFormat:@"%@%c", prefix, [str1 characterAtIndex:i]];
        }
        else
        {
            break;
        }
    }
    return prefix;
}
- (NSString *)longestCommonPrefix:(NSArray <NSString *> *)arr
{
    NSString *commonPrefix = arr.firstObject;
    for (NSInteger i = 1; i < arr.count; i++) {
        commonPrefix = [self commonPrefix:commonPrefix string:arr[i]];
        if([commonPrefix isEqualToString:@""])
        {
            return commonPrefix;
        }
    }
    return commonPrefix;
}

+ (void)solution
{
    P14 *case1 = [[P14 alloc] init];
    NSLog(@"%@", [case1 longestCommonPrefix:@[@"flower",@"flow",@"flight"]]);
    NSLog(@"%@", [case1 longestCommonPrefix:@[@"dog",@"racecar",@"car"]]);
}
@end

//
//  P567.m
//  DS
//
//  Created by Kiruthika on 19/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/permutation-in-string/
//Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.
//
//
//
//Example 1:
//
//Input: s1 = "ab" s2 = "eidbaooo"
//Output: True
//Explanation: s2 contains one permutation of s1 ("ba").
//Example 2:
//
//Input:s1= "ab" s2 = "eidboaoo"
//Output: False
//
//
//Note:
//
//The input strings only contain lower case letters.
//The length of both given strings is in range [1, 10,000].

#import "P567.h"

@implementation P567

- (BOOL)isIncluded:(NSString *)str1 string2:(NSString *)str2
{
    NSInteger s1[26], s2[26];
    for (int i = 0; i < 26; i++) {
        s1[i] = 0;
        s2[i] = 0;
    }
    NSString *smallStr = str1, *otherStr = str2;
    if(str1.length > str2.length)
    {
        smallStr = str2;
        otherStr = str1;
    }
    for (int i = 0; i < smallStr.length; i++) {
        char c1 = [smallStr characterAtIndex:i];
        s1[c1 - 'a']++;
        char c2 = [otherStr characterAtIndex:i];
        s2[c2 - 'a']++;
    }
    NSInteger count = 0;
    for (int i = 0; i < 26; i++) {
       if(s1[i] == s2[i])
       {
           count++;
       }
    }
    
    if(count == 26)
    {
        return YES;
    }
    
    for (int i = 0; i < otherStr.length - smallStr.length; i++) {
        NSInteger left = [otherStr characterAtIndex:i] - 'a';
        NSInteger right = [otherStr characterAtIndex:i + smallStr.length] - 'a';
        s2[right]++;
        if(s1[right] == s2[right])
        {
            count++;
        }
        else if(s2[right] == s1[right] + 1)
        {
            count--;
        }
        s2[left]--;
        if(s1[left] == s2[left])
        {
            count++;
        }
        else if(s2[left] == s1[left] - 1)
        {
            count--;
        }
        if(count == 26)
        {
            return YES;
        }
    }
    return count == 26;
}

+ (void)solution
{
    P567 *case1 = [[P567 alloc] init];
    [case1 isIncluded:@"ab" string2:@"eidbaooo"] ? NSLog(@"Included") : NSLog(@"Not Included");
    [case1 isIncluded:@"ab" string2:@"eidboaoo"] ? NSLog(@"Included") : NSLog(@"Not Included");
}
@end

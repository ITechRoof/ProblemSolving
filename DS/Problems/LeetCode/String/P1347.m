//
//  P1347.m
//  DS
//
//  Created by Kiruthika on 22/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram/
//Given two equal-size strings s and t. In one step you can choose any character of t and replace it with another character.
//
//Return the minimum number of steps to make t an anagram of s.
//
//An Anagram of a string is a string that contains the same characters with a different (or the same) ordering.
//
//
//
//Example 1:
//
//Input: s = "bab", t = "aba"
//Output: 1
//Explanation: Replace the first 'a' in t with b, t = "bba" which is anagram of s.
//Example 2:
//
//Input: s = "leetcode", t = "practice"
//Output: 5
//Explanation: Replace 'p', 'r', 'a', 'i' and 'c' from t with proper characters to make t anagram of s.
//Example 3:
//
//Input: s = "anagram", t = "mangaar"
//Output: 0
//Explanation: "anagram" and "mangaar" are anagrams.
//Example 4:
//
//Input: s = "xxyyzz", t = "xxyyzz"
//Output: 0
//Example 5:
//
//Input: s = "friend", t = "family"
//Output: 4

#import "P1347.h"

@implementation P1347

- (NSInteger)minStepsToAnagram:(NSString *)str1 string:(NSString *)str2
{
    NSInteger s1[26], s2[26];
    for(NSInteger i = 0; i < 26; i++)
    {
        s1[i] = 0;
        s2[i] = 0;
    }
    
    for (int i = 0; i < str1.length; i++) {
        s1[[str1 characterAtIndex:i] - 'a']++;
        s2[[str2 characterAtIndex:i] - 'a']++;
    }
    
    NSInteger diff = 0;
    for(NSInteger i = 0; i < 26; i++)
    {
        diff += ABS(s1[i] - s2[i]);
    }
    return diff / 2;
}

+ (void)solution
{
    P1347 *case1 = [[P1347 alloc] init];
    NSLog(@"%ld", (long)[case1 minStepsToAnagram:@"bab" string:@"aba"]);
    NSLog(@"%ld", (long)[case1 minStepsToAnagram:@"leetcode" string:@"practice"]);
    NSLog(@"%ld", (long)[case1 minStepsToAnagram:@"anagram" string:@"mangaar"]);
    NSLog(@"%ld", (long)[case1 minStepsToAnagram:@"xxyyzz" string:@"xxyyzz"]);
    NSLog(@"%ld", (long)[case1 minStepsToAnagram:@"friend" string:@"family"]);
}
@end

//
//  P3.m
//  DS
//
//  Created by Kiruthika on 26/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/longest-substring-without-repeating-characters/
//Given a string, find the length of the longest substring without repeating characters.
//
//Example 1:
//
//Input: "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.
//Example 2:
//
//Input: "bbbbb"
//Output: 1
//Explanation: The answer is "b", with the length of 1.
//Example 3:
//
//Input: "pwwkew"
//Output: 3
//Explanation: The answer is "wke", with the length of 3.
//             Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

#import "P3.h"

@implementation P3

- (NSInteger)lengthOfLongestSubstring:(NSString *)str
{
    NSInteger sMap[26];
    
    for (NSInteger i = 0; i < 26; i++) {
        sMap[i] = 0;
    }
    NSInteger longest = NSIntegerMin;
    NSInteger start = 0;
    for (NSInteger i = 0; i < str.length; i++) {
        sMap[[str characterAtIndex:i] - 'a']++;
        
        while(sMap[[str characterAtIndex:i] - 'a'] > 1 && start < i)
        {
            longest = MAX(longest, i - start);
            sMap[[str characterAtIndex:start] - 'a']--;
            start++;
        }
    }
    
    longest = MAX(longest, str.length - start);
    return longest;
}

+ (void)solution
{
    P3 *case1 = [[P3 alloc] init];
    NSLog(@"%ld", (long)[case1 lengthOfLongestSubstring:@"abcabcbb"]);
    NSLog(@"%ld", (long)[case1 lengthOfLongestSubstring:@"bbbbb"]);
    NSLog(@"%ld", (long)[case1 lengthOfLongestSubstring:@"pppwpe"]);
}

@end

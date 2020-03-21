//
//  P438.m
//  DS
//
//  Created by Kiruthika on 21/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/find-all-anagrams-in-a-string/
//Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
//
//Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
//
//The order of output does not matter.
//
//Example 1:
//
//Input:
//s: "cbaebabacd" p: "abc"
//
//Output:
//[0, 6]
//
//Explanation:
//The substring with start index = 0 is "cba", which is an anagram of "abc".
//The substring with start index = 6 is "bac", which is an anagram of "abc".
//Example 2:
//
//Input:
//s: "abab" p: "ab"
//
//Output:
//[0, 1, 2]
//
//Explanation:
//The substring with start index = 0 is "ab", which is an anagram of "ab".
//The substring with start index = 1 is "ba", which is an anagram of "ab".
//The substring with start index = 2 is "ab", which is an anagram of "ab".

#import "P438.h"

@implementation P438
- (NSArray *)findAnagrams:(NSString *)str match:(NSString *)matchStr
{
    if(str.length < matchStr.length)
    {
        return @[];
    }
    
    NSInteger s[26], p[26];
    
    for(NSInteger i = 0; i < 26; i++)
    {
        s[i] = 0;
        p[i] = 0;
    }
    for(NSInteger i = 0; i < matchStr.length; i++)
    {
        s[[str characterAtIndex:i] - 'a']++;
        p[[matchStr characterAtIndex:i] - 'a']++;
    }
    
    NSInteger count = 0;
    for(NSInteger i = 0; i < 26; i++)
    {
        if(s[i] == p[i])
        {
            count++;
        }
    }
    
    NSMutableArray *res = [NSMutableArray array];
    
    if(count == 26)
    {
        [res addObject:@0];
    }
    
    for (NSInteger i = 0; i < str.length - matchStr.length; i++) {
        
        NSInteger left = [str characterAtIndex:i] - 'a';
        NSInteger right = [str characterAtIndex:i + matchStr.length] - 'a';
        
        s[left]--;
        if(s[left] == p[left])
        {
            count++;
        }
        else if(s[left] == p[left] - 1)
        {
            count--;
        }
        s[right]++;
        if(s[right] == p[right])
        {
            count++;
        }
        else if(s[right] == p[right] + 1)
        {
            count--;
        }
        if(count == 26)
        {
            [res addObject:[NSNumber numberWithInteger:i + 1]];
        }
    }
    return res;
}

+ (void)solution
{
    P438 *case1 = [[P438 alloc] init];
    NSLog(@"%@", [case1 findAnagrams:@"cbaebabacd" match:@"abc"]);
    NSLog(@"%@", [case1 findAnagrams:@"abab" match:@"ab"]);
    
}
@end

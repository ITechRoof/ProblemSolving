//
//  P1297.m
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/maximum-number-of-occurrences-of-a-substring/
//Given a string s, return the maximum number of ocurrences of any substring under the following rules:
//
//The number of unique characters in the substring must be less than or equal to maxLetters.
//The substring size must be between minSize and maxSize inclusive.
//
//
//Example 1:
//
//Input: s = "aababcaab", maxLetters = 2, minSize = 3, maxSize = 4
//Output: 2
//Explanation: Substring "aab" has 2 ocurrences in the original string.
//It satisfies the conditions, 2 unique letters and size 3 (between minSize and maxSize).
//Example 2:
//
//Input: s = "aaaa", maxLetters = 1, minSize = 3, maxSize = 3
//Output: 2
//Explanation: Substring "aaa" occur 2 times in the string. It can overlap.
//Example 3:
//
//Input: s = "aabcabcab", maxLetters = 2, minSize = 2, maxSize = 3
//Output: 3
//Example 4:
//
//Input: s = "abcde", maxLetters = 2, minSize = 3, maxSize = 3
//Output: 0
//
//
//Constraints:
//
//1 <= s.length <= 10^5
//1 <= maxLetters <= 26
//1 <= minSize <= maxSize <= min(26, s.length)
//s only contains lowercase English letters.

#import "P1297.h"

@implementation P1297
- (void)updateForKey:(NSString *)key shouldAdd:(BOOL)shouldAdd dict:(NSMutableDictionary **)dict
{
    NSNumber *count = [*dict objectForKey:key] ?: @0;
    if(!shouldAdd && count.integerValue == 1)
    {
        [*dict removeObjectForKey:key];
    }
    else
    {
        [*dict setObject:[NSNumber numberWithInteger:shouldAdd ? count.integerValue + 1 : count.integerValue - 1] forKey:key];
    }
}
- (NSInteger)maxFreq:(NSString *)str maxLetters:(NSInteger)maxLetters minSize:(NSInteger)minSize maxSize:(NSInteger)maxSize
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSInteger start = 0, end = 0;
    NSMutableDictionary *setMap = [NSMutableDictionary dictionary];
    
    NSString *key = [NSString stringWithFormat:@"%c", [str characterAtIndex:start]];
    NSNumber *count = [dict objectForKey:key] ?: @0;
    [dict setObject:[NSNumber numberWithInteger:count.integerValue + 1] forKey:key];
    
    BOOL shouldMax = YES;
    NSInteger maxCount = 0;
    NSString *maxString = @"";
    while (start < str.length - minSize + 1) {
        
        NSInteger len = end - start + 1;
        if(len < minSize)
        {
            end++;
            [self updateForKey:[NSString stringWithFormat:@"%c", [str characterAtIndex:end]] shouldAdd:YES dict:&dict];
            continue;
        }
        else if (len > maxSize) {
        
            [self updateForKey:[NSString stringWithFormat:@"%c", [str characterAtIndex:start]] shouldAdd:NO dict:&dict];
            start++;
            continue;
        }
        if(dict.allKeys.count <= maxLetters)
        {
            NSString *key = [str substringWithRange:NSMakeRange(start, end - start + 1)];
            NSNumber *count = [setMap objectForKey:key] ?: @0;
            if(maxCount < count.integerValue + 1)
            {
                maxCount = count.integerValue + 1;
                maxString = key;
            }
            [setMap setObject:[NSNumber numberWithInteger:count.integerValue + 1] forKey:key];
        }
        if(len == maxSize)
        {
            shouldMax = NO;
        }
        else if(len == minSize)
        {
            shouldMax = YES;
        }
        if(shouldMax && end < str.length - 1)
        {
            end++;
            [self updateForKey:[NSString stringWithFormat:@"%c", [str characterAtIndex:end]] shouldAdd:YES dict:&dict];
        }
        else
        {
            [self updateForKey:[NSString stringWithFormat:@"%c", [str characterAtIndex:start]] shouldAdd:NO dict:&dict];
            start++;
        }
    }
    return maxCount;
}

+ (void)solution
{
    P1297 *case1 = [[P1297 alloc] init];
    NSLog(@"%ld", (long)[case1 maxFreq:@"aababcaab" maxLetters:2 minSize:3 maxSize:4]);
    NSLog(@"%ld", (long)[case1 maxFreq:@"aaaa" maxLetters:1 minSize:3 maxSize:3]);
    NSLog(@"%ld", (long)[case1 maxFreq:@"aabcabcab" maxLetters:2 minSize:2 maxSize:3]);
    NSLog(@"%ld", (long)[case1 maxFreq:@"abcde" maxLetters:2 minSize:3 maxSize:3]);
    
}
@end

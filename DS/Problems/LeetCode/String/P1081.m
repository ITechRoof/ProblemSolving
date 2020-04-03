//
//  P1081.m
//  DS
//
//  Created by Kiruthika on 03/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/smallest-subsequence-of-distinct-characters/
//Return the lexicographically smallest subsequence of text that contains all the distinct characters of text exactly once.
//
//Example 1:
//
//Input: "cdadabcc"
//Output: "adbc"
//Example 2:
//
//Input: "abcd"
//Output: "abcd"
//Example 3:
//
//Input: "ecbacba"
//Output: "eacb"
//Example 4:
//
//Input: "leetcode"
//Output: "letcod"
//
//
//Constraints:
//
//1 <= text.length <= 1000
//text consists of lowercase English letters.
//https://algorithm-notes-allinone.blogspot.com/2019/09/leetcode-1081-smallest-subsequence-of.html

#import "P1081.h"

@implementation P1081
- (NSString *)smallestSubsequence:(NSString *)str
{
    NSInteger lastIndex[26];
    for (NSInteger i = 0; i < 26; i++) {
        lastIndex[i] = -1;
    }
    //find the last index
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        lastIndex[c - 'a'] = i;
    }
    
    NSString *res = @"";
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        NSInteger right = lastIndex[c - 'a'];
        if(right == -1)
        {
            continue;
        }
        BOOL find = YES;
        //check for char between the range
        for (NSInteger j = i + 1; j < right; j++) {
            char ch = [str characterAtIndex:j];
            if(lastIndex[ch - 'a'] == -1 || c == ch)
            {
                continue;
            }
            if (c - 'a' < ch - 'A' && lastIndex[ch - 'a']  < right) {
                right = lastIndex[ch - 'a'];
            }
            else
            {
                find = NO;
                break;
            }
        }
        
        if(find)
        {
            res = [res stringByAppendingFormat:@"%c",c];
            lastIndex[c - 'a'] = -1;
        }
    }
    return res;
}

+ (void)solution
{
    P1081 *case1 = [[P1081 alloc] init];
    NSLog(@"%@", [case1 smallestSubsequence:@"cdadabcc"]);
    NSLog(@"%@", [case1 smallestSubsequence:@"abcd"]);
    NSLog(@"%@", [case1 smallestSubsequence:@"ecbacba"]);
    NSLog(@"%@", [case1 smallestSubsequence:@"leetcode"]);
    NSLog(@"%@", [case1 smallestSubsequence:@"bcabc"]);
    NSLog(@"%@", [case1 smallestSubsequence:@"cbacdcbc"]);
}
@end

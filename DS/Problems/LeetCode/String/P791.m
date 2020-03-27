//
//  P791.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/custom-sort-string/
//S and T are strings composed of lowercase letters. In S, no letter occurs more than once.
//
//S was sorted in some custom order previously. We want to permute the characters of T so that they match the order that S was sorted. More specifically, if x occurs before y in S, then x should occur before y in the returned string.
//
//Return any permutation of T (as a string) that satisfies this property.
//
//Example :
//Input:
//S = "cba"
//T = "abcd"
//Output: "cbad"
//Explanation:
//"a", "b", "c" appear in S, so the order of "a", "b", "c" should be "c", "b", and "a".
//Since "d" does not appear in S, it can be at any position in T. "dcba", "cdba", "cbda" are also valid outputs.
//
//
//Note:
//
//S has length at most 26, and no character is repeated in S.
//T has length at most 200.
//S and T consist of lowercase letters only.

#import "P791.h"

@implementation P791
- (NSString *)customSortString:(NSString *)s T:(NSString *)T
{
    NSInteger map[26];
    for (NSInteger i = 0; i < 26; i++) {
        map[i] = 0;
    }
    
    for (NSInteger i = 0; i < T.length; i++) {
        map[[T characterAtIndex:i] - 'a']++;
    }
    
    NSString *res = @"";
    for (NSInteger i = 0; i < s.length; i++) {
        char c = [s characterAtIndex:i];
        NSInteger count =  map[c - 'a'];
        while (count > 0) {
            res = [res stringByAppendingFormat:@"%c", c];
            count--;
        }
        map[c - 'a'] = 0;
    }
    
    for (NSInteger i = 0; i < 26; i++) {
        NSInteger count =  map[i];
        while (count > 0) {
            char c = (char) (i + 'a');
            res = [res stringByAppendingFormat:@"%c", c];
            count--;
        }
    }
    return res;
}

+ (void)solution
{
    P791 *case1 = [[P791 alloc] init];
    NSLog(@"%@", [case1 customSortString:@"cba" T:@"abcd"]);
}
@end

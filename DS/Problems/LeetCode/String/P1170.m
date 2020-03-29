//
//  P1170.m
//  DS
//
//  Created by Kiruthika on 29/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/compare-strings-by-frequency-of-the-smallest-character/
//Let's define a function f(s) over a non-empty string s, which calculates the frequency of the smallest character in s. For example, if s = "dcce" then f(s) = 2 because the smallest character is "c" and its frequency is 2.
//
//Now, given string arrays queries and words, return an integer array answer, where each answer[i] is the number of words such that f(queries[i]) < f(W), where W is a word in words.
//
// 
//
//Example 1:
//
//Input: queries = ["cbd"], words = ["zaaaz"]
//Output: [1]
//Explanation: On the first query we have f("cbd") = 1, f("zaaaz") = 3 so f("cbd") < f("zaaaz").
//Example 2:
//
//Input: queries = ["bbb","cc"], words = ["a","aa","aaa","aaaa"]
//Output: [1,2]
//Explanation: On the first query only f("bbb") < f("aaaa"). On the second query both f("aaa") and f("aaaa") are both > f("cc").
// 
//
//Constraints:
//
//1 <= queries.length <= 2000
//1 <= words.length <= 2000
//1 <= queries[i].length, words[i].length <= 10
//queries[i][j], words[i][j] are English lowercase letters.

#import "P1170.h"

@implementation P1170
- (NSInteger)f:(NSString *)w
{
    NSInteger count[26];
    for (NSInteger i = 0; i < 26; i++) {
        count[i] = 0;
    }
    for (NSInteger i = 0; i < w.length; i++) {
        char c = [w characterAtIndex:i];
        count[c - 'a']++;
    }
    
    for (NSInteger i = 0; i < 26; i++) {
        if(count[i] > 0)
        {
            return count[i];
        }
    }
    return 0;
}
- (NSArray *)numSmallerByFrequency:(NSArray <NSString *>*)queries words:(NSArray <NSString *>*)words
{
    NSInteger wordsFreq[words.count];
    for (NSInteger i = 0; i < words.count; i++) {
        wordsFreq[i] = 0;
    }
    for (NSInteger i = 0; i < words.count; i++) {
        wordsFreq[i] = [self f:words[i]];
    }
    
    NSInteger queriesFreq[queries.count];
    for (NSInteger i = 0; i < queries.count; i++) {
        queriesFreq[i] = 0;
    }
    for (NSInteger i = 0; i < queries.count; i++) {
        queriesFreq[i] = [self f:queries[i]];
    }
    
    NSMutableArray *res = [NSMutableArray array];
    for (NSInteger i = 0; i < queries.count; i++) {
        NSInteger count = 0;
        for (NSInteger j = 0; j < words.count; j++) {
            if(wordsFreq[j] > queriesFreq[i])
            {
                count++;
            }
        }
        [res addObject:[NSNumber numberWithInteger:count]];
    }
    return res;
}


+ (void)solution
{
    P1170 *case1 = [[P1170 alloc] init];
    NSLog(@"%@", [case1 numSmallerByFrequency:@[@"cbd"] words:@[@"zaaaz"]]);
    NSLog(@"%@", [case1 numSmallerByFrequency:@[@"bbb",@"cc"] words:@[@"a",@"aa",@"aaa",@"aaaa"]]);
}
@end

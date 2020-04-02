//
//  P966.m
//  DS
//
//  Created by Kiruthika on 02/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/vowel-spellchecker/
//Given a wordlist, we want to implement a spellchecker that converts a query word into a correct word.
//
//For a given query word, the spell checker handles two categories of spelling mistakes:
//
//Capitalization: If the query matches a word in the wordlist (case-insensitive), then the query word is returned with the same case as the case in the wordlist.
//Example: wordlist = ["yellow"], query = "YellOw": correct = "yellow"
//Example: wordlist = ["Yellow"], query = "yellow": correct = "Yellow"
//Example: wordlist = ["yellow"], query = "yellow": correct = "yellow"
//Vowel Errors: If after replacing the vowels ('a', 'e', 'i', 'o', 'u') of the query word with any vowel individually, it matches a word in the wordlist (case-insensitive), then the query word is returned with the same case as the match in the wordlist.
//Example: wordlist = ["YellOw"], query = "yollow": correct = "YellOw"
//Example: wordlist = ["YellOw"], query = "yeellow": correct = "" (no match)
//Example: wordlist = ["YellOw"], query = "yllw": correct = "" (no match)
//In addition, the spell checker operates under the following precedence rules:
//
//When the query exactly matches a word in the wordlist (case-sensitive), you should return the same word back.
//When the query matches a word up to capitlization, you should return the first such match in the wordlist.
//When the query matches a word up to vowel errors, you should return the first such match in the wordlist.
//If the query has no matches in the wordlist, you should return the empty string.
//Given some queries, return a list of words answer, where answer[i] is the correct word for query = queries[i].
//
//
//
//Example 1:
//
//Input: wordlist = ["KiTe","kite","hare","Hare"], queries = ["kite","Kite","KiTe","Hare","HARE","Hear","hear","keti","keet","keto"]
//Output: ["kite","KiTe","KiTe","Hare","hare","","","KiTe","","KiTe"]
//
//
//Note:
//
//1 <= wordlist.length <= 5000
//1 <= queries.length <= 5000
//1 <= wordlist[i].length <= 7
//1 <= queries[i].length <= 7
//All strings in wordlist and queries consist only of english letters.

#import "P966.h"

@implementation P966
- (BOOL)isUpperCase:(char)c
{
    if(c - 'A' >= 0 && c - 'A' <= 26)
    {
        return YES;
    }
    return NO;
}
- (BOOL)isVowel:(char)c
{
    if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U')
    {
        return YES;
    }
    return NO;
}

- (NSArray *)spellchecker:(NSArray *)wordlist queries:(NSArray *)queries
{
    NSMutableArray *res = [[NSMutableArray alloc] init];
    for (NSString *query in queries) {
        if([wordlist containsObject:query])
        {
            [res addObject:query];
            continue;
        }
        
        NSInteger k = 0;
        for (; k < wordlist.count; k++) {
            NSString *word = wordlist[k];
            if([word.lowercaseString isEqualToString:query.lowercaseString])
            {
                [res addObject:word];
                break;
            }
            else if(word.length != query.length)
            {
                continue;
            }
            else
            {
                NSInteger i = 0;
                for (; i < query.length; i++) {
                    char queryCh = [query characterAtIndex:i];
                    char wordCh = [word characterAtIndex:i];
                    if(![self isVowel:queryCh] && ![self isVowel:wordCh])
                    {
                        NSInteger v1 = queryCh - 'a';
                        if([self isUpperCase:queryCh])
                        {
                            v1 = queryCh - 'A';
                        }
                        NSInteger v2 = wordCh - 'a';
                        if([self isUpperCase:wordCh])
                        {
                            v2 = wordCh - 'A';
                        }
                        if(v1 != v2)
                        {
                            break;
                        }
                    }
                    else if([self isVowel:queryCh] && [self isVowel:wordCh])
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                if(i == query.length)
                {
                    [res addObject:word];
                    break;
                }
            }
        }
        if(k == wordlist.count)
        {
            [res addObject:@""];
        }
    }
    return res;
}

+ (void)solution
{
    P966 *case1 = [[P966 alloc] init];
    NSLog(@"%@", [case1 spellchecker:@[@"KiTe",@"kite",@"hare",@"Hare"] queries:@[@"kite",@"Kite",@"KiTe",@"Hare",@"HARE",@"Hear",@"hear",@"keti",@"keet",@"keto"]]);
}
@end

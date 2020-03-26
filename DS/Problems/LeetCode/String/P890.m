//
//  P890.m
//  DS
//
//  Created by Kiruthika on 26/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/find-and-replace-pattern/
//You have a list of words and a pattern, and you want to know which words in words matches the pattern.
//
//A word matches the pattern if there exists a permutation of letters p so that after replacing every letter x in the pattern with p(x), we get the desired word.
//
//(Recall that a permutation of letters is a bijection from letters to letters: every letter maps to another letter, and no two letters map to the same letter.)
//
//Return a list of the words in words that match the given pattern.
//
//You may return the answer in any order.
//
//
//
//Example 1:
//
//Input: words = ["abc","deq","mee","aqq","dkd","ccc"], pattern = "abb"
//Output: ["mee","aqq"]
//Explanation: "mee" matches the pattern because there is a permutation {a -> m, b -> e, ...}.
//"ccc" does not match the pattern because {a -> c, b -> c, ...} is not a permutation,
//since a and b map to the same letter.
//
//
//Note:
//
//1 <= words.length <= 50
//1 <= pattern.length = words[i].length <= 20

#import "P890.h"

@implementation P890

-(BOOL)isMatch:(NSString *)word pattern:(NSString *)pattern
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < pattern.length; i++) {
        
        char w = [word characterAtIndex:i];
        char p = [pattern characterAtIndex:i];
        
        NSString *key = [NSString stringWithFormat:@"%c", p];
        NSString *val = [NSString stringWithFormat:@"%c", w];
        NSString *v = [dict objectForKey:key];

        if(v && ![v isEqualToString:val])
        {
            return NO;
        }
        [dict setObject:val forKey:key];
    }
    BOOL isSeen[26];
    for (NSInteger i = 0; i < 26; i++) {
         isSeen[i] = NO;
     }
    
    for (NSString *v in dict.allValues) {
          char w = [v characterAtIndex:0];
        if(isSeen[w - 'a'])
        {
            return NO;
        }
        isSeen[w - 'a'] = YES;
    }
    return YES;
}
- (NSArray *)findAndReplacePattern:(NSArray <NSString *> *)words pattern:(NSString *)pattern
{
    NSMutableArray *res = [NSMutableArray array];
    for (NSInteger i = 0; i < words.count; i++) {
        if([self isMatch:words[i] pattern:pattern])
        {
            [res addObject:words[i]];
        }
    }
    return res;
}

+ (void)solution
{
    P890 *case1 = [[P890 alloc] init];
    NSLog(@"%@", [case1 findAndReplacePattern:@[@"abc",@"deq",@"mee",@"aqq",@"dkd",@"ccc"] pattern:@"abb"]);
}
@end

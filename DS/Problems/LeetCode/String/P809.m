//
//  P809.m
//  DS
//
//  Created by Kiruthika on 05/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/expressive-words/
//Sometimes people repeat letters to represent extra feeling, such as "hello" -> "heeellooo", "hi" -> "hiiii".  In these strings like "heeellooo", we have groups of adjacent letters that are all the same:  "h", "eee", "ll", "ooo".
//
//For some given string S, a query word is stretchy if it can be made to be equal to S by any number of applications of the following extension operation: choose a group consisting of characters c, and add some number of characters c to the group so that the size of the group is 3 or more.
//
//For example, starting with "hello", we could do an extension on the group "o" to get "hellooo", but we cannot get "helloo" since the group "oo" has size less than 3.  Also, we could do another extension like "ll" -> "lllll" to get "helllllooo".  If S = "helllllooo", then the query word "hello" would be stretchy because of these two extension operations: query = "hello" -> "hellooo" -> "helllllooo" = S.
//
//Given a list of query words, return the number of words that are stretchy.
//
//
//
//Example:
//Input:
//S = "heeellooo"
//words = ["hello", "hi", "helo"]
//Output: 1
//Explanation:
//We can extend "e" and "o" in the word "hello" to get "heeellooo".
//We can't extend "helo" to get "heeellooo" because the group "ll" is not size 3 or more.
//
//
//Notes:
//
//0 <= len(S) <= 100.
//0 <= len(words) <= 100.
//0 <= len(words[i]) <= 100.
//S and all words in words consist only of lowercase letters

#import "P809.h"
@interface WordPair: NSObject

@property (nonatomic) char ch;
@property (nonatomic) NSInteger charCount;

@end

@implementation WordPair
@end

@implementation P809
- (BOOL)isValid:(WordPair *)p currentChar:(char)currentChar currentCount:(NSInteger)currentCount
{
    if(p.ch == currentChar)
    {
        NSInteger charCount =  p.charCount;
        if (currentCount > charCount) {
            return NO;
        }
        else if(charCount < 3)
        {
            if(currentCount != charCount)
            {
                return NO;
            }
        }
    }
    else
    {
        return NO;
    }
    return YES;
}
- (NSInteger)expressiveWords:(NSString *)str words:(NSArray *)words
{
    NSMutableArray *sMap = [NSMutableArray array];
    NSInteger currentCharCount = 1;
    char currentCh = [str characterAtIndex:0];
    for (NSInteger i = 1; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        if(c == currentCh)
        {
            currentCharCount++;
        }
        else
        {
            WordPair *p = [WordPair new];
            p.ch = currentCh;
            p.charCount = currentCharCount;
            [sMap addObject:p];
            currentCharCount = 1;
            currentCh = c;
        }
    }
    
    WordPair *p = [WordPair new];
    p.ch = currentCh;
    p.charCount = currentCharCount;
    [sMap addObject:p];
    
    NSInteger res = 0;
    for (NSString *word in words) {
        NSInteger currentCharCount = 1;
        char currentCh = [word characterAtIndex:0];
        NSInteger charIndex = 0;
        NSInteger i = 1;
        for (; i < word.length; i++) {
            char c = [word characterAtIndex:i];
            if(c == currentCh)
            {
                currentCharCount++;
            }
            else
            {
                if(![self isValid:sMap[charIndex] currentChar:currentCh currentCount:currentCharCount])
                {
                    break;
                }
                charIndex++;
                currentCharCount = 1;
                currentCh = c;
            }
        }

        if(i == word.length && [self isValid:sMap[charIndex] currentChar:currentCh currentCount:currentCharCount])
        {
            res++;
        }
    }
    return res;
}

+ (void)solution
{
    P809 *case1 = [[P809 alloc] init];
    NSLog(@"%ld", (long)[case1 expressiveWords:@"heeellooo" words:@[@"hello", @"hi", @"helo"]]);
}

@end

//
//  P1048.m
//  DS
//
//  Created by Kiruthika on 20/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/longest-string-chain/
//Given a list of words, each word consists of English lowercase letters.
//
//Let's say word1 is a predecessor of word2 if and only if we can add exactly one letter anywhere in word1 to make it equal to word2.  For example, "abc" is a predecessor of "abac".
//
//A word chain is a sequence of words [word_1, word_2, ..., word_k] with k >= 1, where word_1 is a predecessor of word_2, word_2 is a predecessor of word_3, and so on.
//
//Return the longest possible length of a word chain with words chosen from the given list of words.
//
//
//
//Example 1:
//
//Input: ["a","b","ba","bca","bda","bdca"]
//Output: 4
//Explanation: one of the longest word chain is "a","ba","bda","bdca".
//
//
//Note:
//
//1 <= words.length <= 1000
//1 <= words[i].length <= 16
//words[i] only consists of English lowercase letters.


#import "P1048.h"

@implementation P1048
- (NSInteger)findLongest:(NSArray *)arr
{
    NSMutableDictionary *adjacencyList =[[NSMutableDictionary alloc] init];
    
    for(NSString *item in arr)
    {
        NSMutableArray *list = [NSMutableArray arrayWithArray:@[]];
        
        for(NSString *key in adjacencyList.allKeys)
        {
            if([self canConnect:key strin2:item])
            {
                NSMutableArray *currentList =  [NSMutableArray arrayWithArray:[adjacencyList objectForKey:key ?: @[]]];
                [currentList addObject:item];
                [adjacencyList setObject:currentList forKey:key];
                
                [list addObject:key];
            }
        }
        [adjacencyList setObject:list forKey:item];
    }
    
    NSMutableDictionary *visited = [[NSMutableDictionary alloc] init];
    for(NSString *key in adjacencyList.allKeys)
    {
        [visited setObject:[NSNumber numberWithBool:NO] forKey:key];
    }
    NSString *farthest;
    NSInteger count = 1, maxCount = 1;
    
    NSMutableDictionary *temp = [visited mutableCopy];
    
    NSString *start;
    for (NSString *item in arr) {
        NSArray *currentList =  [adjacencyList objectForKey:item];

        if(currentList.count > 0)
        {
            start = item;
            break;
        }
    }
    [self dfsHelper:adjacencyList visited:&temp startVertex:start farthestVertex:&farthest count:count maxCount:&maxCount];
    
    NSString *otherFarthest;
    temp = [visited mutableCopy];
    [self dfsHelper:adjacencyList visited:&temp startVertex:farthest farthestVertex:&otherFarthest count:count maxCount:&maxCount];
    
    return maxCount;
}

- (BOOL)canConnect:(NSString *)from strin2:(NSString *)to
{
    if(from.length != to.length - 1)
    {
        return NO;
    }
    BOOL isCharSkipped = NO;
    NSInteger s1 = 0, s2 = 0;
    while (s1 < from.length && s2 <to.length)
    {
        if([from characterAtIndex:s1] == [to characterAtIndex:s2])
        {
            s1++;
            s2++;
        }
        else
        {
            if(isCharSkipped)
            {
                return NO;
            }
            isCharSkipped = YES;
            s2++;
        }
    }
    
    return YES;
}
- (void)dfsHelper:(NSMutableDictionary *)adjList visited:(NSMutableDictionary ** )visited startVertex:(NSString *)start farthestVertex:(NSString **)farthest count:(NSInteger)count maxCount:(NSInteger *)maxCount
{
    [*visited setObject:[NSNumber numberWithBool:YES] forKey:start];
    count++;
    
    NSArray<NSString *> *neighBors = [adjList objectForKey:start];
    for (NSString *vertex in neighBors) {
        if([*visited objectForKey:vertex] != [NSNumber numberWithBool:YES] && vertex.length > start.length)
        {
            if(count > *maxCount)
            {
                *maxCount = count;
                *farthest = vertex;
            }
            [self dfsHelper:adjList visited:visited startVertex:vertex farthestVertex:farthest count:count maxCount:maxCount];
        }
    }
}

+ (void)solution
{
    P1048 *case1 = [[P1048 alloc] init];
    NSLog(@"%ld", (long)[case1 findLongest:@[@"a",@"b",@"ba",@"bca",@"bda",@"bdca"]]);
    NSLog(@"%ld", (long)[case1 findLongest:@[@"a",@"b",@"bca",@"bda",@"bdca"]]);
    NSLog(@"%ld", (long)[case1 findLongest:@[@"a",@"b",@"de",@"xyz",@"bda",@"bdca"]]);
}

@end

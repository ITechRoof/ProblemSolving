//
//  P767.m
//  DS
//
//  Created by Kiruthika on 05/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/reorganize-string/
//Given a string S, check if the letters can be rearranged so that two characters that are adjacent to each other are not the same.
//
//If possible, output any possible result.  If not possible, return the empty string.
//
//Example 1:
//
//Input: S = "aab"
//Output: "aba"
//Example 2:
//
//Input: S = "aaab"
//Output: ""
//Note:
//
//S will consist of lowercase letters and have length in range [1, 500].

#import "P767.h"
#import "PriorityQueue.h"

@implementation P767
- (NSString *)reorganizeString:(NSString *)str
{
    NSInteger count[26];
    for(NSInteger i = 0; i < 26; i++)
    {
        count[i] = 0;
    }
        
    for (int i = 0; i < str.length; i++) {
        count[[str characterAtIndex:i] - 'a']++;
    }
    PriorityQueue *queue = [[PriorityQueue alloc] init];
    for(NSInteger i = 0; i < 26; i++)
    {
        if(count[i] > (str.length + 1) / 2)
        {
            return @"";
        }
        if(count[i] > 0)
        {
            Pair *p = [[Pair alloc] init];
            p.count = count[i];
            p.key =  [NSString stringWithFormat:@"%c",(char)i + 'a'];
            [queue push:p];
        }
        count[i] = 0;
    }
    
    NSString *res = @"";
    
    while (res.length != str.length) {
        Pair *top = [queue extractMax];
        if(res.length == 0 || [top.key isEqualToString:[NSString stringWithFormat:@"%c",[res characterAtIndex:res.length - 1]]])
        {
            res = [res stringByAppendingString:top.key];
            top.count--;
        }
        else
        {
            Pair *secondMax = [queue extractMax];
            res = [res stringByAppendingString:secondMax.key];
            secondMax.count--;
            if (secondMax.count > 0) {
                 [queue push:secondMax];
            }
        }
        if(top.count > 0)
        {
            [queue push:top];
        }
    }
    
    return res;
}

+ (void)solution
{
    P767 *case1 = [[P767 alloc] init];
    NSLog(@"%@", [case1 reorganizeString:@"aab"]);
    NSLog(@"%@", [case1 reorganizeString:@"aaaaabbbbbcc"]);
}
@end

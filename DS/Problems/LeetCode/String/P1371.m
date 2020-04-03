//
//  P1371.m
//  DS
//
//  Created by Kiruthika on 03/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/find-the-longest-substring-containing-vowels-in-even-counts/
//Given the string s, return the size of the longest substring containing each vowel an even number of times. That is, 'a', 'e', 'i', 'o', and 'u' must appear an even number of times.
//
//
//
//Example 1:
//
//Input: s = "eleetminicoworoep"
//Output: 13
//Explanation: The longest substring is "leetminicowor" which contains two each of the vowels: e, i and o and zero of the vowels: a and u.
//Example 2:
//
//Input: s = "leetcodeisgreat"
//Output: 5
//Explanation: The longest substring is "leetc" which contains two e's.
//Example 3:
//
//Input: s = "bcbcbc"
//Output: 6
//Explanation: In this case, the given string "bcbcbc" is the longest because all vowels: a, e, i, o and u appear zero times.
//
//
//Constraints:
//
//1 <= s.length <= 5 x 10^5
//s contains only lowercase English letters.

#import "P1371.h"

@implementation P1371

- (BOOL)isVowel:(char)c
{
    if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
    {
        return YES;
    }
    return NO;
}

- (NSInteger)indexOfVowel:(char)c
{
    if(c == 'a')
    {
        return 0;
    }
    else if(c == 'e')
    {
        return 1;
    }
    else if(c == 'i')
    {
        return 2;
    }
    else if(c == 'o')
    {
        return 3;
    }
    return 4;
}
- (NSInteger)findTheLongestSubstring:(NSString *)str
{
    NSMutableArray *state = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        [state addObject:@NO];
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[NSNumber numberWithInteger:-1] forKey:state];

    NSInteger len = 0;
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        if([self isVowel:c])
        {
            NSNumber *curState = [state objectAtIndex:[self indexOfVowel:c]];
            [state replaceObjectAtIndex:[self indexOfVowel:c] withObject:[NSNumber numberWithBool:!curState.boolValue]];
        }
        if(![dict objectForKey:state])
        {
            [dict setObject:[NSNumber numberWithInteger:i] forKey:state];
        }
        
        NSNumber *v = [dict objectForKey:state];
        len = MAX(len, i - v.integerValue);
    }
    return len;
}

+ (void)solution
{
    P1371 *case1 = [[P1371 alloc] init];
    NSLog(@"%ld", (long)[case1 findTheLongestSubstring:@"eleetminicoworoep"]);
    NSLog(@"%ld", (long)[case1 findTheLongestSubstring:@"leetcodeisgreat"]);
    NSLog(@"%ld", (long)[case1 findTheLongestSubstring:@"bcbcbc"]);
}
@end

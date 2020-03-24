//
//  P1209.m
//  DS
//
//  Created by Kiruthika on 24/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
//Given a string s, a k duplicate removal consists of choosing k adjacent and equal letters from s and removing them causing the left and the right side of the deleted substring to concatenate together.
//
//We repeatedly make k duplicate removals on s until we no longer can.
//
//Return the final string after all such duplicate removals have been made.
//
//It is guaranteed that the answer is unique.
//
// 
//
//Example 1:
//
//Input: s = "abcd", k = 2
//Output: "abcd"
//Explanation: There's nothing to delete.
//Example 2:
//
//Input: s = "deeedbbcccbdaa", k = 3
//Output: "aa"
//Explanation:
//First delete "eee" and "ccc", get "ddbbbdaa"
//Then delete "bbb", get "dddaa"
//Finally delete "ddd", get "aa"
//Example 3:
//
//Input: s = "pbbcggttciiippooaais", k = 2
//Output: "ps"
// 
//
//Constraints:
//
//1 <= s.length <= 10^5
//2 <= k <= 10^4
//s only contains lower case English letters.

#import "P1209.h"
#import "StackUsingArray.h"

@interface CountPair : NSObject

@property (nonatomic) char c;
@property (nonatomic) NSInteger count;

@end

@implementation CountPair

@end

@implementation P1209
- (NSString *)removeDuplicates:(NSString *)str k:(NSInteger)k
{
    NSString *result = @"";
    
    if(k <= 1)
    {
        return result;
    }
    StackUsingArray *s = [[StackUsingArray alloc] init];
    
    for (NSInteger i = 0; i < str.length; i++) {
        CountPair *top = [s top];
        char ch = [str characterAtIndex:i];
        if(top && top.c == ch)
        {
            if(top.count == k - 1)
            {
                [s pop];
            }
            else
            {
                top.count++;
            }
        }
        else
        {
            CountPair *p = [[CountPair alloc] init];
            p.c = ch;
            p.count = 1;
            [s push:p];
        }
    }
    
    CountPair *t = [s top];
    while (t) {
        int i = 0;
        NSString *temp = @"";
        while (i < t.count) {
            temp = [NSString stringWithFormat:@"%c%@",t.c, temp];
            i++;
        }
        result = [temp stringByAppendingString:result];
        [s pop];
        t = [s top];
    }
    return result;
}
+ (void)solution
{
    P1209 *case1 = [[P1209 alloc] init];
    NSLog(@"%@", [case1 removeDuplicates:@"abcd" k:2]);
    NSLog(@"%@", [case1 removeDuplicates:@"deeedbbcccbdaa" k:3]);
    NSLog(@"%@", [case1 removeDuplicates:@"pbbcggttciiippooaais" k:2]);
}
@end

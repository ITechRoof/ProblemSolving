//
//  P1047.m
//  DS
//
//  Created by Kiruthika on 17/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/
//Given a string S of lowercase letters, a duplicate removal consists of choosing two adjacent and equal letters, and removing them.
//
//We repeatedly make duplicate removals on S until we no longer can.
//
//Return the final string after all such duplicate removals have been made.  It is guaranteed the answer is unique.
//
//
//
//Example 1:
//
//Input: "abbaca"
//Output: "ca"
//Explanation:
//For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".
//
//
//Note:
//
//1 <= S.length <= 20000
//S consists only of English lowercase letters.

#import "P1047.h"
#import "StackUsingArray.h"

@implementation P1047
- (NSString *)removeDuplicates:(NSString *)str
{
    StackUsingArray *s = [[StackUsingArray alloc] init];
    for (int i = 0; i < str.length; i++) {
        NSString *c = [NSString stringWithFormat:@"%c", [str characterAtIndex:i]];
        if([c isEqualToString:[s top]])
        {
            [s pop];
        }
        else
        {
            [s push:c];
        }
    }
    
    NSString *result = @"";
     while(![s isEmpty]) {
         NSString *top = [s top];
         result = [top stringByAppendingString:result];
         [s pop];
     }
    return result;
}

+ (void)solution
{
    P1047 *case1 = [[P1047 alloc] init];
    NSLog(@"Result: %@", [case1 removeDuplicates:@"abbaca"]);
    NSLog(@"Result: %@", [case1 removeDuplicates:@""]);
    NSLog(@"Result: %@", [case1 removeDuplicates:@"abba"]);
    NSLog(@"Result: %@", [case1 removeDuplicates:@"d"]);
}
@end

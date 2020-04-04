//
//  P22.m
//  DS
//
//  Created by Kiruthika on 04/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/generate-parentheses/
//Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//For example, given n = 3, a solution set is:
//
//[
//  "((()))",
//  "(()())",
//  "(())()",
//  "()(())",
//  "()()()"
//]

#import "P22.h"

@implementation P22

- (NSArray *)generateParenthesis:(NSInteger)N
{
    if(N == 0)
    {
        return @[@""];
    }
    NSMutableSet *set = [NSMutableSet set];
    
    for (NSInteger i = 0; i < N; i++) {
        for (NSString *left in [self generateParenthesis:i]) {
           for (NSString *right in [self generateParenthesis:N-1-i]) {
                [set addObject:[NSString stringWithFormat:@"(%@)%@", left,right]];
            }
        }
    }
    return set.allObjects;
}

+ (void)solution
{
    P22 *case1 = [[P22 alloc] init];
    NSLog(@"%@", [case1 generateParenthesis:3]);
    NSLog(@"%@", [case1 generateParenthesis:2]);
    NSLog(@"%@", [case1 generateParenthesis:1]);
    NSLog(@"%@", [case1 generateParenthesis:4]);
}
@end

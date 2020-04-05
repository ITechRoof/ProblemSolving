//
//  P856.m
//  DS
//
//  Created by Kiruthika on 05/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/score-of-parentheses/
//Given a balanced parentheses string S, compute the score of the string based on the following rule:
//
//() has score 1
//AB has score A + B, where A and B are balanced parentheses strings.
//(A) has score 2 * A, where A is a balanced parentheses string.
//
//
//Example 1:
//
//Input: "()"
//Output: 1
//Example 2:
//
//Input: "(())"
//Output: 2
//Example 3:
//
//Input: "()()"
//Output: 2
//Example 4:
//
//Input: "(()(()))"
//Output: 6
//
//
//Note:
//
//S is a balanced parentheses string, containing only ( and ).
//2 <= S.length <= 50

#import "P856.h"

@implementation P856
- (NSInteger)scoreOfParentheses:(NSString *)str
{
    NSInteger open = 0, res = 0;
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        if(c == '(')
        {
            open++;
        }
        else
        {
            open--;
            if([str characterAtIndex:i - 1] == '(') //need not check for i > 0 as str is balanced
            {
                res = res + (1 << open);
            }
        }
    }
    return res;
}

+ (void)solution
{
    P856 *case1 = [[P856 alloc] init];
    NSLog(@"%ld", (long)[case1 scoreOfParentheses:@"()"]);
    NSLog(@"%ld", (long)[case1 scoreOfParentheses:@"(())"]);
    NSLog(@"%ld", (long)[case1 scoreOfParentheses:@"()()"]);
    NSLog(@"%ld", (long)[case1 scoreOfParentheses:@"(()(()))"]);
}
@end

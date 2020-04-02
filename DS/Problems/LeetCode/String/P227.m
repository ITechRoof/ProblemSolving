//
//  P227.m
//  DS
//
//  Created by Kiruthika on 01/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/basic-calculator-ii/
//Implement a basic calculator to evaluate a simple expression string.
//
//The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.
//
//Example 1:
//
//Input: "3+2*2"
//Output: 7
//Example 2:
//
//Input: " 3/2 "
//Output: 1
//Example 3:
//
//Input: " 3+5 / 2 "
//Output: 5
//Note:
//
//You may assume that the given expression is always valid.
//Do not use the eval built-in library function.

#import "P227.h"
#import "StackUsingArray.h"

@implementation P227
- (BOOL)isNumber:(char)c
{
    return (c - '0' >= 0 && c - '0' <= 9);
}
- (NSInteger)calculate:(NSString *)str
{
    StackUsingArray *s = [ StackUsingArray new];
    
    NSInteger num = 0,res = 0;
    char operand = '+';
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        
        if([self isNumber:c])
        {
            num = num * 10 + (c - '0');
        }
        
        if(c != ' ' || i == str.length - 1)
        {
            if(operand == '+')
            {
                [s push:[NSNumber numberWithInteger:num]];
            }
            else if(operand == '-')
            {
                [s push:[NSNumber numberWithInteger:0 - num]];
            }else if(operand == '*')
            {
                NSNumber *top = [s top];
                [s pop];
                [s push:[NSNumber numberWithInteger:top.integerValue * num]];
            }else if(operand == '/')
            {
                NSNumber *top = [s top];
                [s pop];
                [s push:[NSNumber numberWithInteger:top.integerValue / num]];
            }
            num = 0;
            operand = c;
        }
    }
    
    while (![s isEmpty]) {
        NSNumber *top = [s top];
        res = res + top.integerValue;
        [s pop];
    }
    return res;
}
+ (void)solution
{
    P227 *case1 = [[P227 alloc] init];
    NSLog(@"%ld", (long)[case1 calculate:@"3+2*2"]);
    NSLog(@"%ld", (long)[case1 calculate:@"3/2"]);
    NSLog(@"%ld", (long)[case1 calculate:@" 3+5 / 2 "]);
}
@end

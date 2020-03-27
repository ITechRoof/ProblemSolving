//
//  P20.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/valid-parentheses/
//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Note that an empty string is also considered valid.
//
//Example 1:
//
//Input: "()"
//Output: true
//Example 2:
//
//Input: "()[]{}"
//Output: true
//Example 3:
//
//Input: "(]"
//Output: false
//Example 4:
//
//Input: "([)]"
//Output: false
//Example 5:
//
//Input: "{[]}"
//Output: true

#import "P20.h"
#import "StackUsingArray.h"

@implementation P20

- (BOOL)isValid:(NSString *)str
{
    StackUsingArray *s = [[StackUsingArray alloc] init];
    
    for (NSInteger i = 0; i < str.length; i++) {
        char ch = [str characterAtIndex:i];
        NSString *c = [NSString stringWithFormat:@"%c", ch];
        
        if([c isEqualToString:@"("] || [c isEqualToString:@"{"] || [c isEqualToString:@"["])
        {
            [s push:c];
        }
        else
        {
            NSString *top = [s top];
            if([top isEqualToString:@"("] && [c isEqualToString:@")"])
            {
                [s pop];
            }
            else if([top isEqualToString:@"{"] && [c isEqualToString:@"}"])
            {
                [s pop];
            }
            else if([top isEqualToString:@"["] && [c isEqualToString:@"]"])
            {
                [s pop];
            }
            else
            {
                return NO;
            }
        }
    }
    return [s isEmpty];
}

+ (void)solution
{
    P20 *case1 = [[P20 alloc] init];
    [case1 isValid:@"()"] ? NSLog(@"Valid") : NSLog(@"Not valid");
    [case1 isValid:@"()[]{}"] ? NSLog(@"Valid") : NSLog(@"Not valid");
    [case1 isValid:@"([)]"] ? NSLog(@"Valid") : NSLog(@"Not valid");
    [case1 isValid:@"(]"] ? NSLog(@"Valid") : NSLog(@"Not valid");
    [case1 isValid:@"{[]}"] ? NSLog(@"Valid") : NSLog(@"Not valid");
}
@end

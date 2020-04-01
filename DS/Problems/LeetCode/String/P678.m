//
//  P678.m
//  DS
//
//  Created by Kiruthika on 01/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/valid-parenthesis-string/
//Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:
//
//Any left parenthesis '(' must have a corresponding right parenthesis ')'.
//Any right parenthesis ')' must have a corresponding left parenthesis '('.
//Left parenthesis '(' must go before the corresponding right parenthesis ')'.
//'*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
//An empty string is also valid.
//Example 1:
//Input: "()"
//Output: True
//Example 2:
//Input: "(*)"
//Output: True
//Example 3:
//Input: "(*))"
//Output: True
//Note:
//The string size will be in the range [1, 100].

#import "P678.h"

@implementation P678
- (BOOL)checkValidString:(NSString *)str
{
    NSInteger low = 0, high = 0;
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        if(c == '(')
        {
            low++;
            high++;
        }
        else if(c == ')')
        {
            if(low > 0)
                       {
                           low--;
                       }
            high--;
        }
        else
        {
            if(low > 0)
            {
                low--;
            }
            high++;
        }
        if(high < 0)
        {
            return NO;
        }
    }
    return low == 0;
}
+ (void)solution
{
    P678 *case1 = [[P678 alloc] init];
    [case1 checkValidString: @"()"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 checkValidString: @"(*)"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 checkValidString: @"(*))"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 checkValidString: @"(**)("] ? NSLog(@"Valid") : NSLog(@"Not Valid");
}
@end

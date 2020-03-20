//
//  P8.m
//  DS
//
//  Created by Kiruthika on 20/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/string-to-integer-atoi/
//Implement atoi which converts a string to an integer.
//
//The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
//
//The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
//
//If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
//
//If no valid conversion could be performed, a zero value is returned.
//
//Note:
//
//Only the space character ' ' is considered as whitespace character.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
//Example 1:
//
//Input: "42"
//Output: 42
//Example 2:
//
//Input: "   -42"
//Output: -42
//Explanation: The first non-whitespace character is '-', which is the minus sign.
//             Then take as many numerical digits as possible, which gets 42.
//Example 3:
//
//Input: "4193 with words"
//Output: 4193
//Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
//Example 4:
//
//Input: "words and 987"
//Output: 0
//Explanation: The first non-whitespace character is 'w', which is not a numerical
//             digit or a +/- sign. Therefore no valid conversion could be performed.
//Example 5:
//
//Input: "-91283472332"
//Output: -2147483648
//Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
//             Thefore INT_MIN (−231) is returned.

#import "P8.h"

@implementation P8

- (NSInteger)stringToInt:(NSString *)string {
     if(!string)
    {
        return 0;
    }
    
    BOOL isNegative = NO;
    NSInteger value = 0;
    for(int i = 0; i < string.length; i++)
    {
        char c = [string characterAtIndex:i];
        if(c == '-')
        {
            isNegative = YES;
            continue;
        }
        else if(c >= '0' && c <= '9')
        {
            NSInteger val = (NSInteger)(c) - (NSInteger)'0';
            value = val + (value * 10); //
        }
        else if(c != ' ')
        {
            break;
        }
    }
    value = MIN(value, pow(2, 31));
    return isNegative ? value * -1 : value;
}

+ (void)solution
{
    P8 *case1 = [[P8 alloc] init];
    NSLog(@"%ld", (long)[case1 stringToInt:@"42"]);
    NSLog(@"%ld", (long)[case1 stringToInt:@"   -42"]);
    NSLog(@"%ld", (long)[case1 stringToInt:@"4193 with words"]);
    NSLog(@"%ld", (long)[case1 stringToInt:@"words and 987"]);
    NSLog(@"%ld", (long)[case1 stringToInt:@"-91283472332"]);
}

@end

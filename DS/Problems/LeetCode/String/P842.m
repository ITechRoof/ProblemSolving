//
//  P842.m
//  DS
//
//  Created by Kiruthika on 01/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/split-array-into-fibonacci-sequence/
//Given a string S of digits, such as S = "123456579", we can split it into a Fibonacci-like sequence [123, 456, 579].
//
//Formally, a Fibonacci-like sequence is a list F of non-negative integers such that:
//
//0 <= F[i] <= 2^31 - 1, (that is, each integer fits a 32-bit signed integer type);
//F.length >= 3;
//and F[i] + F[i+1] = F[i+2] for all 0 <= i < F.length - 2.
//Also, note that when splitting the string into pieces, each piece must not have extra leading zeroes, except if the piece is the number 0 itself.
//
//Return any Fibonacci-like sequence split from S, or return [] if it cannot be done.
//
//Example 1:
//
//Input: "123456579"
//Output: [123,456,579]
//Example 2:
//
//Input: "11235813"
//Output: [1,1,2,3,5,8,13]
//Example 3:
//
//Input: "112358130"
//Output: []
//Explanation: The task is impossible.
//Example 4:
//
//Input: "0123"
//Output: []
//Explanation: Leading zeroes are not allowed, so "01", "2", "3" is not valid.
//Example 5:
//
//Input: "1101111"
//Output: [110, 1, 111]
//Explanation: The output [11, 0, 11, 11] would also be accepted.
//Note:
//
//1 <= S.length <= 200
//S contains only digits.

#import "P842.h"

@implementation P842
- (BOOL)isValidFib:(NSInteger)f2 f3:(NSInteger)f3 s:(NSString *)s
{
    if(s.length == 0)
    {
        return YES;
    }
    NSString *f3Str = [NSString stringWithFormat:@"%ld", (long)f3];
    if(s.length < f3Str.length)
    {
        NSString *sub = [f3Str substringToIndex:s.length];
        if(![s isEqualToString:sub])
        {
            return NO;
        }
    }
    else if(![[s substringToIndex:f3Str.length] isEqualToString:f3Str])
    {
        return NO;
    }
    NSString *newStr = s;
    if(s.length >= f3Str.length)
    {
        newStr = [s substringFromIndex:f3Str.length];
    }
    
    return [self isValidFib:f3 f3:f2 + f3 s:newStr];
}
- (NSArray *) splitIntoFibonacci:(NSString *)str
{
    NSMutableArray *arr = [NSMutableArray array];
    NSInteger f1 = 0;
    for (NSInteger i = 0; i < str.length; i++) {
        
        char c = [str characterAtIndex:i];
        f1 = f1 * 10 + (c - '0');
        
        if(c == '0' && f1 > 0)
        {
            continue;
        }
         
        NSInteger f2 = 0;
        for (NSInteger j = i + 1; j < str.length; j++) {
            char c2 = [str characterAtIndex:j];
            f2 = f2 * 10 + (c2 - '0');
            
            if(c2 == '0' && f2 > 0)
            {
                continue;
            }
            NSString *f1Str = [NSString stringWithFormat:@"%ld", (long)f1];

            NSString *f2Str = [NSString stringWithFormat:@"%ld", (long)f2];

            NSInteger f3 = f1 + f2;
            if([self isValidFib:f2 f3:f3 s:[str substringFromIndex:f2Str.length + f1Str.length]] && [str substringFromIndex:f2Str.length + f1Str.length].length > 0)
            {
                [arr addObject:[NSNumber numberWithInteger:f1]];
                [arr addObject:[NSNumber numberWithInteger:f2]];

                NSString *currentStr = [str substringFromIndex:f2Str.length + f1Str.length];
                while (currentStr.length > 0) {
                    [arr addObject:[NSNumber numberWithInteger:f3]];
                    NSString *f3Str = [NSString stringWithFormat:@"%ld", (long)f3];

                                       currentStr = [currentStr substringFromIndex:f3Str.length];
                    f1 = f2;
                    f2 = f3;
                    f3 = f1 + f2;
                }
                 return arr;
            }
        }
    }
    return arr;
}

+ (void)solution
{
    P842 *case1 = [[P842 alloc] init];
    NSLog(@"%@", [case1 splitIntoFibonacci:@"123456579"]);
    NSLog(@"%@", [case1 splitIntoFibonacci:@"11235813"]);
    NSLog(@"%@", [case1 splitIntoFibonacci:@"112358130"]);
    NSLog(@"%@", [case1 splitIntoFibonacci:@"0123"]);
    NSLog(@"%@", [case1 splitIntoFibonacci:@"1101111"]);
}
@end

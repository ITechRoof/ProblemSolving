//
//  P415.m
//  DS
//
//  Created by Kiruthika on 18/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/add-strings/
//Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.
//
//Note:
//
//The length of both num1 and num2 is < 5100.
//Both num1 and num2 contains only digits 0-9.
//Both num1 and num2 does not contain any leading zero.
//You must not use any built-in BigInteger library or convert the inputs to integer directly.

#import "P415.h"

@implementation P415

- (NSString *)addTwoString:(NSString *)str1 String2:(NSString *)str2
{
    NSInteger str1Index = str1.length - 1;
    NSInteger str2Index = str2.length - 1;

    NSInteger carry = 0;
    NSString *res = @"";
    for (; str1Index >= 0 || str1Index >= 0; str1Index--, str2Index--) {
        char char1 = '0', char2 = '0';
        if(str1Index >= 0)
        {
            char1 = [str1 characterAtIndex:str1Index];
        }
        if(str2Index >= 0)
        {
            char2 = [str2 characterAtIndex:str2Index];
        }
        carry = carry + (NSInteger)char1 - (NSInteger)'0' + (NSInteger)char2 - (NSInteger)'0';
        res = [NSString stringWithFormat:@"%ld%@", carry % 10, res];
        carry = carry / 10;
    }
    if(carry > 0)
    {
        res = [NSString stringWithFormat:@"%ld%@", carry, res];
    }
    return res;
}
+ (void)solution
{
    P415 *case1 = [[P415 alloc] init];
    NSLog(@"%@", [case1 addTwoString:@"199" String2:@"19"]);
    NSLog(@"%@", [case1 addTwoString:@"243" String2:@"1"]);
    NSLog(@"%@", [case1 addTwoString:@"342" String2:@"465"]);
}
@end

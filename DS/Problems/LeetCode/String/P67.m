//
//  P67.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/add-binary/
//Given two binary strings, return their sum (also a binary string).
//
//The input strings are both non-empty and contains only characters 1 or 0.
//
//Example 1:
//
//Input: a = "11", b = "1"
//Output: "100"
//Example 2:
//
//Input: a = "1010", b = "1011"
//Output: "10101"

#import "P67.h"

@implementation P67
- (NSString *)addBinary:(NSString *)a B:(NSString *)b
{
    char carry = '0';
    char v = '0';
    
    NSString *res = @"";
    NSInteger i = a.length - 1, j = b.length - 1;
    for (; i >= 0 && j >= 0; i--,j--) {
        char c1 = [a characterAtIndex:i];
        char c2 = [b characterAtIndex:j];
        
        if(c1 == '0' && c2 == '0')
        {
            v = carry == '1' ? '1' : '0';
            carry = '0';
        }
        else if(c1 == '1' && c2 == '1')
        {
            v = carry == '1' ? '1' : '0';
            carry = '1';
        }
        else
        {
            if(carry == '1')
            {
                v = '0';
                carry = '0';
            }
            else
            {
                v = '1';
            }
        }
        res = [NSString stringWithFormat:@"%c%@", v, res];
    }
    
    while (i >= 0) {
        v = [a characterAtIndex:i];
        
        if(carry == '1')
        {
            carry = v == '1' ? '1' : '0';
            v = v == '1' ? '0' : '1';
        }
        res = [NSString stringWithFormat:@"%c%@", v, res];
        i--;
    }
    
    while (j >= 0) {
        v = [b characterAtIndex:j];
        
        if(carry == '1')
        {
            carry = v == '1' ? '1' : '0';
            v = v == '1' ? '0' : '1';
        }
        res = [NSString stringWithFormat:@"%c%@", v, res];
        j--;
    }
    
    if(carry == '1')
    {
        res = [NSString stringWithFormat:@"%c%@", carry, res];
    }
    return res;
}

+ (void)solution
{
    P67 *case1 = [[P67 alloc] init];
    NSLog(@"%@", [case1 addBinary:@"11" B:@"1"]);
    NSLog(@"%@", [case1 addBinary:@"1010" B:@"1011"]);
}
@end

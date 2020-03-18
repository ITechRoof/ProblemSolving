//
//  P43.m
//  DS
//
//  Created by Kiruthika on 18/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/multiply-strings/
//Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
//
//Example 1:
//
//Input: num1 = "2", num2 = "3"
//Output: "6"
//Example 2:
//
//Input: num1 = "123", num2 = "456"
//Output: "56088"
//Note:
//
//The length of both num1 and num2 is < 110.
//Both num1 and num2 contain only digits 0-9.
//Both num1 and num2 do not contain any leading zero, except the number 0 itself.
//You must not use any built-in BigInteger library or convert the inputs to integer directly.

#import "P43.h"

@implementation P43

- (NSString *)multiplyTwoString:(NSString *)str1 String2:(NSString *)str2
{
    NSInteger str1Index = str1.length - 1;
    NSInteger str2Index = str2.length - 1;
    
    NSInteger res = 0.0;
    for (str1Index = 0; str1Index < str1.length;str1Index++) {
        char c1 = [str1 characterAtIndex:str1Index];
        
        
        NSInteger currentNo = 0;
        for (str2Index = 0; str2Index < str2.length;str2Index++) {
            
            char c2 = [str2 characterAtIndex:str2Index];
            currentNo = (currentNo * 10) + ((NSInteger)c2 - (NSInteger)'0');
        }
        res = ((res * 10) + ((NSInteger)c1 - (NSInteger)'0') * currentNo);
        
    }
    
    return [NSString stringWithFormat:@"%ld", res];
}

+ (void)solution
{
    P43 *case1 = [[P43 alloc] init];
    NSLog(@"%@", [case1 multiplyTwoString:@"2" String2:@"3"]);
    NSLog(@"%@", [case1 multiplyTwoString:@"123" String2:@"456"]);
}

@end

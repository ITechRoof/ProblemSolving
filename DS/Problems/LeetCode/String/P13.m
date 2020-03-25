//
//  P13.m
//  DS
//
//  Created by Kiruthika on 25/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/roman-to-integer/
//Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
//
//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.
//Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.
//
//Example 1:
//
//Input: "III"
//Output: 3
//Example 2:
//
//Input: "IV"
//Output: 4
//Example 3:
//
//Input: "IX"
//Output: 9
//Example 4:
//
//Input: "LVIII"
//Output: 58
//Explanation: L = 50, V= 5, III = 3.
//Example 5:
//
//Input: "MCMXCIV"
//Output: 1994
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

#import "P13.h"

@implementation P13

- (NSInteger)romanToInt:(NSString *)str
{
    NSArray *cOrder = @[@"I", @"V", @"X", @"L", @"C", @"D",@"M"];
    NSArray <NSNumber *> *value = @[@1, @5, @10, @50, @100, @500,@1000];

    NSInteger res = 0;
    NSInteger priority = NSIntegerMax;
    for (NSInteger i = str.length - 1; i >= 0; i--) {
        NSString *s = [NSString stringWithFormat:@"%c", [str characterAtIndex:i]];
        
        for (int j = 0; j < cOrder.count; j++) {
            if([cOrder[j] isEqualToString:s])
            {
                if(priority <= j)
                {
                    res = res + value[j].integerValue;
                }
                else
                {
                    res = ABS(res - value[j].integerValue);
                }
                priority = j;
            }
        }
    }
    return res;
}

+ (void)solution
{
    P13 *case1 = [[P13 alloc] init];
    NSLog(@"%ld", (long)[case1 romanToInt:@"III"]);
    NSLog(@"%ld", (long)[case1 romanToInt:@"IV"]);
    NSLog(@"%ld", (long)[case1 romanToInt:@"IX"]);
    NSLog(@"%ld", (long)[case1 romanToInt:@"LVIII"]);
    NSLog(@"%ld", (long)[case1 romanToInt:@"MCMXCIV"]);
}
@end

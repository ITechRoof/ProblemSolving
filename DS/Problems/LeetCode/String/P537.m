//
//  P537.m
//  DS
//
//  Created by Kiruthika on 30/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/complex-number-multiplication/
//Given two strings representing two complex numbers.
//
//You need to return a string representing their multiplication. Note i2 = -1 according to the definition.
//
//Example 1:
//Input: "1+1i", "1+1i"
//Output: "0+2i"
//Explanation: (1 + i) * (1 + i) = 1 + i2 + 2 * i = 2i, and you need convert it to the form of 0+2i.
//Example 2:
//Input: "1+-1i", "1+-1i"
//Output: "0+-2i"
//Explanation: (1 - i) * (1 - i) = 1 + i2 - 2 * i = -2i, and you need convert it to the form of 0+-2i.
//Note:
//
//The input strings will not have extra blank.
//The input strings will be given in the form of a+bi, where the integer a and b will both belong to the range of [-100, 100]. And the output should be also in this form.

#import "P537.h"

@implementation P537
- (NSNumber *)numberFromString:(NSString *)string
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:string];
    return myNumber;
}

- (NSString *)complexNumberMultiply:(NSString *)a B:(NSString *)b
{
    NSArray *aComp = [a componentsSeparatedByString:@"+"];
    NSArray *bComp = [b componentsSeparatedByString:@"+"];

    NSInteger aReal = [self numberFromString:aComp.firstObject].integerValue;
    NSInteger bReal = [self numberFromString:bComp.firstObject].integerValue;
    NSInteger aImg = [self numberFromString:[aComp.lastObject componentsSeparatedByString:@"i"].firstObject].integerValue;
    NSInteger bImg = [self numberFromString:[bComp.lastObject componentsSeparatedByString:@"i"].firstObject].integerValue;
    
    return [NSString stringWithFormat:@"%ld+%ldi",  (aReal * bReal - aImg * bImg), (aReal * bImg + aImg * bReal)];
}

+ (void)solution
{
    P537 *case1 = [[P537 alloc] init];
    NSLog(@"%@", [case1 complexNumberMultiply:@"1+1i" B:@"1+1i"]);
    NSLog(@"%@", [case1 complexNumberMultiply:@"1+-1i" B:@"1+-1i"]);
    NSLog(@"%@", [case1 complexNumberMultiply:@"11+21i" B:@"1+1i"]);
}
@end

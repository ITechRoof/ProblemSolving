//
//  P788.m
//  DS
//
//  Created by Kiruthika on 29/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/rotated-digits/
//X is a good number if after rotating each digit individually by 180 degrees, we get a valid number that is different from X.  Each digit must be rotated - we cannot choose to leave it alone.
//
//A number is valid if each digit remains a digit after rotation. 0, 1, and 8 rotate to themselves; 2 and 5 rotate to each other (on this case they are rotated in a different direction, in other words 2 or 5 gets mirrored); 6 and 9 rotate to each other, and the rest of the numbers do not rotate to any other number and become invalid.
//
//Now given a positive number N, how many numbers X from 1 to N are good?
//
//Example:
//Input: 10
//Output: 4
//Explanation:
//There are four good numbers in the range [1, 10] : 2, 5, 6, 9.
//Note that 1 and 10 are not good numbers, since they remain unchanged after rotating.

#import "P788.h"

@implementation P788

- (BOOL)isValid:(NSInteger)n
{
    while (n > 0) {
        NSInteger d = n % 10;
        if (d == 2 || d == 5 || d == 6 || d == 9)
        {
            return YES;
        }
        if (d == 3 || d == 4 || d == 7 )
        {
            return NO;
        }
        n = n / 10;
    }
    return NO;
}
- (NSInteger)rotatedDigits:(NSInteger)N
{
    NSInteger count = 0;
    while(N > 0)
    {
        if([self isValid:N])
        {
            count++;
        }
        N--;
    }
    return count;
}

+ (void)solution
{
    P788 *case1 = [[P788 alloc] init];
    NSLog(@"%ld", (long)[case1 rotatedDigits:10]);
}
@end

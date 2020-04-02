//
//  P816.m
//  DS
//
//  Created by Kiruthika on 02/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/ambiguous-coordinates/
//We had some 2-dimensional coordinates, like "(1, 3)" or "(2, 0.5)".  Then, we removed all commas, decimal points, and spaces, and ended up with the string S.  Return a list of strings representing all possibilities for what our original coordinates could have been.
//
//Our original representation never had extraneous zeroes, so we never started with numbers like "00", "0.0", "0.00", "1.0", "001", "00.01", or any other number that can be represented with less digits.  Also, a decimal point within a number never occurs without at least one digit occuring before it, so we never started with numbers like ".1".
//
//The final answer list can be returned in any order.  Also note that all coordinates in the final answer have exactly one space between them (occurring after the comma.)
//
//Example 1:
//Input: "(123)"
//Output: ["(1, 23)", "(12, 3)", "(1.2, 3)", "(1, 2.3)"]
//Example 2:
//Input: "(00011)"
//Output:  ["(0.001, 1)", "(0, 0.011)"]
//Explanation:
//0.0, 00, 0001 or 00.01 are not allowed.
//Example 3:
//Input: "(0123)"
//Output: ["(0, 123)", "(0, 12.3)", "(0, 1.23)", "(0.1, 23)", "(0.1, 2.3)", "(0.12, 3)"]
//Example 4:
//Input: "(100)"
//Output: [(10, 0)]
//Explanation:
//1.0 is not allowed.
//
//
//Note:
//
//4 <= S.length <= 12.
//S[0] = "(", S[S.length - 1] = ")", and the other elements in S are digits.

#import "P816.h"

@implementation P816

- (BOOL)isValid:(NSString *)a
{
    if([a containsString:@"."])
    {
        if(a.length > 1 && [a characterAtIndex:0] == '0' && [a characterAtIndex:1] == '0' )
        {
            return NO;
        }
        if([a characterAtIndex:a.length - 1] == '0')
        {
            return NO;
        }
        NSString *wholePart = [a componentsSeparatedByString:@"."].firstObject;
        if(wholePart.length > 1 && [wholePart characterAtIndex:0] == '0')
        {
            return NO;
        }
    }
    else
    {
       if(a.length > 1 && [a characterAtIndex:0] == '0')
       {
           return NO;
       }
    }
    return YES;
}
- (NSArray *)ambiguousCoordinates:(NSString *)str
{
    NSMutableArray *res = [NSMutableArray array];
    NSInteger i  = 1;
    for (NSInteger j  = i + 1; j < str.length - 1; j++) {
        NSString *a = [str substringWithRange:NSMakeRange(i, j - i)];
        NSString *b = [str substringWithRange:NSMakeRange(j, str.length - j - 1)];
        
        NSInteger m = 1, n = 1;
        NSMutableArray *aArr = [NSMutableArray array], *bArr = [NSMutableArray array];
        [aArr addObject:a];
        [bArr addObject:b];

        while (a.length > m) {
            [aArr addObject:[NSString stringWithFormat:@"%@.%@", [a substringToIndex:m], [a substringFromIndex:m]]];
            m++;
        }
        while (b.length > n) {
            [bArr addObject:[NSString stringWithFormat:@"%@.%@", [b substringToIndex:n], [b substringFromIndex:n]]];
            n++;
        }
        
        for (NSString *aS in aArr) {
            for (NSString *bS in bArr) {
                if([self isValid:aS] && [self isValid:bS])
                {
                    [res addObject:[NSString stringWithFormat:@"(%@, %@)", aS, bS]];
                }
            }
        }
    }
    return res;
}
+ (void)solution
{
    P816 *case1 = [[P816 alloc] init];
    NSLog(@"%@", [case1 ambiguousCoordinates:@"(123)"]);
    NSLog(@"%@", [case1 ambiguousCoordinates:@"(00011)"]);
    NSLog(@"%@", [case1 ambiguousCoordinates:@"(0123)"]);
    NSLog(@"%@", [case1 ambiguousCoordinates:@"(100)"]);
}

@end

//
//  P984.m
//  DS
//
//  Created by Kiruthika on 21/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/string-without-aaa-or-bbb/
//Given two integers A and B, return any string S such that:
//
//S has length A + B and contains exactly A 'a' letters, and exactly B 'b' letters;
//The substring 'aaa' does not occur in S;
//The substring 'bbb' does not occur in S.
//
//
//Example 1:
//
//Input: A = 1, B = 2
//Output: "abb"
//Explanation: "abb", "bab" and "bba" are all correct answers.
//Example 2:
//
//Input: A = 4, B = 1
//Output: "aabaa"
//
//
//Note:
//
//0 <= A <= 100
//0 <= B <= 100
//It is guaranteed such an S exists for the given A and B.

#import "P984.h"

@implementation P984
- (NSString *)stringWithout3A3B:(NSInteger)A B:(NSInteger)B
{
    NSString *res = @"";
    while (A > 0 && B > 0) {
        BOOL shouldAppendA = A > B;
        
        NSInteger length = res.length;
        if (length >= 2 && [res characterAtIndex:length - 1] == [res characterAtIndex:length - 2]) {
            if([res characterAtIndex:length - 1] == 'a')
            {
                shouldAppendA = false;
            }
            else
            {
                shouldAppendA = true;
            }
        }
        if(shouldAppendA)
        {
            A--;
        }
        else
        {
            B--;
        }
        res =  [res stringByAppendingString:shouldAppendA ? @"a" : @"b"];
        
    }
    
    while (A > 0) {
        res =  [res stringByAppendingString:@"a"];
        A--;
    }
    while (B > 0) {
        res =  [res stringByAppendingString:@"b"];
        B--;
    }
    return res;
}

+ (void)solution
{
    P984 *case1 = [[P984 alloc] init];
    NSLog(@"%@", [case1 stringWithout3A3B:1 B:2]);
    NSLog(@"%@", [case1 stringWithout3A3B:4 B:1]);
    NSLog(@"%@", [case1 stringWithout3A3B:2 B:1]);
    NSLog(@"%@", [case1 stringWithout3A3B:1 B:4]);
}

@end

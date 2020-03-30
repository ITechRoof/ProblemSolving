//
//  P38.m
//  DS
//
//  Created by Kiruthika on 29/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/count-and-say/
//The count-and-say sequence is the sequence of integers with the first five terms as following:
//
//1.     1
//2.     11
//3.     21
//4.     1211
//5.     111221
//1 is read off as "one 1" or 11.
//11 is read off as "two 1s" or 21.
//21 is read off as "one 2, then one 1" or 1211.
//
//Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence. You can do so recursively, in other words from the previous member read off the digits, counting the number of digits in groups of the same digit.
//
//Note: Each term of the sequence of integers will be represented as a string.
//
// 
//
//Example 1:
//
//Input: 1
//Output: "1"
//Explanation: This is the base case.
//Example 2:
//
//Input: 4
//Output: "1211"
//Explanation: For n = 3 the term was "21" in which we have two groups "2" and "1", "2" can be read as "12" which means frequency = 1 and value = 2, the same way "1" is read as "11", so the answer is the concatenation of "12" and "11" which is "1211".

#import "P38.h"

@implementation P38
- (NSString *)countAndSay:(NSInteger)N
{
    if(N == 0)
    {
        return @"1";
    }
    NSString *res = @"1";
    NSInteger i = 1;
    while (i < N) {
        char ch = [res characterAtIndex:0];
        NSString *current = @"";
        NSInteger count = 0;
        for (NSInteger j = 0; j < res.length; j++) {
            if(ch != [res characterAtIndex:j])
            {
                current = [NSString stringWithFormat:@"%@%ld%c", current, (long)count, ch];
                ch = [res characterAtIndex:j];
                count = 1;
            }
            else
            {
                count++;
            }
        }
        res = [NSString stringWithFormat:@"%@%ld%c", current, (long)count, ch];
        i++;
    }
    return res;
}

+ (void)solution
{
    P38 *case1 = [[P38 alloc] init];
    NSLog(@"%@", [case1 countAndSay:10]);
}
@end
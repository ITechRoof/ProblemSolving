//
//  P848.m
//  DS
//
//  Created by Kiruthika on 01/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/shifting-letters/
//We have a string S of lowercase letters, and an integer array shifts.
//
//Call the shift of a letter, the next letter in the alphabet, (wrapping around so that 'z' becomes 'a').
//
//For example, shift('a') = 'b', shift('t') = 'u', and shift('z') = 'a'.
//
//Now for each shifts[i] = x, we want to shift the first i+1 letters of S, x times.
//
//Return the final string after all such shifts to S are applied.
//
//Example 1:
//
//Input: S = "abc", shifts = [3,5,9]
//Output: "rpl"
//Explanation:
//We start with "abc".
//After shifting the first 1 letters of S by 3, we have "dbc".
//After shifting the first 2 letters of S by 5, we have "igc".
//After shifting the first 3 letters of S by 9, we have "rpl", the answer.
//Note:
//
//1 <= S.length = shifts.length <= 20000
//0 <= shifts[i] <= 10 ^ 9

#import "P848.h"

@implementation P848
- (NSString *)shiftingLetters:(NSString *)str shifts:(NSArray<NSNumber *> *)shifts
{
    NSInteger sum = 0;
    for (NSInteger i = 0; i < shifts.count; i++) {
        sum = sum + shifts[i].integerValue;
    }
    
    NSInteger currentSum = 0;
    NSString *res = @"";
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        res = [res stringByAppendingFormat:@"%c", (char)(c + ((sum - currentSum) % 26))];
        currentSum = currentSum + shifts[i].integerValue;
    }
    return res;
}

+ (void)solution
{
    P848 *case1 = [[P848 alloc] init];
    NSLog(@"%@", [case1 shiftingLetters:@"abc" shifts:@[@3,@5,@9]]);
}
@end

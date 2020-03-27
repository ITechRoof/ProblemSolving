//
//  P989.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/add-to-array-form-of-integer/
//For a non-negative integer X, the array-form of X is an array of its digits in left to right order.  For example, if X = 1231, then the array form is [1,2,3,1].
//
//Given the array-form A of a non-negative integer X, return the array-form of the integer X+K.
//
//
//
//Example 1:
//
//Input: A = [1,2,0,0], K = 34
//Output: [1,2,3,4]
//Explanation: 1200 + 34 = 1234
//Example 2:
//
//Input: A = [2,7,4], K = 181
//Output: [4,5,5]
//Explanation: 274 + 181 = 455
//Example 3:
//
//Input: A = [2,1,5], K = 806
//Output: [1,0,2,1]
//Explanation: 215 + 806 = 1021
//Example 4:
//
//Input: A = [9,9,9,9,9,9,9,9,9,9], K = 1
//Output: [1,0,0,0,0,0,0,0,0,0,0]
//Explanation: 9999999999 + 1 = 10000000000
//
//
//Note：
//
//1 <= A.length <= 10000
//0 <= A[i] <= 9
//0 <= K <= 10000
//If A.length > 1, then A[0] != 0

#import "P989.h"

@implementation P989

- (NSArray *)addToArrayForm:(NSArray<NSNumber *> *)array K:(NSInteger)K
{
    NSMutableArray<NSNumber *>  *arr = [NSMutableArray arrayWithArray:array];
    NSInteger carry = 0;
    for (NSInteger i = arr.count - 1; i >= 0; i--) {
        if(K > 0 || carry > 0)
        {
            NSInteger current = K % 10 + carry + arr[i].integerValue;
            carry = current / 10;
            current = current % 10;
            K = K / 10;
            arr[i] = [NSNumber numberWithInteger:current];
        }
    }
    
    while (carry > 0) {
        [arr insertObject:[NSNumber numberWithInteger:carry % 10] atIndex:0];
        carry = carry / 10;
    }
    return arr;
}

+ (void)solution
{
    P989 *case1 = [[P989 alloc] init];
    NSLog(@"%@", [case1 addToArrayForm:@[@1, @2, @0, @0] K:34]);
    NSLog(@"%@", [case1 addToArrayForm:@[@2, @7, @4] K:181]);
    NSLog(@"%@", [case1 addToArrayForm:@[@2, @1, @5] K:806]);
    NSLog(@"%@", [case1 addToArrayForm:@[@9,@9,@9,@9,@9,@9,@9,@9,@9,@9] K:1]);
}
@end

//
//  P629.m
//  DS
//
//  Created by Kiruthika on 10/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/k-inverse-pairs-array/
//Given two integers n and k, find how many different arrays consist of numbers from 1 to n such that there are exactly k inverse pairs.
//
//We define an inverse pair as following: For ith and jth element in the array, if i < j and a[i] > a[j] then it's an inverse pair; Otherwise, it's not.
//
//Since the answer may be very large, the answer should be modulo 109 + 7.
//
//Example 1:
//
//Input: n = 3, k = 0
//Output: 1
//Explanation:
//Only the array [1,2,3] which consists of numbers from 1 to 3 has exactly 0 inverse pair.
//
//
//Example 2:
//
//Input: n = 3, k = 1
//Output: 2
//Explanation:
//The array [1,3,2] and [2,1,3] have exactly 1 inverse pair.
//
//
//Note:
//
//The integer n is in the range [1, 1000] and k is in the range [0, 1000].

#import "P629.h"

@implementation P629
- (NSInteger)kInversePairForArrayLength:(NSInteger)N inversePair:(NSInteger)K
{
    NSMutableArray<NSMutableArray<NSNumber *> *> *array = [[NSMutableArray alloc] init];
    for (int i = 0; i <= N; i++) {
        NSMutableArray *KArr = [[NSMutableArray alloc] init];
         for (int j = 0; j <= K; j++) {
             [KArr addObject:@0];
         }
        [array addObject:KArr];
    }
    
    for (int i = 0; i <= N; i++) {
        for (int j = 0; j <= K; j++) {
            if(i == 0)
            {
                continue;
            }
            else if(j == 0)
            {
               array[i][j] = @1;
            }
            else
            {
                NSInteger val = 0;
                NSMutableArray *temp = array[i - 1];
                for (int k = 0; k <= MIN(j, i - 1) ; k++) {
            
                    val += ((NSNumber *)[temp objectAtIndex:j - k]).integerValue;
                }
                array[i][j] = [NSNumber numberWithInteger:val];
            }
        }
    }
    return array[N][K].integerValue;
}

+ (void)solution
{
    P629 *case1 = [[P629 alloc] init];
    NSLog(@"%ld", (long)[case1 kInversePairForArrayLength:5 inversePair:4]);
}
@end

//
//  P869.m
//  DS
//
//  Created by Kiruthika on 13/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//In combinatorial mathematics, a derangement is a permutation of the elements of a set, such that no element appears in its original position.
//
//There's originally an array consisting of n integers from 1 to n in ascending order, you need to find the number of derangement it can generate.
//
//Also, since the answer may be very large, you should return the output mod 109 + 7.
//
//Example 1:
//
//Input: 3
//Output: 2
//Explanation: The original array is [1,2,3]. The two derangements are [2,3,1] and [3,1,2].
//
//
//Note:
//n is in the range of [1, 106].
//ref:https://www.geeksforgeeks.org/count-derangements-permutation-such-that-no-element-appears-in-its-original-position/

#import "P869.h"

@implementation P869

- (NSInteger)findDerangement:(NSInteger)N
{
    NSMutableArray<NSNumber *> *dp = [NSMutableArray array];
    [dp addObject:@0]; // N = 0
    [dp addObject:@0]; // N = 1
    [dp addObject:@1]; // N = 2
    
    for (NSInteger i = 3; i <= N; i++) {
        NSInteger val = (i - 1) * (dp[i- 1].integerValue + dp[i - 2].integerValue);
        [dp addObject:[NSNumber numberWithInteger:val]];
    }
    return dp[N].integerValue;
}

+ (void)solution
{
    P869 *case1 = [[P869 alloc] init];
    NSLog(@"%ld", [case1 findDerangement:3]);
}
@end

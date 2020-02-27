//
//  P915.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

// Given an array A, partition it into two (contiguous) subarrays left and right so that:
//
// Every element in left is less than or equal to every element in right.
// left and right are non-empty.
// left has the smallest possible size.
// Return the length of left after such a partitioning.  It is guaranteed that such a partitioning exists.
//
//
//
// Example 1:
//
// Input: [5,0,3,8,6]
// Output: 3
// Explanation: left = [5,0,3], right = [8,6]
// Example 2:
//
// Input: [1,1,1,0,6,12]
// Output: 4
// Explanation: left = [1,1,1,0], right = [6,12]
//
//
// Note:
//
// 2 <= A.length <= 30000
// 0 <= A[i] <= 10^6
// It is guaranteed there is at least one way to partition A as described.

#import "P915.h"

@implementation P915

- (NSInteger)partitionArray:(NSArray<NSNumber *> *)array
{
    NSNumber *max =  array[0];
    NSInteger result = 0;
    for(int i = 1; i < array.count; i++)
    {
        if(max.integerValue > array[i].integerValue)
        {
            result = i;
        }
    }
    return result + 1;
}
+ (void)solution
{
    P915 *case1 = [[P915 alloc] init];
    NSLog(@"%ld", (long)[case1 partitionArray:@[@5,@0,@3,@8,@6]]);
    
    P915 *case2 = [[P915 alloc] init];
    NSLog(@"%ld", (long)[case2 partitionArray:@[@1,@1,@1,@0,@6,@12]]);
}
@end

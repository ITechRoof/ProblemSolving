//
//  P805.m
//  DS
//
//  Created by Kiruthika on 13/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/split-array-with-same-average/
//In a given integer array A, we must move every element of A to either list B or list C. (B and C initially start empty.)
//
//Return true if and only if after such a move, it is possible that the average value of B is equal to the average value of C, and B and C are both non-empty.
//
//Example :
//Input:
//[1,2,3,4,5,6,7,8]
//Output: true
//Explanation: We can split the array into [1,4,5,8] and [2,3,6,7], and both of them have the average of 4.5.
//Note:
//
//The length of A will be in the range [1, 30].
//A[i] will be in the range of [0, 10000].

#import "P805.h"

@implementation P805
- (BOOL)canSplitWithSameAverage:(NSArray<NSNumber *> *)arr
{
    if(arr.count <= 1)
    {
        return false;
    }
    
    NSInteger sum = 0;
    for (NSNumber *num in arr) {
        sum = sum + num.integerValue;
    }
    
    BOOL isPossible = NO;
    for (NSInteger i = 1; i < arr.count; i++) {
        if(sum * i % arr.count == 0)
        {
            isPossible = YES;
        }
    }
    
    if(!isPossible)
    {
        return false;
    }
    
    NSMutableArray<NSMutableSet *> *sumSet = [NSMutableArray array];
    
    [sumSet addObject:[NSMutableSet setWithArray:@[@0]]]; // For
    for (NSInteger i = 1; i <= arr.count / 2; i++) {
        [sumSet addObject:[NSMutableSet set]];
    }
    for (NSNumber *num in arr) {
        for (NSInteger i = arr.count / 2; i >= 1; i--) {
            NSMutableSet *set = [sumSet objectAtIndex:i];
            for (NSNumber *sumSetNum in sumSet[i - 1]) {
                float temp = num.integerValue + sumSetNum.integerValue;
                [set addObject:[NSNumber numberWithInteger:temp]];
            }
            sumSet[i] = set;
        }
    }
    for (NSInteger i = 1; i <= arr.count / 2; i++) {
        if ((i * sum) % arr.count == 0) {
            float checkVal = (i * sum) / arr.count;
            if([sumSet[i] containsObject:[NSNumber numberWithFloat:checkVal]])
            {
                return true;
            }
        }
        
    }
    return false;
}

+ (void)solution
{
    P805 *case1 = [[P805 alloc] init];
    [case1 canSplitWithSameAverage:@[@1,@2,@3,@4,@5,@6,@7,@8]] ? NSLog(@"Can split") :  NSLog(@"Cannot split");
    [case1 canSplitWithSameAverage:@[@2,@4,@5,@7,@10, @14]] ? NSLog(@"Can split") :  NSLog(@"Cannot split");

}
@end

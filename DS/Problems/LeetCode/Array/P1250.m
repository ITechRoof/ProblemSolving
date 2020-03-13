//
//  P1250.m
//  DS
//
//  Created by Kiruthika on 13/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/check-if-it-is-a-good-array/
//Given an array nums of positive integers. Your task is to select some subset of nums, multiply each element by an integer and add all these numbers. The array is said to be good if you can obtain a sum of 1 from the array by any possible subset and multiplicand.
//
//Return True if the array is good otherwise return False.
//
// 
//
//Example 1:
//
//Input: nums = [12,5,7,23]
//Output: true
//Explanation: Pick numbers 5 and 7.
//5*3 + 7*(-2) = 1
//Example 2:
//
//Input: nums = [29,6,10]
//Output: true
//Explanation: Pick numbers 29, 6 and 10.
//29*1 + 6*(-3) + 10*(-1) = 1
//Example 3:
//
//Input: nums = [3,6]
//Output: false

#import "P1250.h"

@implementation P1250

- (BOOL)isGoodArray:(NSArray<NSNumber *> *)arr
{
    if(arr.count <= 1)
    {
        return NO;
    }
    NSInteger gcd = arr[0].integerValue;
    for (int i = 1; i < arr.count; i++) {
        gcd = [self gcdOfA:arr[i].integerValue B:gcd];
    }
    return gcd == 1;
}
- (NSInteger)gcdOfA:(NSInteger)a B:(NSInteger)b
{
    if (b == 0)
        return a;
    return [self gcdOfA:b B:a % b];
}

+ (void)solution
{
    P1250 *case1 = [[P1250 alloc] init];
    [case1 isGoodArray:@[@12,@5,@7,@23]] ? NSLog(@"Good array") : NSLog(@"Not good array");
    [case1 isGoodArray:@[@29,@6,@10]] ? NSLog(@"Good array") : NSLog(@"Not good array");
    [case1 isGoodArray:@[@3, @6]] ? NSLog(@"Good array") : NSLog(@"Not good array");
}
@end

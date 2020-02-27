//
//  P1243.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

// Given an initial array arr, every day you produce a new array using the array of the previous day.
// On the i-th day, you do the following operations on the array of day i-1 to produce the array of day i:
// If an element is smaller than both its left neighbor and its right neighbor, then this element is incremented.
// If an element is bigger than both its left neighbor and its right neighbor, then this element is decremented.
// The first and last elements never change.
// After some days, the array does not change. Return that final array.
// Example 1:
// Input: arr = [6,2,3,4]
// Output: [6,3,3,4]
// Explanation:
// On the first day, the array is changed from [6,2,3,4] to [6,3,3,4].
// No more operations can be done to this array.
// Example 2:
// Input: arr = [1,6,3,4,3,5]
// Output: [1,4,4,4,4,5]
// Explanation:
// On the first day, the array is changed from [1,6,3,4,3,5] to [1,5,4,3,4,5].
// On the second day, the array is changed from [1,5,4,3,4,5] to [1,4,4,4,4,5].
// No more operations can be done to this array.
// Constraints:
// 1 <= arr.length <= 100
// 1 <= arr[i] <= 100

#import "P1243.h"

@implementation P1243

- (NSArray *)arrayTransformation:(NSArray <NSNumber *> *)input
{
    
    NSMutableArray  <NSNumber *> *array = [NSMutableArray arrayWithArray:input];
    BOOL isModified = YES;
    while(isModified)
    {
        NSArray  <NSNumber *> *temp = [array mutableCopy];
        isModified = NO;
        for(int i = 1; i < array.count - 1; i++)
        {
            if(temp[i - 1].integerValue > temp[i].integerValue  && temp[i + 1].integerValue  > temp[i].integerValue )
            {
                array[i] = [NSNumber numberWithInteger:array[i].integerValue + 1];
                isModified = YES;
            }
            else if(temp[i - 1].integerValue  < temp[i].integerValue  && temp[i + 1].integerValue  < temp[i].integerValue )
            {
                array[i] = [NSNumber numberWithInteger:array[i].integerValue - 1];
                isModified = YES;
            }
        }
        
    }
    return array;
}

+ (void)solution
{
    P1243 *case1 = [[P1243 alloc] init];
    NSLog(@"%@", [case1 arrayTransformation:@[@6,@2,@3,@4]]);
    
    P1243 *case2 = [[P1243 alloc] init];
    NSLog(@"%@", [case2 arrayTransformation:@[@1,@6,@3,@4,@3,@5]]);
}
@end

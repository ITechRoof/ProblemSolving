//
//  P526.m
//  DS
//
//  Created by Kiruthika on 12/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/beautiful-arrangement/
//Suppose you have N integers from 1 to N. We define a beautiful arrangement as an array that is constructed by these N numbers successfully if one of the following is true for the ith position (1 <= i <= N) in this array:
//
//The number at the ith position is divisible by i.
//i is divisible by the number at the ith position.
//
//
//Now given N, how many beautiful arrangements can you construct?
//
//Example 1:
//
//Input: 2
//Output: 2
//Explanation:
//
//The first beautiful arrangement is [1, 2]:
//
//Number at the 1st position (i=1) is 1, and 1 is divisible by i (i=1).
//
//Number at the 2nd position (i=2) is 2, and 2 is divisible by i (i=2).
//
//The second beautiful arrangement is [2, 1]:
//
//Number at the 1st position (i=1) is 2, and 2 is divisible by i (i=1).
//
//Number at the 2nd position (i=2) is 1, and i (i=2) is divisible by 1.

#import "P526.h"

@implementation P526

- (NSInteger)findBeautifulArrangement:(NSInteger)N
{
    NSMutableArray <NSNumber *> *arr = [NSMutableArray array];
    for (NSInteger i = 1; i <= N; i++) {
        [arr addObject:[NSNumber numberWithInteger:i]];
    }
    NSInteger count = 0;
    [self perm:arr atIndex:0 count:&count];
    
    return count;
}

- (void)perm:(NSArray <NSNumber *>*)arr atIndex:(NSInteger)index count:(NSInteger *)count
{
    if(index == arr.count)
    {
        *count = *count + 1;
    }
    
    for (NSInteger i = index; i < arr.count; i++) {
        
        NSMutableArray <NSNumber *> *temp = [NSMutableArray arrayWithArray:[arr mutableCopy]];
        NSNumber *tValue = temp[index];
        temp[index] = temp[i];
        temp[i] = tValue;
        
        if((temp[index].integerValue % (index + 1) == 0) || ((index + 1) % temp[index].integerValue == 0))
        {
            [self perm:temp atIndex:index + 1 count:count];
        }
    }
}


+ (void)solution
{
    P526 *case1 = [[P526 alloc] init];
    NSLog(@"%ld", (long)[case1 findBeautifulArrangement:3]);
}
@end

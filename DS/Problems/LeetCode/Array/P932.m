//
//  P932.m
//  DS
//
//  Created by Kiruthika on 10/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/beautiful-array/
//For some fixed N, an array A is beautiful if it is a permutation of the integers 1, 2, ..., N, such that:
//
//For every i < j, there is no k with i < k < j such that A[k] * 2 = A[i] + A[j].
//
//Given N, return any beautiful array A.  (It is guaranteed that one exists.)
//
// 
//
//Example 1:
//
//Input: 4
//Output: [2,1,4,3]
//Example 2:
//
//Input: 5
//Output: [3,1,2,5,4]
//

#import "P932.h"

@interface P932()

@property (nonatomic) NSMutableDictionary *memo;

@end

@implementation P932

- (NSArray *)findBeautifulArray:(NSInteger)N
{
    if(!self.memo)
    {
        self.memo = [NSMutableDictionary dictionary];
    }
    
    NSNumber *key = [NSNumber numberWithInteger:N];
    NSArray *arr = [self.memo objectForKey:key];
    if(arr)
    {
        return arr;
    }
    
    NSMutableArray *array = [NSMutableArray array];
    
    if(N == 1)
    {
        [array addObject:@1];
    }
    else
    {
        NSArray *odd = [self findBeautifulArray:(N + 1) / 2];
        for(NSNumber *num in odd)
        {
            [array addObject:[NSNumber numberWithInteger:(2 * num.integerValue - 1)]];
        }
        NSArray *even = [self findBeautifulArray:N / 2];
        for(NSNumber *num in even)
        {
            [array addObject:[NSNumber numberWithInteger:(2 * num.integerValue)]];
        }
    }
    
    [self.memo setObject:array forKey:key];
    return array;
}

+ (void)solution
{
    P932 *case1 = [[P932 alloc] init];
    NSLog(@"%@", [case1 findBeautifulArray:20]);
}
@end

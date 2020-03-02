//
//  P360.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Given a sorted array of integers nums and integer values a, b and c. Apply a function of the form f(x) = ax2 + bx + c to each element x in the array.
//The returned array must be in sorted order.
//Expected time complexity: O(n)
//Example:
//nums = [-4, -2, 2, 4], a = 1, b = 3, c = 5,
//
//Result: [3, 9, 15, 33]
//
//nums = [-4, -2, 2, 4], a = -1, b = 3, c = 5
//Result: [-23, -5, 1, 7]

#import "P360.h"

@implementation P360

- (NSArray *)insert:(NSInteger)num arr:(NSArray<NSNumber *> *)sortedArr
{
    NSMutableArray<NSNumber *> *result = [NSMutableArray arrayWithArray:sortedArr];
    
    NSInteger low = 0;
    NSInteger high = result.count - 1;
    while(low <= high)
    {
        NSInteger mid = (low + high) / 2;
        if(result[mid].integerValue > num)
        {
            high = mid - 1;
        }
        else if(result[mid].integerValue < num)
        {
            low = mid + 1;
        }
        else
        {
            [result insertObject:[NSNumber numberWithInteger:num] atIndex:mid];
            return result;
        }
    }
    
    [result insertObject:[NSNumber numberWithInteger:num] atIndex:low];
    return result;
}
- (NSArray *)sortTransformedArray:(NSArray <NSNumber *> *)input a:(NSInteger)a b:(NSInteger)b c:(NSInteger)c
{
    NSMutableArray *result = [NSMutableArray array];
    
    for(NSNumber *num in input)
    {
        NSInteger val = num.integerValue;
        NSInteger resultVal = a * val * val + b * val + c;
        result =  [NSMutableArray arrayWithArray:[self insert:resultVal arr:result]];
    }
    return result;
}

+ (void) solution
{
    P360 *case1 = [[P360 alloc] init];
    NSLog(@"%@", [case1 sortTransformedArray:@[@-4, @-2, @2, @4] a:1 b:3 c:5]);
    
    P360 *case2 = [[P360 alloc] init];
    NSLog(@"%@", [case2 sortTransformedArray:@[@-4, @-2, @2, @4] a:-1 b:3 c:5]);
}
@end

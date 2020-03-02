//
//  P561.m
//  DS
//
//  Created by Kiruthika on 28/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P561.h"

@implementation P561
- (NSInteger)findMaxSumPair:(NSArray<NSNumber*> *)input
{
    NSMutableArray<NSNumber*> *nums = [NSMutableArray arrayWithArray:input];
    for(int i = 0; i < nums.count; i++)
    {
        for(int j = i; j < nums.count; j++)
        {
            if(nums[i].integerValue > nums[j].integerValue)
            {
                NSNumber *temp = nums[i];
                nums[i] = nums[j];
                nums[j] = temp;
            }
        }
    }
    NSInteger maxSum = 0;
    for(int i = 0; i < nums.count; i = i + 2)
    {
        maxSum = maxSum + nums[i].integerValue;
    }
    return maxSum;
}

+ (void)solution
{
    P561 *case1 = [[P561 alloc] init];
    NSLog(@"%ld", (long)[case1 findMaxSumPair:@[@3,@4,@5,@1,@2,@6]]);
    
    P561 *case2 = [[P561 alloc] init];
    NSLog(@"%ld", (long)[case2 findMaxSumPair:@[@1,@4,@3,@2]]);
}

@end

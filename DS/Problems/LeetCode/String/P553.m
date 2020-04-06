//
//  P553.m
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/optimal-division/
//Given a list of positive integers, the adjacent integers will perform the float division. For example, [2,3,4] -> 2 / 3 / 4.
//
//However, you can add any number of parenthesis at any position to change the priority of operations. You should find out how to add parenthesis to get the maximum result, and return the corresponding expression in string format. Your expression should NOT contain redundant parenthesis.
//
//Example:
//Input: [1000,100,10,2]
//Output: "1000/(100/10/2)"
//Explanation:
//1000/(100/10/2) = 1000/((100/10)/2) = 200
//However, the bold parenthesis in "1000/((100/10)/2)" are redundant,
//since they don't influence the operation priority. So you should return "1000/(100/10/2)".
//
//Other cases:
//1000/(100/10)/2 = 50
//1000/(100/(10/2)) = 50
//1000/100/10/2 = 0.5
//1000/100/(10/2) = 2
//Note:
//
//The length of the input array is [1, 10].
//Elements in the given array will be in range [2, 1000].
//There is only one optimal division for each test case.

#import "P553.h"

@implementation P553
- (NSString *)optimalDivision:(NSArray<NSNumber *> *)nums
{
    if(nums.count == 1)
    {
        return nums[0].stringValue;
    }
    else if(nums.count == 2)
    {
        return [NSString stringWithFormat:@"%@/%@", nums.firstObject.stringValue, nums.lastObject.stringValue];
    }
    
    NSString *res = [nums.firstObject.stringValue stringByAppendingString:@"/("];
    for (NSInteger i = 1; i < nums.count; i++) {
        res = [res stringByAppendingString:nums[i].stringValue];
        if(i != nums.count - 1)
        {
            res = [res stringByAppendingString:@"/"];
        }
    }
    res = [res stringByAppendingString:@")"];
    return res;
}

+ (void)solution
{
    P553 *case1 = [[P553 alloc] init];
    NSLog(@"%@", [case1 optimalDivision:@[@1000,@100,@10,@2]]);
}

@end

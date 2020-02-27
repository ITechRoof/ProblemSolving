//
//  P1095.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//1095. Find in Mountain Array
//You may recall that an array A is a mountain array if and only if:
//
//A.length >= 3
//There exists some i with 0 < i < A.length - 1 such that:
//A[0] < A[1] < ... A[i-1] < A[i]
//A[i] > A[i+1] > ... > A[A.length - 1]
//Given a mountain array mountainArr, return the minimum index such that mountainArr.get(index) == target.  If such an index doesn't exist, return -1.
//
//You can't access the mountain array directly.  You may only access the array using a MountainArray interface:
//
//MountainArray.get(k) returns the element of the array at index k (0-indexed).
//MountainArray.length() returns the length of the array.
//Submissions making more than 100 calls to MountainArray.get will be judged Wrong Answer.  Also, any solutions that attempt to circumvent the judge will result in disqualification.
//
//
//
//Example 1:
//
//Input: array = [1,2,3,4,5,3,1], target = 3
//Output: 2
//Explanation: 3 exists in the array, at index=2 and index=5. Return the minimum index, which is 2.
//Example 2:
//
//Input: array = [0,1,2,4,2,1], target = 3
//Output: -1
//Explanation: 3 does not exist in the array, so we return -1.

#import "P1095.h"

@implementation P1095

- (NSInteger)findIndex:(NSArray<NSNumber *> *)arr target:(NSInteger)target low:(int)low high:(int)high
{
    if(low >= high)
    {
        if(low == high && arr[low].integerValue == target)
        {
            return low;
        }
         return NSIntegerMax;
    }
    int mid = (low + high) / 2;
    if(arr[mid].integerValue == target)
    {
        if(arr[mid].integerValue < arr[mid + 1].integerValue)
        {
            return mid;
        }
        else
        {
            return MIN(mid, [self findIndex:arr target:target low:mid + 1 high:high]);
        }
    }
    else
    {
        return MIN([self findIndex:arr target:target low:low high:mid - 1], [self findIndex:arr target:target low:mid + 1 high:high]);
    }
}

+ (void)solution
{
    P1095 *case1 = [[P1095 alloc] init];
    NSLog(@"%ld", (long)[case1 findIndex:@[@1,@2,@3,@4,@5,@3,@1] target:3 low: 0 high:6]);
    
    P1095 *case2 = [[P1095 alloc] init];
    NSLog(@"%ld", (long)[case2 findIndex:@[@0,@1,@2,@4,@2,@1] target:3 low: 0 high:5]);
}

@end

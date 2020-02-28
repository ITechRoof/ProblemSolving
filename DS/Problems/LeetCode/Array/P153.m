//
//  P153.m
//  DS
//
//  Created by Kiruthika on 28/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
//
//Find the minimum element.
//
//You may assume no duplicate exists in the array.
//
//Example 1:
//
//Input: [3,4,5,1,2]
//Output: 1
//Example 2:
//
//Input: [4,5,6,7,0,1,2]
//Output: 0

//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
//
//Find the minimum element.
//
//The array may contain duplicates.
//
//Example 1:
//
//Input: [1,3,5]
//Output: 1
//Example 2:
//
//Input: [2,2,2,0,1]
//Output: 0
//Note:
//
//This is a follow up problem to Find Minimum in Rotated Sorted Array.
//Would allow duplicates affect the run-time complexity? How and why?

#import "P153.h"

@implementation P153

- (NSNumber *)findMin:(NSArray<NSNumber*> *)input
{
    if(input.count == 0)
    {
        return NULL;
    }
    NSInteger low = 0, high = input.count - 1;
    NSInteger mid = (low + high)/2;
    while(low < high)
    {
        mid = (low + high)/2;
        
        //To handle duplicate
        if(input[low].integerValue == input[mid].integerValue && input[high].integerValue == input[mid].integerValue) // min is in left of mid , right of mid is sorted
        {
            low++;
            high--;
            continue;
        }
        
        if(input[low].integerValue > input[mid].integerValue) // min is in left of mid , right of mid is sorted
        {
            if(input[mid].integerValue < input[mid-1].integerValue)
            {
                return input[mid];
            }
            high = mid;
        }
        else if (input[high].integerValue < input[mid].integerValue) // pivot is in right of mid
        {
            if(input[mid].integerValue > input[mid+1].integerValue)
            {
                return input[mid + 1];
            }
            low = mid;
        }
        else //sorted
        {
            break;
        }
    }
    return input[low];
}

+ (void)solution
{
    P153 *case1 = [[P153 alloc] init];
    NSLog(@"%@", [case1 findMin:@[@3,@4,@5,@1,@2]]);
    
    P153 *case2 = [[P153 alloc] init];
    NSLog(@"%@", [case2 findMin:@[@4,@5,@6,@7,@0,@1,@2]]);
    
    P153 *case3 = [[P153 alloc] init];
    NSLog(@"%@", [case3 findMin:@[@3,@1,@2]]);
    
    P153 *case4 = [[P153 alloc] init];
    NSLog(@"%@", [case4 findMin:@[@2,@2,@2,@0,@1]]);
    
    P153 *case5 = [[P153 alloc] init];
    NSLog(@"%@", [case5 findMin:@[@3,@3,@1,@3]]);
    
    P153 *case6 = [[P153 alloc] init];
    NSLog(@"%@", [case6 findMin:@[@1]]);
    
}

@end

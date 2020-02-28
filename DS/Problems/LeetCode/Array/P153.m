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
    while(low <= high)
    {
        mid = (low + high)/2;
        
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
}

@end

//
//  P1213.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Given three integer arrays arr1, arr2 and arr3 sorted in strictly increasing order, return a sorted array of only the integers that appeared in all three arrays.
//
//
//
//Example 1:
//
//Input: arr1 = [1,2,3,4,5], arr2 = [1,2,5,7,9], arr3 = [1,3,4,5,8]
//Output: [1,5]
//Explanation: Only 1 and 5 appeared in the three arrays.

#import "P1213.h"

@implementation P1213

- (NSArray *)intersectionOfArray1:(NSArray <NSNumber *> *)array1 array2:(NSArray <NSNumber *> *)array2 array3:(NSArray <NSNumber *> *)array3
{
    NSMutableArray *result = [NSMutableArray array];
    
    int i = 0, j = 0, k = 0;
    while(i < array1.count && j < array2.count && k <array3.count)
    {
        if(array1[i].integerValue == array2[j].integerValue && array2[j].integerValue == array3[k].integerValue)
        {
            [result addObject:array1[i]];
            i++;
            j++;
            k++;
        }
        else
        {
            if(array1[i].integerValue < array2[j].integerValue || array1[i].integerValue < array3[k].integerValue)
            {
                i++;
            }
            else if (array2[j].integerValue < array1[i].integerValue || array2[j].integerValue < array3[k].integerValue)
            {
                j++;
            }
            else
            {
                k++;
            }
        }
    }
    return result;
}

+ (void)solution
{
    P1213 *case1 = [[P1213 alloc] init];
    NSLog(@"%@", [case1 intersectionOfArray1:@[@1,@2,@3,@4,@5] array2:@[@1,@2,@5,@7,@9] array3:@[@1,@3,@4,@5,@8]]);
}
@end

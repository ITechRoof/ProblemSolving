//
//  P349.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P349.h"

@implementation P349
- (NSArray *)intersection:(NSArray <NSNumber *>*)input1 input2:(NSArray<NSNumber *> *)input2
{
    NSMutableArray<NSNumber *> *sortedArr;
    NSMutableArray<NSNumber *> *otherArr;
    NSMutableArray<NSNumber *> *result = [NSMutableArray array];
    if(input1.count > input2.count)
    {
        sortedArr = [NSMutableArray arrayWithArray:input2];
        otherArr = [NSMutableArray arrayWithArray:input1];
    }
    else
    {
        sortedArr = [NSMutableArray arrayWithArray:input1];
        otherArr = [NSMutableArray arrayWithArray:input2];
    }
    for(int i = 0; i < sortedArr.count;i++)
    {
        for(int j = i + 1; j < sortedArr.count; j++)
        {
            if(sortedArr[j].integerValue  > sortedArr[j].integerValue ) // Swap
            {
                NSNumber *temp = sortedArr[i];
                sortedArr[i] = sortedArr[j];
                sortedArr[j] = temp;
                break;
            }
        }
    }
    
    for(int i = 0; i < otherArr.count;i++)
    {
        //Binary search
        NSNumber *searchKey = otherArr[i];
        
        NSInteger low = 0, mid, high = sortedArr.count - 1;
        while(low <= high)
        {
            mid = (low + high) / 2;
            if(sortedArr[mid].integerValue > searchKey.integerValue )
            {
                high =  mid - 1;
            }
            else if(sortedArr[mid].integerValue < searchKey.integerValue )
            {
                low =  mid + 1;
            }
            else
            {
                if(![result containsObject:searchKey])
                {
                    [result addObject:searchKey];
                }
                break;
            }
        }
    }
    return result;
}

+ (void)solution
{
    P349 *case1 = [[P349 alloc] init];
    NSLog(@"%@", [case1 intersection:@[@4, @9, @5] input2:@[@9, @4, @9, @8, @4]]);
    
    P349 *case2 = [[P349 alloc] init];
    NSLog(@"%@", [case2 intersection:@[@1,@2,@2,@1] input2:@[@2,@2]]);
}
@end

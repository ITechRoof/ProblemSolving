//
//  P81.m
//  DS
//
//  Created by Kiruthika on 19/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P81.h"

@implementation P81

- (BOOL)searchInRotatedArray:(NSArray<NSNumber*> *)input key:(NSInteger)key
{
    if(input.count == 0)
    {
        return NO;
    }
    NSInteger low = 0, high = input.count - 1;
    NSInteger mid = (low + high)/2;
    while(low + 1 < high)
    {
        mid = (low + high)/2;
        if(key == input[mid].integerValue)
        {
            return YES;
        }
        if(input[low].integerValue < input[mid].integerValue) // pivot is in right of mid , left of mid is sorted
        {
            if(key <= input[mid].integerValue && key >= input[low].integerValue) // value lies left of mid
            {
                high = mid;
            }
            else
            {
                low = mid;
            }
        }
        else if (input[low].integerValue > input[mid].integerValue) // pivot is in left of mid
        {
            if(key >= input[mid].integerValue && key <= input[high].integerValue) // right of mid is sorted
            {
                low = mid;
            }
            else
            {
                high = mid;
            }
        }
        else
        {
            low++;
        }
        
    }
    if((low >= 0 && key == input[low].integerValue) || (high < input.count && key == input[high].integerValue))
    {
        return YES;
    }
    return NO;
}

+ (void)solution
{
    P81 *case1 = [[P81 alloc] init];
    [case1 searchInRotatedArray:@[@1, @3, @5] key:1] ? NSLog(@"Found") : NSLog(@"Not Found");
}

@end

//
//  P896.m
//  DS
//
//  Created by Kiruthika on 18/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P896.h"

@implementation P896

- (BOOL)isMonotonic:(NSArray *)arr
{
    BOOL isIncreasing = NO;
    
    if(arr.count <= 2)
    {
        return YES;
    }
    
    NSNumber *first = [arr objectAtIndex:0];
    NSNumber *second = [arr objectAtIndex:1];
    
    if(first.integerValue < second.integerValue)
    {
        isIncreasing = YES;
    }
    
    for(int i = 1; i < arr.count; i++)
    {
        first = [arr objectAtIndex:i-1];
        second = [arr objectAtIndex:i];
        
        if(isIncreasing)
        {
            if(first.integerValue > second.integerValue)
            {
                return NO;
            }
        }
        else
        {
            if(first.integerValue < second.integerValue)
            {
                return NO;
            }
        }
    }
    return YES;
}

+ (void)solution
{
    P896 *case1 = [[P896 alloc] init];
    [case1 isMonotonic:@[@1, @2, @3, @4]] ? NSLog(@"Monotonic") : NSLog(@"Not Monotonic");
}

@end

//
//  P941.m
//  DS
//
//  Created by Kiruthika on 24/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P941.h"

@implementation P941

- (BOOL)isMountain:(NSArray *)arr
{
    if(arr.count <= 2)
    {
        return NO;
    }
    
    NSNumber *first,*second;
    
    BOOL isIncreasing = YES;
    
    for(int i = 1; i < arr.count; i++)
    {
        first = [arr objectAtIndex:i-1];
        second = [arr objectAtIndex:i];
        
        if(isIncreasing)
        {
            if(first.integerValue == second.integerValue)
            {
                return NO;
            }
            if(first.integerValue > second.integerValue)
            {
                isIncreasing = NO;
            }
        }
        else
        {
            if(first.integerValue <= second.integerValue)
            {
                return NO;
            }
        }
    }
    return YES;
}

+ (void)solution
{
    P941 *case1 = [[P941 alloc] init];
    [case1 isMountain:@[@3, @4, @5, @2]] ? NSLog(@"Mountain") : NSLog(@"Not Mountain");
}

@end

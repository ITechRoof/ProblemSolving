//
//  P665Arr.m
//  DS
//
//  Created by Kiruthika on 26/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P665Arr.h"

@implementation P665Arr

- (BOOL)canMadeIncreasing:(NSArray *)arr
{
    if(arr.count < 2)
    {
        return YES;
    }
    
    NSNumber *first,*second;
    
    BOOL isModified = NO;
    
    for(int i = 1; i < arr.count; i++)
    {
        first = [arr objectAtIndex:i-1];
        second = [arr objectAtIndex:i];
        
        
        if(first.integerValue >= second.integerValue)
        {
            if(isModified)
            {
                return NO;
            }
            else
            {
                isModified = YES;
            }
        }
    }
    return YES;
}

+ (void)solution
{
    P665Arr *case1 = [[P665Arr alloc] init];
    [case1 canMadeIncreasing:@[@4, @2, @3]] ? NSLog(@"Can be made increasing") : NSLog(@"Cannot be made increasing");
}
@end

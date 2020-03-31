//
//  P556.m
//  DS
//
//  Created by Kiruthika on 31/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/next-greater-element-iii/
//Given a positive 32-bit integer n, you need to find the smallest 32-bit integer which has exactly the same digits existing in the integer n and is greater in value than n. If no such positive 32-bit integer exists, you need to return -1.
//
//Example 1:
//
//Input: 12
//Output: 21
//
//
//Example 2:
//
//Input: 21
//Output: -1

#import "P556.h"

@implementation P556

- (NSInteger)nextGreaterElement:(NSInteger)value
{
    NSString *s = [NSNumber numberWithInteger:value].stringValue;
    char prev = [s characterAtIndex:s.length - 1];
    for (NSInteger i = s.length - 2; i >= 0; i--) {
        char c = [s characterAtIndex:i];
        if(c - '0' < prev - '0')
        {
            char min;
            NSInteger minIndex;
            
            for (NSInteger j = i + 1; j < s.length; j++) {
                if((!min || min - '0' > [s characterAtIndex:j] - '0') && c - '0' < [s characterAtIndex:j] - '0')
                {
                    min = prev;
                    minIndex = j;
                }
            }
            //swap
            if(min && minIndex)
            {
                s = [s stringByReplacingCharactersInRange:NSMakeRange(minIndex, 1) withString:[NSString stringWithFormat:@"%c", c]];
                s = [s stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", min]];
            }
        }
        prev = c;
    }
    
    if(s.integerValue == value)
    {
        return -1;
    }
    return s.integerValue;
}


+ (void)solution
{
    P556 *case1 = [[P556 alloc] init];
    NSLog(@"%ld", (long)[case1 nextGreaterElement:12]);
    NSLog(@"%ld", (long)[case1 nextGreaterElement:21]);
    NSLog(@"%ld", (long)[case1 nextGreaterElement:121]);
}
@end

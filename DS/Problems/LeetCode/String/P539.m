//
//  P539.m
//  DS
//
//  Created by Kiruthika on 03/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/minimum-time-difference/
//Given a list of 24-hour clock time points in "Hour:Minutes" format, find the minimum minutes difference between any two time points in the list.
//Example 1:
//Input: ["23:59","00:00"]
//Output: 1
//Note:
//The number of time points in the given list is at least 2 and won't exceed 20000.
//The input time is legal and ranges from 00:00 to 23:59.

#import "P539.h"

@implementation P539
- (NSInteger)findMinDifference:(NSArray *)arr
{
    NSMutableArray<NSNumber *> *array = [NSMutableArray array];
    for (NSString *time in arr) {
        NSArray *comp = [time componentsSeparatedByString:@":"];
        NSInteger min = ((NSString *)comp.firstObject).integerValue * 60 + ((NSString *)comp.lastObject).integerValue;
        NSInteger i = 0;
        for (; i < array.count; i++) {
            if(array[i].integerValue > min)
            {
                break;
            }
        }
        [array insertObject:[NSNumber numberWithInteger:min] atIndex:i];
    }
    
    NSInteger min = NSIntegerMax;
    for (NSInteger i = 1; i < array.count; i++) {
        min = MIN(min, array[i].integerValue - array[i - 1].integerValue);
    }
    min = MIN(min, (array[0].integerValue + 24 * 60) - array[array.count - 1].integerValue);
    return min;
}

+ (void)solution
{
    P539 *case1 = [[P539 alloc] init];
    NSLog(@"%ld", (long)[case1 findMinDifference:@[@"23:59",@"00:00"]]);
}
@end

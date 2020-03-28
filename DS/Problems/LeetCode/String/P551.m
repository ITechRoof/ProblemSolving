//
//  P551.m
//  DS
//
//  Created by Kiruthika on 28/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/student-attendance-record-i/
//You are given a string representing an attendance record for a student. The record only contains the following three characters:
//'A' : Absent.
//'L' : Late.
//'P' : Present.
//A student could be rewarded if his attendance record doesn't contain more than one 'A' (absent) or more than two continuous 'L' (late).
//
//You need to return whether the student could be rewarded according to his attendance record.
//
//Example 1:
//Input: "PPALLP"
//Output: True
//Example 2:
//Input: "PPALLL"
//Output: False

#import "P551.h"

@implementation P551
- (BOOL)checkRecord:(NSString *)str
{
    BOOL isAbsentBefore = NO;
    NSInteger lateCount = 0;
    for (NSInteger i = 0; i < str.length; i++)
    {
        char c = [str characterAtIndex:i];
        if(c == 'A')
           {
            if(isAbsentBefore)
            {
                return NO;
            }
            else
            {
                isAbsentBefore = YES;
            }
        }
        else if(c == 'L')
        {
            lateCount++;
            if(lateCount > 2)
            {
                return NO;
            }
        }
        else
        {
            lateCount = 0;
        }
    }
    return YES;
}
+ (void)solution
{
    P551 *case1 = [[P551 alloc] init];
    [case1 checkRecord:@"PPALLP"] ? NSLog(@"Rewarded") : NSLog(@"Not Rewarded");
    [case1 checkRecord:@"PPALLL"] ? NSLog(@"Rewarded") : NSLog(@"Not Rewarded");
}
@end

//
//  P1247.m
//  DS
//
//  Created by Kiruthika on 24/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/minimum-swaps-to-make-strings-equal/
//You are given two strings s1 and s2 of equal length consisting of letters "x" and "y" only. Your task is to make these two strings equal to each other. You can swap any two characters that belong to different strings, which means: swap s1[i] and s2[j].
//
//Return the minimum number of swaps required to make s1 and s2 equal, or return -1 if it is impossible to do so.
//
//
//
//Example 1:
//
//Input: s1 = "xx", s2 = "yy"
//Output: 1
//Explanation:
//Swap s1[0] and s2[1], s1 = "yx", s2 = "yx".
//Example 2:
//
//Input: s1 = "xy", s2 = "yx"
//Output: 2
//Explanation:
//Swap s1[0] and s2[0], s1 = "yy", s2 = "xx".
//Swap s1[0] and s2[1], s1 = "xy", s2 = "xy".
//Note that you can't swap s1[0] and s1[1] to make s1 equal to "yx", cause we can only swap chars in different strings.
//Example 3:
//
//Input: s1 = "xx", s2 = "xy"
//Output: -1
//Example 4:
//
//Input: s1 = "xxyyxyxyxx", s2 = "xyyxyxxxyx"
//Output: 4
//
//
//Constraints:
//
//1 <= s1.length, s2.length <= 1000
//s1, s2 only contain 'x' or 'y'.

#import "P1247.h"

@implementation P1247

- (NSInteger)minimumSwap:(NSString *)str1 string:(NSString *)str2
{
    NSInteger xCount = 0, yCount = 0;
    
    for (NSInteger i = 0; i < str1.length; i++) {
        if ([str1 characterAtIndex:i] == 'x' && [str2 characterAtIndex:i] == 'y') {
            xCount++;
        }
        else if ([str1 characterAtIndex:i] == 'y' && [str2 characterAtIndex:i] == 'x') {
            yCount++;
        }
    }
    
    if(xCount % 2 == 0 && yCount % 2 == 0)
    {
        return (xCount + yCount) / 2;
    }
    else if((xCount + yCount) % 2 == 0)
    {
          return (xCount / 2) + (yCount / 2) + 2;
    }
    else
    {
        return -1;
    }
}

+ (void)solution
{
    P1247 *case1 = [[P1247 alloc] init];
    NSLog(@"%ld", (long)[case1 minimumSwap:@"xx" string:@"yy"]);
    NSLog(@"%ld", (long)[case1 minimumSwap:@"xy" string:@"yx"]);
    NSLog(@"%ld", (long)[case1 minimumSwap:@"xx" string:@"xy"]);
    NSLog(@"%ld", (long)[case1 minimumSwap:@"xxyyxyxyxx" string:@"xyyxyxxxyx"]);
    NSLog(@"%ld", (long)[case1 minimumSwap:@"" string:@""]);
}
@end

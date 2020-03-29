//
//  P696.m
//  DS
//
//  Created by Kiruthika on 29/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/count-binary-substrings/
//Give a string s, count the number of non-empty (contiguous) substrings that have the same number of 0's and 1's, and all the 0's and all the 1's in these substrings are grouped consecutively.
//
//Substrings that occur multiple times are counted the number of times they occur.
//
//Example 1:
//Input: "00110011"
//Output: 6
//Explanation: There are 6 substrings that have equal number of consecutive 1's and 0's: "0011", "01", "1100", "10", "0011", and "01".
//
//Notice that some of these substrings repeat and are counted the number of times they occur.
//
//Also, "00110011" is not a valid substring because all the 0's (and 1's) are not grouped together.
//Example 2:
//Input: "10101"
//Output: 4
//Explanation: There are 4 substrings: "10", "01", "10", "01" that have equal number of consecutive 1's and 0's.
//Note:
//
//s.length will be between 1 and 50,000.
//s will only consist of "0" or "1" characters.

#import "P696.h"

@implementation P696
- (NSInteger)countBinarySubstrings:(NSString *)str
{
    NSInteger group[str.length];
    NSInteger pair = 0, count = 1;
    for (NSInteger i = 1; i < str.length; i++) {
        if([str characterAtIndex:i - 1] != [str characterAtIndex:i])
        {
            group[pair] = count;
            pair++;
            count = 1;
        }
        else
        {
            count++;
        }
    }
    
    group[pair] = count;
    
    NSInteger res = 0;
     for (NSInteger i = 1; i <= pair; i++) {
         res = res + MIN(group[i - 1], group[i]);
     }
    return res;
}

+ (void)solution
{
    P696 *case1 = [[P696 alloc] init];
    NSLog(@"%ld", (long)[case1 countBinarySubstrings:@"00110011"]);
    NSLog(@"%ld", (long)[case1 countBinarySubstrings:@"10101"]);
}
@end

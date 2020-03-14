//
//  P1221.m
//  DS
//
//  Created by Kiruthika on 14/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//


//https://leetcode.com/problems/split-a-string-in-balanced-strings/
//Balanced strings are those who have equal quantity of 'L' and 'R' characters.
//
//Given a balanced string s split it in the maximum amount of balanced strings.
//
//Return the maximum amount of splitted balanced strings.
//
//
//
//Example 1:
//
//Input: s = "RLRRLLRLRL"
//Output: 4
//Explanation: s can be split into "RL", "RRLL", "RL", "RL", each substring contains same number of 'L' and 'R'.
//Example 2:
//
//Input: s = "RLLLLRRRLR"
//Output: 3
//Explanation: s can be split into "RL", "LLLRRR", "LR", each substring contains same number of 'L' and 'R'.
//Example 3:
//
//Input: s = "LLLLRRRR"
//Output: 1
//Explanation: s can be split into "LLLLRRRR".
//Example 4:
//
//Input: s = "RLRRRLLRLL"
//Output: 2
//Explanation: s can be split into "RL", "RRRLLRLL", since each substring contains an equal number of 'L' and 'R'
//
//
//Constraints:
//
//1 <= s.length <= 1000
//s[i] = 'L' or 'R'

#import "P1221.h"

@implementation P1221

- (NSInteger)findBalancedStringCount:(NSString *)str
{
  NSInteger count = 0;
  NSInteger left = 0, right = 0;

  for (size_t i = 0; i < str.length; i++) {
    if([str characterAtIndex:i] == 'L')
    {
      left++;
    }
    else
    {
      right++;
    }
    if(left == right)
    {
      count++;
    }
  }
  return count;
}

+ (void)solution
{
    P1221 *case1 = [[P1221 alloc] init];
    
    NSLog(@"%ld", (long)[case1 findBalancedStringCount:@"RLRRLLRLRL"]);
    NSLog(@"%ld", (long)[case1 findBalancedStringCount:@"RLLLLRRRLR"]);
    NSLog(@"%ld", (long)[case1 findBalancedStringCount:@"LLLLRRRR"]);
    NSLog(@"%ld", (long)[case1 findBalancedStringCount:@"RLRRRLLRLL"]);
}
@end

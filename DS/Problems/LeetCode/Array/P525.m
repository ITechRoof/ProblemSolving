//
//  P525.m
//  DS
//
//  Created by Kiruthika on 28/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.
//
//Example 1:
//Input: [0,1]
//Output: 2
//Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
//Example 2:
//Input: [0,1,0]
//Output: 2
//Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
//Note: The length of the given binary array will not exceed 50,000.

#import "P525.h"

@implementation P525
- (NSInteger)maxLength:(NSArray<NSNumber *> *)nums
{
  NSInteger count = 0, maxLength = 0;
  NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for(int i = 0; i < nums.count; i++)
  {
    count = count + (nums[i].integerValue == 0 ? -1 : 1);
    if(count == 0)
    {
      maxLength = i + 1;
    }
    else
    {
      NSNumber *index = [dict objectForKey:[NSNumber numberWithInteger:count]];
      if(index)
      {
        maxLength = MAX(maxLength, i - index.integerValue);
      }
      else
      {
        [dict setObject:[NSNumber numberWithInt:i] forKey:[NSNumber numberWithInteger:count]];
      }
    }
  }
    return maxLength;
}

+ (void)solution
{
    P525 *case1 = [[P525 alloc] init];
    NSLog(@"%ld", (long)[case1 maxLength:@[@0,@1,@0]]);

    P525 *case2 = [[P525 alloc] init];
    NSLog(@"%ld", (long)[case2 maxLength:@[@0,@0,@1,@0,@0,@0,@1,@1]]);
    
}
@end

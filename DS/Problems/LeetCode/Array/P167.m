//
//  P167.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P167.h"

@implementation P167

- (NSArray *)indexOfTwoSum:(NSArray<NSNumber *> *)input target:(NSInteger)target
{
  for(int i = 0, j = input.count - 1; i < j;)
  {
    if(input[i].integerValue + input[j].integerValue > target)
    {
      j--;
    }
    else if(input[i].integerValue + input[j].integerValue < target)
    {
      i++;
    }
    else
    {
      return @[[NSNumber numberWithInt:i + 1], [NSNumber numberWithInt:j + 1]]; //Non-zero based
    }
  }
  return @[];
}

+ (void)solution
{
  P167 *case1 = [[P167 alloc] init];
  NSLog(@"%@", [case1 indexOfTwoSum:@[@2, @7, @11, @15] target:9]);
}
@end

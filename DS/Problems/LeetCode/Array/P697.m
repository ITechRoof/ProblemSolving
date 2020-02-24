//
//  P697.m
//  DS
//
//  Created by Kiruthika on 24/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P697.h"

@implementation P697
- (NSInteger)degree:(NSArray *)input
{
    NSMutableDictionary *count = [[NSMutableDictionary alloc] init];

  for(int i = 0; i < input.count; i++)
    {
      NSNumber *key = input[i];
      NSInteger val = ((NSNumber *)[count objectForKey:key]).integerValue ?: 0;
      val++;
      [count setObject:[NSNumber numberWithInteger:val] forKey:key];
    }
    NSMutableArray *max = [NSMutableArray array];
    NSInteger degreeMax = 0;
    for(NSNumber *key in count.allKeys)
      {
          NSInteger degree = ((NSNumber *)[count objectForKey:key]).integerValue;
          if(degree > degreeMax)
          {
            max = [NSMutableArray arrayWithArray:@[key]];
              degreeMax = degree;
          }
          else if(degree == degreeMax)
          {
            [max addObject:key];
          }
      }


        NSInteger result = NSIntegerMax;
        for(NSNumber *key in max)
        {
            NSInteger left = NSIntegerMin, right = NSIntegerMax;
            for(int i = 0, j = input.count -1; i <= j; )
            {
                if(left != NSIntegerMin && right != NSIntegerMax)
                {
                    break;
                }
                if(left == NSIntegerMin)
                {
                    if(input[i] == key)
                    {
                        left = i;
                    }
                    else
                    {
                        i++;
                    }
                }
                if(right == NSIntegerMax)
                {
                    if(input[j] == key)
                    {
                        right = j;
                    }
                    else
                    {
                        j--;
                    }
                }
            }
            result = MIN(right - left + 1, result);
        }
    return result;
}

+ (void)solution
{
    P697 *case1 = [[P697 alloc] init];
    NSLog(@"Degree %ld", (long)[case1 degree:@[@1, @2, @2, @3, @1, @4, @2]]);
}
@end

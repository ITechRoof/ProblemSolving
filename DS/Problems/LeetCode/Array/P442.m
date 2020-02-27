//
//  P442.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P442.h"

@implementation P442

- (NSArray *)findDuplicates:(NSArray <NSNumber *>*)input
{
  NSMutableArray <NSNumber *> *result = [[NSMutableArray alloc] init];
    NSMutableArray <NSNumber *> *temp = [[NSMutableArray alloc] initWithArray:input];

    for (NSNumber *num in input) {
        NSNumber *val = temp[num.integerValue - 1];
        if(val.integerValue > 0)
        {
            temp[num.integerValue - 1] = [NSNumber numberWithInteger:(val.integerValue * -1)];
        }
        else
        {
            [result addObject:num];
        }
    }

    return result;
}

+ (void)solution
{
    P442 *case1 = [[P442 alloc] init];
    NSLog(@"%@", [case1 findDuplicates:@[@4,@3,@2,@7,@8,@2,@3,@1]]);
}
@end

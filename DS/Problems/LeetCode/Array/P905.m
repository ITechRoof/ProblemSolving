//
//  P905.m
//  DS
//
//  Created by Kiruthika on 24/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P905.h"

@implementation P905
- (NSArray *)sortByParity:(NSArray <NSNumber *>*)input
{
    NSMutableArray<NSNumber *> *arr = [NSMutableArray arrayWithArray:input];
    for(int i = 0; i < arr.count;i++)
    {
        if(arr[i].integerValue % 2 == 0) // Even
        {
            continue;
        }
        for(int j = i + 1; j < arr.count; j++)
        {
            if(arr[j].integerValue  % 2 == 0) // Odd
            {
                NSNumber *temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
                break;
            }
        }
    }
    return arr;
}

+ (void)solution
{
    P905 *case1 = [[P905 alloc] init];
    NSLog(@"%@", [case1 sortByParity:@[@3, @1, @2, @4]]);
}
@end

//
//  P912.m
//  DS
//
//  Created by Kiruthika on 24/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P912.h"

@implementation P912
- (NSArray *)sort:(NSArray *)input
{
    NSMutableArray<NSNumber *> *arr = [NSMutableArray arrayWithArray:input];
    for(int i = 0; i < arr.count;i++)
    {
        for(int j = i + 1; j < arr.count; j++)
        {
            if(arr[i].integerValue > arr[j].integerValue)
            {
                NSNumber *temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
    return arr;
}

+ (void)solution
{
    P912 *case1 = [[P912 alloc] init];
    NSLog(@"%@", [case1 sort:@[@5,@1,@1,@2,@0,@0]]);
}
@end

//
//  P852.m
//  DS
//
//  Created by Kiruthika on 23/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P852.h"

@implementation P852

- (NSInteger)findPeakIndex:(NSArray <NSNumber *>*)input
{
    NSNumber *prev = input[0];
    for (int i = 1; i < input.count; i++) {
        NSNumber *current = input[i];
        if(prev.integerValue > current.integerValue)
        {
            return i -1;
        }
        prev = current;
    }
    return -1;
}

+ (void)solution
{
    P852 *case1 = [[P852 alloc] init];
    NSLog(@"%ld", (long)[case1 findPeakIndex:@[@0,@1,@0]]);
}
@end

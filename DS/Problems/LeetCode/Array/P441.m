//
//  P441.m
//  DS
//
//  Created by Kiruthika on 23/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P441.h"

@implementation P441

- (NSInteger)numberOfRows:(NSInteger)coins
{
    if(coins <= 0)
    {
        return 0;
    }
    int i= 1;
    for (;i * (i + 1)/2 <= coins; i++) {}
    
    return i - 1;
}

+ (void)solution
{
    P441 *case1 = [[P441 alloc] init];
    NSLog(@"%ld", (long)[case1 numberOfRows:10]);
}
@end

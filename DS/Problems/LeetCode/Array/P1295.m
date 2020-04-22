//
//  P1295.m
//  DS
//
//  Created by Kiruthika on 22/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P1295.h"

@implementation P1295

- (NSInteger)findNumbers:(NSArray *)arr
{
    NSInteger count = 0;
    
    for (NSNumber *num in arr) {
        NSInteger n = num.integerValue;
        NSInteger digits = 0;
        while (n > 0) {
            n = n / 10;
            digits++;
        }
        
        if(digits % 2 == 0)
        {
            count++;
        }
    }
    return count;
}

+ (void)solution
{
    P1295 *case1 = [[P1295 alloc] init];
    NSLog(@"%ld", (long)[case1 findNumbers:@[@12,@345,@2,@6,@7896]]);
    NSLog(@"%ld", (long)[case1 findNumbers:@[@555,@901,@482,@1771]]);
}
@end

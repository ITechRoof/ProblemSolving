//
//  P448.m
//  DS
//
//  Created by Kiruthika on 23/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P448.h"

@implementation P448

- (NSArray *)findMissing:(NSArray <NSNumber *>*)input
{
    NSMutableArray <NSNumber *> *temp = [[NSMutableArray alloc] initWithArray:input];
    
    for (NSNumber *num in input) {
        NSNumber *val = temp[num.integerValue - 1];
        if(val.integerValue > 0)
        {
            temp[num.integerValue - 1] = [NSNumber numberWithInteger:(val.integerValue * -1)];
        }
    }
    
    NSMutableArray <NSNumber *> *result = [[NSMutableArray alloc] init];
    for (int i =0; i<temp.count;i++) {
         NSNumber *val = temp[i];
        if(val.integerValue > 0)
        {
            [result addObject:[NSNumber numberWithInteger:(i + 1)]];
        }
    }
    return result
    ;
}

+ (void)solution
{
    P448 *case1 = [[P448 alloc] init];
    NSLog(@"%@", [case1 findMissing:@[@4,@3,@2,@7,@8,@2,@3,@1]]);
}
@end

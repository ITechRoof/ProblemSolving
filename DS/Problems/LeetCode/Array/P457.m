//
//  P457.m
//  DS
//
//  Created by Kiruthika on 28/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P457.h"

@implementation P457

- (BOOL)maxNesting:(NSArray<NSNumber *> *)input
{
    NSMutableArray<NSNumber *> *visited = [NSMutableArray arrayWithCapacity:input.count];
    for(int i = 0; i < input.count; i++)
    {
        visited[i] = [NSNumber numberWithBool:NO];
    }
    
    for(int i = 0; i < input.count; i++)
    {
        NSMutableArray<NSNumber *> *temp = [visited mutableCopy];
        if(!temp[i].boolValue)
        {
            NSInteger index = i;
            BOOL isForward = input[i].integerValue > 0 ? YES : NO;

            while(!temp[index].boolValue)
            {
                temp[index] = [NSNumber numberWithBool:YES];
                NSInteger currentIndex = index;
                if((isForward && input[index].integerValue < 0) || (!isForward && input[index].integerValue > 0))
                {
                   break;
                }
                index = (index + input[index].integerValue) % input.count;

                if(currentIndex != index && temp[index].boolValue)
                {
                    return true;
                }
            }
        }
    }
    return false;
}

+ (void)solution
{
    P457 *case1 = [[P457 alloc] init];
    NSLog(@"%ld", (long)[case1 maxNesting:@[@2,@-1,@1,@2,@2]]);

    P457 *case2 = [[P457 alloc] init];
    NSLog(@"%ld", (long)[case2 maxNesting:@[@-1,@2]]);

    P457 *case3 = [[P457 alloc] init];
    NSLog(@"%ld", (long)[case3 maxNesting:@[@-2,@1,@-1,@-2,@-2]]);
    
    P457 *case4 = [[P457 alloc] init];
    NSLog(@"%ld", (long)[case4 maxNesting:@[]]);
}
@end

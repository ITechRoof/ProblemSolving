//
//  P189.m
//  DS
//
//  Created by Kiruthika on 19/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P189.h"

@implementation P189

- (NSArray *)rotateArray:(NSArray *)input key:(NSInteger)key
{
    NSMutableArray *inputArray = [NSMutableArray arrayWithArray:input];
    NSMutableSet *markSet = [NSMutableSet set];
    NSInteger index = key % input.count;
    NSNumber *temp = inputArray[0];
    for (int i = 0; i < inputArray.count; i++) {
        if([markSet containsObject:[NSNumber numberWithInteger:index]])
        {
            index = (index + 1) % input.count;
            temp = inputArray[index];
            index = (index + key) % input.count;
            i--;
            continue;
        }
        [markSet addObject:[NSNumber numberWithInteger:index]];
        NSNumber *currentValue = inputArray[index];
        inputArray[index] = temp;
        
        temp = currentValue;
        index = (index + key) % input.count;
    }
    return inputArray;
}

+ (void)solution
{
    P189 *case1 = [[P189 alloc] init];
    NSLog(@"%@", [case1 rotateArray:@[@1, @2, @3, @4, @5, @6, @7] key:3]);
    
    P189 *case2 = [[P189 alloc] init];
    NSLog(@"%@", [case2 rotateArray:@[@-1, @-100, @3, @99] key:2]);
}

@end

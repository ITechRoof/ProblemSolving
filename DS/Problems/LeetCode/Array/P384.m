//
//  P384.m
//  DS
//
//  Created by Kiruthika on 19/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P384.h"

@implementation P384

- (NSArray *)shuffleArray:(NSArray *)input
{
    NSMutableArray *inputArray = [NSMutableArray arrayWithArray:input];
    for (int i = inputArray.count - 1; i >= 0; i--) {
        NSInteger random = rand() % inputArray.count;
        NSNumber *temp = inputArray[random];
        inputArray[random] = inputArray[i];
        inputArray[i] = temp;
    }
    return inputArray;
}

+ (void)solution
{
    P384 *case1 = [[P384 alloc] init];
    NSLog(@"%@", [case1 shuffleArray:@[@1, @2, @3]]);
}

@end

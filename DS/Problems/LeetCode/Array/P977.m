//
//  P977.m
//  DS
//
//  Created by Kiruthika on 19/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P977.h"

@implementation P977

- (NSArray *)squareOfSortedArray:(NSArray *)input
{
    NSInteger minIndex = 0;
    NSInteger minValue = abs(((NSNumber *)input[0]).integerValue);
    for(int i = 1; i < input.count; i++)
    {
        NSNumber *num = input[i];
        if(minValue > abs(num.integerValue))
        {
            minValue = num.integerValue;
            minIndex = i;
        }
    }
    
    int left = minIndex, right = minIndex + 1;
    NSNumber *leftValue,*rightValue;
    NSMutableArray *square = [NSMutableArray array];
    while(left >= 0 || right != input.count)
    {
        if(left < 0)
        {
            rightValue = input[right];
            NSInteger value = pow(rightValue.doubleValue, 2);
            [square addObject:[NSNumber numberWithInteger:value]];
            right++;
        }
        else if(right == input.count)
        {
            leftValue = input[left];
            NSInteger value = pow(leftValue.doubleValue, 2);
            [square addObject:[NSNumber numberWithInteger:value]];
            left--;
        }
        else
        {
            leftValue = input[left];
            rightValue = input[right];
            
            if(abs(leftValue.integerValue) > abs(rightValue.integerValue))
            {
                NSInteger value = pow(rightValue.doubleValue, 2);
                [square addObject:[NSNumber numberWithInteger:value]];
                right++;
            }
            else
            {
                NSInteger value = pow(leftValue.doubleValue, 2);
                [square addObject:[NSNumber numberWithInteger:value]];
                left--;
            }
        }
    }
    
    return square;
}

+ (void)solution
{
    P977 *case1 = [[P977 alloc] init];
    NSLog(@"%@", [case1 squareOfSortedArray:@[@-4,@-1,@0,@3,@10]]);
}

@end

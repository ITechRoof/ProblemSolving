//
//  SumOfTwoNoInSortedArray.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 02/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "SumOfTwoNoInSortedArray.h"

@interface SumOfTwoNoInSortedArray()

@property (nonatomic) NSArray *arr;

@end

@implementation SumOfTwoNoInSortedArray

+ (void)solution {
    
    //Given
    NSArray *arr = @[@2, @9, @9, @11, @11, @14, @18];

    NSInteger k = 20;
    
    NSInteger first = 0;
    NSInteger last = [arr count] - 1;
    
    for(;first < last;) {
        NSNumber *firstNum = arr[first];
        NSNumber *lastNum = arr[last];

        NSInteger sum = firstNum.integerValue + lastNum.integerValue;
        if (sum < k) {
            first++;
        }else if(sum > k) {
            last--;
        }else {
            NSLog(@"%@ %@", firstNum, lastNum);
            first++;
            last--;
        }
    }
}

@end

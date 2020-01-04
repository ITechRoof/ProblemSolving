//
//  SumOfTwoNo.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 02/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "SumOfTwoNo.h"

@interface SumOfTwoNo()

@property (nonatomic) NSArray *arr;

@end

@implementation SumOfTwoNo

+ (void)solution {
    
    //Given
    NSArray *arr = [NSArray arrayWithObjects:@2, @17, @-11, @13, nil];
    NSInteger k = 6;
    
    NSMutableDictionary *hashDict = [[NSMutableDictionary alloc] init];
    
    NSInteger i = 0;
    for(NSNumber *value in arr) {
        NSInteger n = [value integerValue];
//        if(k < n) {
//            continue;
//        }
        NSNumber *r = [[NSNumber alloc] initWithInteger:k - n];
        if([hashDict.allKeys containsObject:value]) {
            NSNumber *index = hashDict[value];
            NSLog(@"%@ %@", arr[index.integerValue], value);
            break;
        }else {
            [hashDict setObject: [[NSNumber alloc] initWithInteger:i] forKey:r];
        }
        i++;
    }
}

@end

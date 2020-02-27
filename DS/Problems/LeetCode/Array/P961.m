//
//  P961.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//In a array A of size 2N, there are N+1 unique elements, and exactly one of these elements is repeated N times.
//
//Return the element repeated N times.
//
//
//
//Example 1:
//
//Input: [1,2,3,3]
//Output: 3
//Example 2:
//
//Input: [2,1,2,5,3,2]
//Output: 2
//Example 3:
//
//Input: [5,1,5,2,5,3,5,4]
//Output: 5
//

#import "P961.h"

@implementation P961

- (NSInteger)findNRepeated:(NSArray *)arr
{
    NSMutableArray *temp = [NSMutableArray array];
    
    for(NSNumber *num in arr)
    {
        if(![temp containsObject:num])
        {
            [temp addObject:num];
        }
        else
        {
            return num.integerValue;
        }
    }
    return -1;
}

+ (void)solution 
{
    P961 *case1 = [[P961 alloc] init];
    NSLog(@"%ld", (long)[case1 findNRepeated:@[@1,@2,@3,@3]]);
    
    P961 *case2 = [[P961 alloc] init];
    NSLog(@"%ld", (long)[case2 findNRepeated:@[@2,@1,@2,@5,@3,@2]]);
    
    P961 *case3 = [[P961 alloc] init];
    NSLog(@"%ld", (long)[case3 findNRepeated:@[@5,@1,@5,@2,@5,@3,@5,@4]]);
}
@end

//
//  P942.m
//  DS
//
//  Created by Kiruthika on 15/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/di-string-match/
//Given a string S that only contains "I" (increase) or "D" (decrease), let N = S.length.
//
//Return any permutation A of [0, 1, ..., N] such that for all i = 0, ..., N-1:
//
//If S[i] == "I", then A[i] < A[i+1]
//If S[i] == "D", then A[i] > A[i+1]
//
//
//Example 1:
//
//Input: "IDID"
//Output: [0,4,1,3,2]
//Example 2:
//
//Input: "III"
//Output: [0,1,2,3]
//Example 3:
//
//Input: "DDI"
//Output: [3,2,0,1]

#import "P942.h"

@implementation P942

- (NSArray *)findArrayForDIStringMatch:(NSString *)str
{
    NSInteger low = 0, high = str.length;
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        if(c == 'I')
        {
            [arr addObject:[NSNumber numberWithInteger:low]];
            low++;
        }
        else
        {
            [arr addObject:[NSNumber numberWithInteger:high]];
            high--;
        }
    }
    [arr addObject:[NSNumber numberWithInteger:low]];
    return arr;
}

+ (void)solution
{
    P942 *case1 = [[P942 alloc] init];
    NSLog(@"%@", [case1 findArrayForDIStringMatch:@"IDID"]);
    NSLog(@"%@", [case1 findArrayForDIStringMatch:@"III"]);
    NSLog(@"%@", [case1 findArrayForDIStringMatch:@"DDI"]);
}
@end

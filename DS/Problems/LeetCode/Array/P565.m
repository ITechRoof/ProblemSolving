//
//  P565.m
//  DS
//
//  Created by Kiruthika on 28/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//565. Array Nesting
//A zero-indexed array A of length N contains all integers from 0 to N-1. Find and return the longest length of set S, where S[i] = {A[i], A[A[i]], A[A[A[i]]], ... } subjected to the rule below.
//
//Suppose the first element in S starts with the selection of element A[i] of index = i, the next element in S should be A[A[i]], and then A[A[A[i]]]… By that analogy, we stop adding right before a duplicate element occurs in S.
//
//
//
//Example 1:
//
//Input: A = [5,4,0,3,1,6,2]
//Output: 4
//Explanation:
//A[0] = 5, A[1] = 4, A[2] = 0, A[3] = 3, A[4] = 1, A[5] = 6, A[6] = 2.
//
//One of the longest S[K]:
//S[0] = {A[0], A[5], A[6], A[2]} = {5, 6, 2, 0}
//
//
//Note:
//
//N is an integer within the range [1, 20,000].
//The elements of A are all distinct.
//Each element of A is an integer within the range [0, N-1].

#import "P565.h"

@implementation P565

- (NSInteger)maxNesting:(NSArray<NSNumber *> *)input
{
    NSMutableArray<NSNumber *> *visited = [NSMutableArray arrayWithCapacity:input.count];
    for(int i = 0; i < input.count; i++)
    {
        visited[i] = [NSNumber numberWithBool:NO];
    }
    
    NSInteger maxCount = 0;
    for(int i = 0; i < input.count; i++)
    {
        if(!visited[i].boolValue)
        {
            int index = i, count = 0;
            while(!visited[index].boolValue)
            {
                visited[index] = [NSNumber numberWithBool:YES];
                index = input[index].integerValue;
                count++;
            }
            maxCount = MAX(maxCount, count);
        }
    }
    return maxCount;
}

+ (void)solution
{
    P565 *case1 = [[P565 alloc] init];
    NSLog(@"%ld", (long)[case1 maxNesting:@[@5,@4,@0,@3,@1,@6,@2]]);
}
@end


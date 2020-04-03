//
//  P583.m
//  DS
//
//  Created by Kiruthika on 03/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/delete-operation-for-two-strings/
//Given two words word1 and word2, find the minimum number of steps required to make word1 and word2 the same, where in each step you can delete one character in either string.
//
//Example 1:
//Input: "sea", "eat"
//Output: 2
//Explanation: You need one step to make "sea" to "ea" and another step to make "eat" to "ea".
//Note:
//The length of given words won't exceed 500.
//Characters in given words can only be lower-case letters.

#import "P583.h"

@implementation P583
- (NSInteger)lcs:(NSString *)s1 s2:(NSString *)s2 m:(NSInteger)m n:(NSInteger)n memo:(NSMutableArray **)memo
{
    if(m < 0 || n < 0)
    {
        return 0;
    }
    
    NSMutableArray <NSNumber *>*row = [*memo objectAtIndex:m];
    if([row objectAtIndex:n].integerValue > 0)
    {
        return [row objectAtIndex:n].integerValue;
    }
    if([s1 characterAtIndex:m] == [s2 characterAtIndex:n])
    {
        [row replaceObjectAtIndex:n withObject:[NSNumber numberWithInteger:1 + [self lcs:s1 s2:s2 m:m - 1 n:n - 1 memo:memo]]];
        [*memo replaceObjectAtIndex:m withObject:row];
    }
    else
    {
        [row replaceObjectAtIndex:n withObject:[NSNumber numberWithInteger:MAX([self lcs:s1 s2:s2 m:m n:n - 1 memo:memo],[self lcs:s1 s2:s2 m:m - 1 n:n memo:memo])]];
        [*memo replaceObjectAtIndex:m withObject:row];
    }
    
    return [row objectAtIndex:n].integerValue;
}
- (NSInteger)minDeletion:(NSString *)s1 s2:(NSString *)s2
{
    NSMutableArray *memo = [NSMutableArray array];
    NSMutableArray *row = [NSMutableArray array];
    for(NSInteger j = 0 ; j < s2.length;j++)
    {
        [row addObject:@0];
    }
    for(NSInteger i = 0 ; i < s1.length;i++)
    {
        [memo addObject:[row mutableCopy]];
    }
    
    return s1.length + s2.length - (2 * [self lcs:s1 s2:s2 m:s1.length - 1 n:s2.length - 1 memo:&memo]);
}

+ (void)solution
{
    P583 *case1 = [[P583 alloc] init];
    NSLog(@"%ld", (long)[case1 minDeletion:@"sea" s2:@"eat"]);
}
@end

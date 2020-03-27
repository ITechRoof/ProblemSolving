//
//  P893.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/groups-of-special-equivalent-strings/
//You are given an array A of strings.
//
//A move onto S consists of swapping any two even indexed characters of S, or any two odd indexed characters of S.
//
//Two strings S and T are special-equivalent if after any number of moves onto S, S == T.
//
//For example, S = "zzxy" and T = "xyzz" are special-equivalent because we may make the moves "zzxy" -> "xzzy" -> "xyzz" that swap S[0] and S[2], then S[1] and S[3].
//
//Now, a group of special-equivalent strings from A is a non-empty subset of A such that:
//
//Every pair of strings in the group are special equivalent, and;
//The group is the largest size possible (ie., there isn't a string S not in the group such that S is special equivalent to every string in the group)
//Return the number of groups of special-equivalent strings from A.
//
// 
//Example 1:
//
//Input: ["abcd","cdab","cbad","xyzz","zzxy","zzyx"]
//Output: 3
//Explanation:
//One group is ["abcd", "cdab", "cbad"], since they are all pairwise special equivalent, and none of the other strings are all pairwise special equivalent to these.
//
//The other two groups are ["xyzz", "zzxy"] and ["zzyx"].  Note that in particular, "zzxy" is not special equivalent to "zzyx".
//Example 2:
//
//Input: ["abc","acb","bac","bca","cab","cba"]
//Output: 3
// 
//
//Note:
//
//1 <= A.length <= 1000
//1 <= A[i].length <= 20
//All A[i] have the same length.
//All A[i] consist of only lowercase letters.

#import "P893.h"

@implementation P893
- (NSInteger)numSpecialEquivGroups:(NSArray *)arr
{
    NSMutableSet *set = [NSMutableSet set];
    
    NSMutableArray *count = [NSMutableArray array];
    for (NSInteger i = 0; i < 52; i++) {
        count[i] = @0;
    }
    
    for (NSString *word in arr) {
        NSMutableArray<NSNumber *> *c = [count mutableCopy];
        for (NSInteger i = 0; i < word.length; i++) {
            NSInteger index = [word characterAtIndex:i] - 'a' + (26 * (i % 2 == 0));
            c[index] = [NSNumber numberWithInteger:c[index].integerValue + 1];
        }
        [set addObject:c];
    }
    return set.count;
}

+ (void)solution
{
    P893 *case1 = [[P893 alloc] init];
    NSLog(@"%ld", (long)[case1 numSpecialEquivGroups:@[@"abcd",@"cdab",@"cbad",@"xyzz",@"zzxy",@"zzyx"]]);
    NSLog(@"%ld", (long)[case1 numSpecialEquivGroups:@[@"abc",@"acb",@"bac",@"bca",@"cab",@"cba"]]);

}
@end

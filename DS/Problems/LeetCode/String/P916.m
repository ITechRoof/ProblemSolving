//
//  P916.m
//  DS
//
//  Created by Kiruthika on 02/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/word-subsets/
//We are given two arrays A and B of words.  Each word is a string of lowercase letters.
//
//Now, say that word b is a subset of word a if every letter in b occurs in a, including multiplicity.  For example, "wrr" is a subset of "warrior", but is not a subset of "world".
//
//Now say a word a from A is universal if for every b in B, b is a subset of a.
//
//Return a list of all universal words in A.  You can return the words in any order.
//
//
//
//Example 1:
//
//Input: A = ["amazon","apple","facebook","google","leetcode"], B = ["e","o"]
//Output: ["facebook","google","leetcode"]
//Example 2:
//
//Input: A = ["amazon","apple","facebook","google","leetcode"], B = ["l","e"]
//Output: ["apple","google","leetcode"]
//Example 3:
//
//Input: A = ["amazon","apple","facebook","google","leetcode"], B = ["e","oo"]
//Output: ["facebook","google"]
//Example 4:
//
//Input: A = ["amazon","apple","facebook","google","leetcode"], B = ["lo","eo"]
//Output: ["google","leetcode"]
//Example 5:
//
//Input: A = ["amazon","apple","facebook","google","leetcode"], B = ["ec","oc","ceo"]
//Output: ["facebook","leetcode"]
//
//
//Note:
//
//1 <= A.length, B.length <= 10000
//1 <= A[i].length, B[i].length <= 10
//A[i] and B[i] consist only of lowercase letters.
//All words in A[i] are unique: there isn't i != j with A[i] == A[j].

#import "P916.h"

@implementation P916
- (NSArray *)wordSubsets:(NSArray *)A B:(NSArray *)B
{
    NSMutableArray *res = [NSMutableArray array];
    //    NSMutableArray *bMap = [NSMutableArray array];
    
    NSInteger bMap[26];
    for (NSInteger i = 0; i < 26; i++) {
        bMap[i] = 0;
    }
    
    for (NSString *b in B) {
        NSInteger currentMapMap[26];
        for (NSInteger i = 0; i < 26; i++) {
            currentMapMap[i] = 0;
        }
        for (NSInteger i = 0; i < b.length; i++) {
            currentMapMap[[b characterAtIndex:i] - 'a']++;
            bMap[[b characterAtIndex:i] - 'a'] = MAX(currentMapMap[[b characterAtIndex:i] - 'a'], bMap[[b characterAtIndex:i] - 'a']);
        }
    }
    
    for (NSString *a in A) {
        
        NSInteger currentMapMap[26];
        for (NSInteger i = 0; i < 26; i++) {
            currentMapMap[i] = 0;
        }
        BOOL isSubSet = YES;
        for (NSInteger i = 0; i < a.length; i++) {
            currentMapMap[[a characterAtIndex:i] - 'a']++;
        }
        
        for (NSInteger i = 0; i < 26; i++) {
            if(currentMapMap[i] < bMap[i])
            {
                isSubSet = NO;
                break;
            }
        }
        
        if(isSubSet)
        {
            [res addObject:a];
        }
    }
    return res;
}
+ (void)solution
{
    P916 *case1 = [[P916 alloc] init];
    NSLog(@"%@", [case1 wordSubsets:@[@"amazon",@"apple",@"facebook",@"google",@"leetcode"] B: @[@"e", @"o"]]);
    NSLog(@"%@", [case1 wordSubsets:@[@"amazon",@"apple",@"facebook",@"google",@"leetcode"] B: @[@"l", @"e"]]);
    NSLog(@"%@", [case1 wordSubsets:@[@"amazon",@"apple",@"facebook",@"google",@"leetcode"] B: @[@"e", @"oo"]]);
    NSLog(@"%@", [case1 wordSubsets:@[@"amazon",@"apple",@"facebook",@"google",@"leetcode"] B: @[@"lo", @"eo"]]);
    NSLog(@"%@", [case1 wordSubsets:@[@"amazon",@"apple",@"facebook",@"google",@"leetcode"] B: @[@"ec",@"oc",@"ceo"]]);

}
@end

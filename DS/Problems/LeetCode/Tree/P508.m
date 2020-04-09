//
//  P508.m
//  DS
//
//  Created by Kiruthika on 09/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/most-frequent-subtree-sum/
//Given the root of a tree, you are asked to find the most frequent subtree sum. The subtree sum of a node is defined as the sum of all the node values formed by the subtree rooted at that node (including the node itself). So what is the most frequent subtree sum value? If there is a tie, return all the values with the highest frequency in any order.
//
//Examples 1
//Input:
//
//  5
// /  \
//2   -3
//return [2, -3, 4], since all the values happen only once, return all of them in any order.
//Examples 2
//Input:
//
//  5
// /  \
//2   -5
//return [2], since 2 happens twice, however -5 only occur once.
//Note: You may assume the sum of values in any subtree is in the range of 32-bit signed integer.

#import "P508.h"
#import "Tree.h"

@interface P508()

@property (nonatomic) NSMutableDictionary *freqDict;

@end

@implementation P508
- (NSInteger)sumOfNodes:(TreeNode *)node maxCount:(NSInteger *)maxCount maxNum:(NSMutableArray **)maxNums
{
    if(node.isLeaf)
    {
        NSNumber *key = [NSNumber numberWithInteger:node.data.integerValue];
        NSNumber *count = [self.freqDict objectForKey:key] ?: @0;
        if(count.integerValue + 1 >= *maxCount)
        {
            if(count.integerValue + 1 > *maxCount)
            {
            [*maxNums removeAllObjects];
            }
            [*maxNums addObject:node.data];
            *maxCount = count.integerValue + 1;
        }
        [self.freqDict setObject:[NSNumber numberWithInteger:count.integerValue + 1] forKey:key];
        return node.data.integerValue;
    }
    
    NSInteger left = 0;
    if(node.left)
    {
        left = [self sumOfNodes:node.left maxCount:maxCount maxNum:maxNums];
    }
    NSInteger right = 0;
    if(node.right)
    {
        right = [self sumOfNodes:node.right maxCount:maxCount maxNum:maxNums];
    }
    
    NSInteger currentSum = left + right + node.data.integerValue;
    
    NSNumber *key = [NSNumber numberWithInteger:currentSum];
    NSNumber *count = [self.freqDict objectForKey:key] ?: @0;
    
    if(count.integerValue + 1 >= *maxCount)
    {
        if(count.integerValue + 1 > *maxCount)
        {
        [*maxNums removeAllObjects];
        }
        [*maxNums addObject:[NSNumber numberWithInteger:currentSum]];
        *maxCount = count.integerValue + 1;
    }
    
    [self.freqDict setObject:[NSNumber numberWithInteger:count.integerValue + 1] forKey:key];
    
    return currentSum;
}
- (NSArray *)findFrequentTreeSum:(TreeNode *)node
{
    if(node == NULL)
    {
        return @[];
    }
    self.freqDict = [NSMutableDictionary dictionary];
    NSMutableArray *res = [NSMutableArray array];
    NSInteger maxCount = 0;
    [self sumOfNodes:node maxCount:&maxCount maxNum:&res];
    return res;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@2 right:@-5];
        
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P508 getTree];
    P508 *case1 = [[P508 alloc] init];
    NSLog(@"%@", [case1 findFrequentTreeSum:tree.root]);
}
@end

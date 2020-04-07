//
//  P437.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/path-sum-iii/
//You are given a binary tree in which each node contains an integer value.
//
//Find the number of paths that sum to a given value.
//
//The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
//
//The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.
//
//Example:
//
//root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
//
//      10
//     /  \
//    5   -3
//   / \    \
//  3   2   11
// / \   \
//3  -2   1
//
//Return 3. The paths that sum to 8 are:
//
//1.  5 -> 3
//2.  5 -> 2 -> 1
//3. -3 -> 11

#import "P437.h"
#import "Tree.h"

@implementation P437

- (NSArray *)path:(TreeNode *)node sum:(NSInteger)sum res:(NSInteger *)res
{
    if(node == NULL)
    {
        return 0;
    }
    if(node.isLeaf)
    {
        return @[node.data];
    }
    
    NSArray *left = [self path:node.left sum:sum res:res];
    NSArray *right = [self path:node.right sum:sum res:res];
    
    NSMutableArray *temp = [NSMutableArray array];
    [temp addObject:@0];
    [temp addObjectsFromArray:left];
    [temp addObjectsFromArray:right];

    NSMutableArray *temp1 = [NSMutableArray array];

    for (NSNumber *num in temp) {

        NSInteger s = num.integerValue + node.data.integerValue;
        [temp1 addObject:[NSNumber numberWithInteger:s]];
        
        if(s == sum)
        {
            *res = *res + 1;
        }
    }
    
    return temp1;
}
- (NSInteger)pathSum:(TreeNode *)node sum:(NSInteger)sum
{
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:@0];
    NSInteger res = 0;
    
    [self path:node sum:sum res:&res];
    return res;
}
+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@10 left:@5 right:@-3];
    
    root.left.left = [Tree createSubTreeWithRoot:@3 left:@3 right:@-2];
    root.left.right = [Tree createSubTreeWithRoot:@2 left:NULL right:@1];
    
    root.right.right = [Tree createSubTreeWithRoot:@11 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P437 getTree];
    P437 *case1 = [[P437 alloc] init];
    
    NSLog(@"%ld", (long)[case1 pathSum:tree.root sum:8]);
}
@end

//
//  P687.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/longest-univalue-path/
//Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.
//
//The length of path between two nodes is represented by the number of edges between them.
//
//
//
//Example 1:
//
//Input:
//
//              5
//             / \
//            4   5
//           / \   \
//          1   1   5
//Output: 2
//
//
//
//Example 2:
//
//Input:
//
//              1
//             / \
//            4   5
//           / \   \
//          4   4   5
//Output: 2
//
//
//
//Note: The given binary tree has not more than 10000 nodes. The height of the tree is not more than 1000.

#import "P687.h"
#import "Tree.h"

@implementation P687

- (NSInteger)longestUnivaluePath:(TreeNode *)node max:(NSInteger *)max
{
    if(node == NULL)
    {
        return 0;
    }
    
    NSInteger left = [self longestUnivaluePath:node.left max:max], right = [self longestUnivaluePath:node.right max:max];
    
    if(node.data.integerValue == node.left.data.integerValue)
    {
        left = left + 1;
    }
    
    if(node.data.integerValue == node.right.data.integerValue)
    {
        right = right + 1;
    }
    *max = MAX(*max, left + right);
    return MAX(left, right);
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@4 right:@5];
    
    root.left.left = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    
    root.right.right = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];
    
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P687 getTree];
    P687 *case1 = [[P687 alloc] init];
    
    NSInteger max = 0;
    [case1 longestUnivaluePath:tree.root max:&max];
    NSLog(@"%ld", (long)max);
}
@end

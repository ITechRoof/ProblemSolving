//
//  P112.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/path-sum/
//Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Given the below binary tree and sum = 22,
//
//      5
//     / \
//    4   8
//   /   / \
//  11  13  4
// /  \      \
//7    2      1
//return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.

#import "P112.h"
#import "Tree.h"

@implementation P112
- (BOOL)hasPathSum:(TreeNode *)node sum:(NSInteger)sum currentSum:(NSInteger)currentSum
{
    if(node == NULL)
    {
        return NO;
    }
    
    currentSum = currentSum + node.data.integerValue;
    if(currentSum == sum)
    {
        return YES;
    }
    
    return [self hasPathSum:node.left sum:sum currentSum:currentSum] || [self hasPathSum:node.right sum:sum currentSum:currentSum];
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@4 right:@8];
    
    root.left.left = [Tree createSubTreeWithRoot:@11 left:@7 right:@2];
    
    root.right.left = [Tree createSubTreeWithRoot:@13 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@4 left:NULL right:@1];

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P112 getTree];
    P112 *case1 = [[P112 alloc] init];
    
    [case1 hasPathSum:tree.root sum:22 currentSum:0] ? NSLog(@"YES") : NSLog(@"NO");
    [case1 hasPathSum:tree.root sum:18 currentSum:0] ? NSLog(@"YES") : NSLog(@"NO");
}
@end

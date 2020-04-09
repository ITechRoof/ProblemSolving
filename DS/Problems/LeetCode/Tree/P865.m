//
//  P865.m
//  DS
//
//  Created by Kiruthika on 09/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes/
//Given a binary tree rooted at root, the depth of each node is the shortest distance to the root.
//
//A node is deepest if it has the largest depth possible among any node in the entire tree.
//
//The subtree of a node is that node, plus the set of all descendants of that node.
//
//Return the node with the largest depth such that it contains all the deepest nodes in its subtree.
//
//
//
//Example 1:
//
//Input: [3,5,1,6,2,0,8,null,null,7,4]
//Output: [2,7,4]
//Explanation:
//
//
//
//We return the node with value 2, colored in yellow in the diagram.
//The nodes colored in blue are the deepest nodes of the tree.
//The input "[3, 5, 1, 6, 2, 0, 8, null, null, 7, 4]" is a serialization of the given tree.
//The output "[2, 7, 4]" is a serialization of the subtree rooted at the node with value 2.
//Both the input and output have TreeNode type.
//
//
//Note:
//
//The number of nodes in the tree will be between 1 and 500.
//The values of each node are unique.

#import "P865.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P865
- (NSInteger)depthOfTree:(TreeNode *)node
{
    if(node == NULL)
    {
        return -1;
    }
    return MAX([self depthOfTree:node.left], [self depthOfTree:node.right]) + 1;
}
- (TreeNode *)subtreeWithAllDeepestHelper:(TreeNode *)node depth:(NSInteger)currentDepth maxDepth:(NSInteger)maxDepth
{
    if(node == NULL)
       {
           return NULL;
       }
    if(maxDepth == currentDepth)
    {
        return node;
    }
    TreeNode *left = [self subtreeWithAllDeepestHelper:node.left depth:currentDepth + 1 maxDepth:maxDepth];
    TreeNode *right = [self subtreeWithAllDeepestHelper:node.right depth:currentDepth + 1 maxDepth:maxDepth];

    if(left && right)
    {
        return node;
    }
    else if(left)
    {
        return left;
    }
    return right;
}
- (TreeNode *)subtreeWithAllDeepest:(TreeNode *)node
{
    if(node == NULL)
    {
        return NULL;
    }
    
    NSInteger maxDepth = [self depthOfTree:node];
    return [self subtreeWithAllDeepestHelper:node depth:0 maxDepth:maxDepth];
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@3 left:@5 right:@1];
    
    root.left.left = [Tree createSubTreeWithRoot:@6 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@2 left:@7 right:@4];
    
    root.right.left = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@8 left:NULL right:NULL];

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P865 getTree];
    P865 *case1 = [[P865 alloc] init];
    NSLog(@"%@", ((TreeNode *)[case1 subtreeWithAllDeepest:tree.root]).data);
}
@end


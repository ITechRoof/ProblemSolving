//
//  P235.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
//Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.
//
//According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
//
//Given binary search tree:  root = [6,2,8,0,4,7,9,null,null,3,5]
//
//
//
//
//Example 1:
//
//Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
//Output: 6
//Explanation: The LCA of nodes 2 and 8 is 6.
//Example 2:
//
//Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
//Output: 2
//Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
//
//
//Note:
//
//All of the nodes' values will be unique.
//p and q are different and both values will exist in the BST.

#import "P235.h"
#import "Tree.h"

@implementation P235
- (TreeNode *)lowestCommonAncestor:(TreeNode *)node p:(NSInteger)p q:(NSInteger)q
{
    if(node == NULL)
    {
        return NULL;
    }
    
    if(node.data.integerValue > p && node.data.integerValue > q)
    {
        return [self lowestCommonAncestor:node.left p:p q:q];
    }
    else if(node.data.integerValue < p && node.data.integerValue < q)
    {
        return [self lowestCommonAncestor:node.right p:p q:q];
    }
    
    return node;
}
+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@6 left:@2 right:@8];
    
    root.left.left = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@4 left:@3 right:@5];
    
    root.right.left = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@9 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P235 getTree];
    P235 *case1 = [[P235 alloc] init];
    
    NSLog(@"%@", ((TreeNode *)[case1 lowestCommonAncestor:tree.root p:2 q:8]).data);
    NSLog(@"%@", ((TreeNode *)[case1 lowestCommonAncestor:tree.root p:2 q:4]).data);
}
@end


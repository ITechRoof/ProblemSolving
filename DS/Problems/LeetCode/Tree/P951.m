//
//  P951.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/flip-equivalent-binary-trees/
//For a binary tree T, we can define a flip operation as follows: choose any node, and swap the left and right child subtrees.
//
//A binary tree X is flip equivalent to a binary tree Y if and only if we can make X equal to Y after some number of flip operations.
//
//Write a function that determines whether two binary trees are flip equivalent.  The trees are given by root nodes root1 and root2.
//
//
//
//Example 1:
//
//Input: root1 = [1,2,3,4,5,6,null,null,null,7,8], root2 = [1,3,2,null,6,4,5,null,null,null,null,8,7]
//Output: true
//Explanation: We flipped at nodes with values 1, 3, and 5.
//Flipped Trees Diagram
//
//
//Note:
//
//Each tree will have at most 100 nodes.
//Each value in each tree will be a unique integer in the range [0, 99].
//

#import "P951.h"
#import "Tree.h"

@implementation P951
- (BOOL)flipEquiv:(TreeNode *)node1 node:(TreeNode *)node2
{
    if(node1 == NULL && node2 == NULL)
    {
        return YES;
    }
    else if(node1 == NULL || node2 == NULL || node1.data.integerValue != node2.data.integerValue)
    {
        return NO;
    }
    else if(node1.data.integerValue == node2.data.integerValue)
    {
        return YES;
    }
    return ([self flipEquiv:node1.left node:node2.left] && [self flipEquiv:node1.right node:node2.right]) || ([self flipEquiv:node1.left node:node2.right] && [self flipEquiv:node1.right node:node2.left]);
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    
    root.left.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@5 left:@7 right:@8];
    
    root.right.left = [Tree createSubTreeWithRoot:@6 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (Tree *)getTree1
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@3 right:@2];
    
    root.left.right = [Tree createSubTreeWithRoot:@6 left:@7 right:@8];
    
    root.right.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@5 left:@8 right:@7];
    
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P951 getTree];
    P951 *case1 = [[P951 alloc] init];
    
    [case1 flipEquiv:tree.root node:[P951 getTree1].root] ? NSLog(@"Flip equivalent") : NSLog(@"Not Flip equivalent");
}
@end

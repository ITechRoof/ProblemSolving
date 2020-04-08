//
//  P1379.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/find-a-corresponding-node-of-a-binary-tree-in-a-clone-of-that-tree/
//Given two binary trees original and cloned and given a reference to a node target in the original tree.
//
//The cloned tree is a copy of the original tree.
//
//Return a reference to the same node in the cloned tree.
//
//Note that you are not allowed to change any of the two trees or the target node and the answer must be a reference to a node in the cloned tree.
//
//Follow up: Solve the problem if repeated values on the tree are allowed.
//
//
//
//Example 1:
//
//
//Input: tree = [7,4,3,null,null,6,19], target = 3
//Output: 3
//Explanation: In all examples the original and cloned trees are shown. The target node is a green node from the original tree. The answer is the yellow node from the cloned tree.
//Example 2:
//
//
//Input: tree = [7], target =  7
//Output: 7
//Example 3:
//
//
//Input: tree = [8,null,6,null,5,null,4,null,3,null,2,null,1], target = 4
//Output: 4
//Example 4:
//
//
//Input: tree = [1,2,3,4,5,6,7,8,9,10], target = 5
//Output: 5
//Example 5:
//
//
//Input: tree = [1,2,null,3], target = 2
//Output: 2
//
//
//Constraints:
//
//The number of nodes in the tree is in the range [1, 10^4].
//The values of the nodes of the tree are unique.
//target node is a node from the original tree and is not null.

#import "P1379.h"
#import "Tree.h"

@implementation P1379
- (TreeNode *)getTargetCopy:(TreeNode *)node clonedNode:(TreeNode *)cloned target:(TreeNode *)target
{
    if(node == NULL)
    {
        return NULL;
    }
    
    if(node == target)
    {
        return cloned;
    }
    TreeNode *left = [self getTargetCopy:node.left clonedNode:cloned.left target:target];
    TreeNode *right = [self getTargetCopy:node.right clonedNode:cloned.right target:target];

    if(left)
    {
        return left;
    }
    if(right)
    {
        return right;
    }
    return NULL;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@7 left:@4 right:@3];
    
    root.right.left = [Tree createSubTreeWithRoot:@6 left:NULL right:NULL];
    root.right.left = [Tree createSubTreeWithRoot:@19 left:NULL right:NULL];

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P1379 getTree];
    Tree *tree1 = [tree copy];

    P1379 *case1 = [[P1379 alloc] init];
        
    NSLog(@"%@", [case1 getTargetCopy:tree.root clonedNode:tree1.root target:tree.root.right]);
}
@end

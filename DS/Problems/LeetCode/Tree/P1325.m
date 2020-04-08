//
//  P1325.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/delete-leaves-with-a-given-value/
//Given a binary tree root and an integer target, delete all the leaf nodes with value target.
//
//Note that once you delete a leaf node with value target, if it's parent node becomes a leaf node and has the value target, it should also be deleted (you need to continue doing that until you can't).
//
//
//
//Example 1:
//
//
//
//Input: root = [1,2,3,2,null,2,4], target = 2
//Output: [1,null,3,null,4]
//Explanation: Leaf nodes in green with value (target = 2) are removed (Picture in left).
//After removing, new nodes become leaf nodes with value (target = 2) (Picture in center).
//Example 2:
//
//
//
//Input: root = [1,3,3,3,2], target = 3
//Output: [1,3,null,null,2]
//Example 3:
//
//
//
//Input: root = [1,2,null,2,null,2], target = 2
//Output: [1]
//Explanation: Leaf nodes in green with value (target = 2) are removed at each step.
//Example 4:
//
//Input: root = [1,1,1], target = 1
//Output: []
//Example 5:
//
//Input: root = [1,2,3], target = 1
//Output: [1,2,3]

#import "P1325.h"
#import "Tree.h"

@implementation P1325
- (TreeNode *)removeLeafNodes:(TreeNode *)node val:(NSInteger)val
{
    if(node == NULL)
    {
        return NULL;
    }
    node.left = [self removeLeafNodes:node.left val:val];
    node.right = [self removeLeafNodes:node.right val:val];
    
    if(node.isLeaf && node.data.integerValue == val)
    {
        return NULL;
    }
    return node;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    
    root.left.left = [Tree createSubTreeWithRoot:@2 left:NULL right:NULL];
    
    root.right.left = [Tree createSubTreeWithRoot:@2 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P1325 getTree];
    P1325 *case1 = [[P1325 alloc] init];
    
    NSLog(@"%@", ((TreeNode *)[case1 removeLeafNodes:tree.root val:2]).data);
}
@end



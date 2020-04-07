//
//  P543.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/diameter-of-binary-tree/
//Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
//
//Example:
//Given a binary tree
//          1
//         / \
//        2   3
//       / \
//      4   5
//Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
//
//Note: The length of path between two nodes is represented by the number of edges between them.

#import "P543.h"
#import "Tree.h"

@implementation P543

- (NSInteger)heightOfTree:(TreeNode *)node
{
    if(node == NULL )
    {
        return 0;
    }
    
    return MAX([self heightOfTree:node.left], [self heightOfTree:node.right]) + 1;
}
- (NSInteger)diameterOfBinaryTree:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    
    NSInteger currentDiameter = [self heightOfTree:node.left] + [self heightOfTree:node.right];
    
    return MAX(currentDiameter, MAX([self diameterOfBinaryTree:node.left], [self diameterOfBinaryTree:node.right]));
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];

    root.left.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];

    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P543 getTree];
    P543 *case1 = [[P543 alloc] init];
    
    NSLog(@"%ld", (long)[case1 diameterOfBinaryTree:tree.root]);
}
@end

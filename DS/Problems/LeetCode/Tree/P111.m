//
//  P111.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/minimum-depth-of-binary-tree/
//Given a binary tree, find its minimum depth.
//
//The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Given binary tree [3,9,20,null,null,15,7],
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its minimum depth = 2.

#import "P111.h"
#import "Tree.h"

@implementation P111
- (NSInteger)minDepth:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    return MIN([self minDepth:node.left], [self minDepth:node.right]) + 1;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@3 left:@9 right:@20];
    
    root.right.left = [Tree createSubTreeWithRoot:@15 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P111 getTree];
    P111 *case1 = [[P111 alloc] init];
    
    NSLog(@"%ld", (long)[case1 minDepth:tree.root]);
}
@end

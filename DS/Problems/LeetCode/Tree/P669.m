//
//  P669.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/trim-a-binary-search-tree/
//Given a binary search tree and the lowest and highest boundaries as L and R, trim the tree so that all its elements lies in [L, R] (R >= L). You might need to change the root of the tree, so the result should return the new root of the trimmed binary search tree.
//
//Example 1:
//Input:
//    1
//   / \
//  0   2
//
//  L = 1
//  R = 2
//
//Output:
//    1
//      \
//       2
//Example 2:
//Input:
//    3
//   / \
//  0   4
//   \
//    2
//   /
//  1
//
//  L = 1
//  R = 3
//
//Output:
//      3
//     /
//   2
//  /
// 1

#import "P669.h"
#import "Tree.h"

@implementation P669

- (TreeNode *)trimBST:(TreeNode *)node left:(NSInteger)left right:(NSInteger)right
{
 if(node == NULL)
 {
     return NULL;
 }
    if(node.data.integerValue < left)
    {
        return [self trimBST:node.right left:left right:right];
    }
    
    if(node.data.integerValue > right)
    {
        return [self trimBST:node.left left:left right:right];
    }
    
    node.left = [self trimBST:node.left left:left right:right];
    node.right = [self trimBST:node.right left:left right:right];

    return node;
}
+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@0 right:@2];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (Tree *)getTree1
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@3 left:@0 right:@4];
    
    root.left.right = [Tree createSubTreeWithRoot:@2 left:@1 right:NULL];
        
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P669 getTree];
    P669 *case1 = [[P669 alloc] init];
    
    NSLog(@"%@", ((TreeNode *)[case1 trimBST:tree.root left:1 right:2]).data);
    NSLog(@"%@", ((TreeNode *)[case1 trimBST:[P669 getTree1].root left:1 right:3]).data);
}
@end

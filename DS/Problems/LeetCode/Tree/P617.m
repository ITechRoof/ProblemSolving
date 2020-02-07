//
//  P617.m
//  DS
//
//  Created by Kiruthika on 07/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//


// Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
//
// You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
//
// Example 1:
//
// Input:
// 	Tree 1                     Tree 2
//           1                         2
//          / \                       / \
//         3   2                     1   3
//        /                           \   \
//       5                             4   7
// Output:
// Merged tree:
// 	     3
// 	    / \
// 	   4   5
// 	  / \   \
// 	 5   4   7
//
//
// Note: The merging process must start from the root nodes of both trees.

#import "P617.h"
#import "Tree.h"

@implementation P617

- (TreeNode *)mergeTree:(TreeNode *)node1 node2:(TreeNode *)node2
{
    if(node1 == NULL && node2 == NULL)
    {
        return NULL;
    }
    if(node1 == NULL)
    {
        return node2;
    }
    if(node2 == NULL)
    {
        return node1;
    }
    TreeNode *root = [[TreeNode alloc] initWithValue:[NSNumber numberWithInteger:node1.data.integerValue + node2.data
                                                      .integerValue]];
    root.left = [self mergeTree:node1.left node2:node2.left];
    root.right = [self mergeTree:node1.right node2:node2.right];
    return root;
}

+ (Tree *)getTree1
{

  //Creating tree
  TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@3 right:@2];
  //   1
  // 3  2

  root.left.left = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];
  //          1
  //      3      2
  //   5


  Tree *tree = [[Tree alloc] initWithRoot:root];
  return tree;
}

+ (Tree *)getTree2
{

  //Creating tree
  TreeNode *root = [Tree createSubTreeWithRoot:@2 left:@1 right:@3];
  //          2
  //      1      3


  root.left.right = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
  //          2
  //      1      3
  //        4

  root.right.right = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];

  //          2
  //      1      3
  //        4       7

  Tree *tree = [[Tree alloc] initWithRoot:root];
  return tree;
}

+ (void)solution
{
    Tree *tree1 = [P617 getTree1];
    Tree *tree2 = [P617 getTree2];
    P617 *case1 = [[P617 alloc] init];
    Tree *mergeTree = [[Tree alloc] initWithRoot:[case1 mergeTree:tree1.root node2:tree2.root]];
    [mergeTree printLevelOrder];
}


@end

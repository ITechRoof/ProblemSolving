//
//  P114.m
//  DS
//
//  Created by Kiruthika on 06/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//Given a binary tree, flatten it to a linked list in-place.
//
//For example, given the following tree:
//
//    1
//   / \
//  2   5
// / \   \
//3   4   6
//The flattened tree should look like:
//
//1
// \
//  2
//   \
//    3
//     \
//      4
//       \
//        5
//         \
//          6


#import "P114.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P114

- (void)flattenTree:(TreeNode *)root
{
    if(root == NULL || (root.left == NULL && root.right == NULL))
    {
        return;
    }
    [self flattenTree:root.left];
    if(root.left != NULL)
    {
        TreeNode *temp = root.right;
        root.right = root.left;
        root.left = NULL;
        TreeNode *leaf = root.right;
        while(leaf.right != NULL)
        {
            leaf = leaf.right;
        }
        leaf.right = temp;
    }
    
    [self flattenTree:root.right];
}

+ (Tree *)getTree {

  //Creating tree
  TreeNode *root = [Tree createSubTreeWithRoot:@12 left:@13 right:@13];
  //  12
  // 13 13

  root.left.left = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
  root.left.right = [Tree createSubTreeWithRoot:@18 left:@19 right:@20];
  //          12
  //      13      13
  //   15   18
  // 16 17 19 20

  root.right.left = [Tree createSubTreeWithRoot:@18 left:@20 right:@19];
  root.right.right = [Tree createSubTreeWithRoot:@15 left:@17 right:@16];

  //            12
  //      13           13
  //   15   18      18    15
  // 16 17 19 20  20  19 17 16

  Tree *tree = [[Tree alloc] initWithRoot:root];
  return tree;
}

+ (void)solution
{
    Tree *tree = [P114 getTree];
    P114 *case1 = [[P114 alloc] init];

    [case1 flattenTree:tree.root];
    [tree printLevelOrder];
}

@end

//
//  P572.m
//  DS
//
//  Created by Kiruthika on 06/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//
//Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.
//
//Example 1:
//Given tree s:
//
//     3
//    / \
//   4   5
//  / \
// 1   2
//Given tree t:
//   4
//  / \
// 1   2
//Return true, because t has the same structure and node values with a subtree of s.
//Example 2:
//Given tree s:
//
//     3
//    / \
//   4   5
//  / \
// 1   2
//    /
//   0
//Given tree t:
//   4
//  / \
// 1   2
//Return false.

#import "P572.h"
#import "Tree.h"

@implementation P572

- (BOOL)isSameTree:(TreeNode *)treeNode1 subTreeNode:(TreeNode *)treeNode2
{
    if(treeNode1 == NULL && treeNode2 == NULL)
    {
        return YES;
    }
    if(treeNode1 == NULL || treeNode2 == NULL)
    {
        return NO;
    }
    return treeNode1.data.integerValue == treeNode2.data.integerValue && [self isSameTree:treeNode1.left subTreeNode:treeNode2.left] && [self isSameTree:treeNode1.right subTreeNode:treeNode2.right];
}
- (BOOL)isSubTreeForTree:(TreeNode *)root subTreeNode:(TreeNode *)subTreeNode
{
    if(root == NULL && subTreeNode == NULL)
    {
      return YES;
    }
    if(root == NULL)
    {
      return NO;
    }
    return [self isSameTree:root subTreeNode:subTreeNode] || [self isSubTreeForTree:root.left subTreeNode:subTreeNode] || [self isSubTreeForTree:root.right subTreeNode:subTreeNode];

}
+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@12 left:@13 right:@14];
    //  12
    // 13 14

    root.left.left = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
    root.left.right = [Tree createSubTreeWithRoot:@18 left:@19 right:@20];
    //          12
    //      13      14
    //   15   18
    // 16 17 19 20

    root.right.left = [Tree createSubTreeWithRoot:@21 left:@22 right:@23];
    root.right.right = [Tree createSubTreeWithRoot:@24 left:@25 right:@26];

    //            12
    //      13           14
    //   15   18      21    24
    // 16 17 19 20  22  23 25 26

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P572 getTree];
    P572 *case1 = [[P572 alloc] init];
    [case1 isSubTreeForTree:tree.root subTreeNode:tree.root.left] ? NSLog(@"Subtree") :   NSLog(@"Not subtree");
}

@end

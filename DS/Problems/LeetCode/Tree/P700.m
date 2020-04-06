//
//  P700.m
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/search-in-a-binary-search-tree/
//Given the root node of a binary search tree (BST) and a value. You need to find the node in the BST that the node's value equals the given value. Return the subtree rooted with that node. If such node doesn't exist, you should return NULL.
//
//For example,
//
//Given the tree:
//        4
//       / \
//      2   7
//     / \
//    1   3
//
//And the value to search: 2
//You should return this subtree:
//
//      2
//     / \
//    1   3
//In the example above, if we want to search the value 5, since there is no node with value 5, we should return NULL.
//
//Note that an empty tree is represented by NULL, therefore you wo

#import "P700.h"
#import "Tree.h"

@implementation P700
- (TreeNode *)searchBST:(TreeNode *)node value:(NSInteger)value
{
    if(node == NULL)
    {
        return NULL;
    }
    
    if(node.data.integerValue < value)
    {
        return [self searchBST:node.right value:value];
    }
    else if(node.data.integerValue > value)
    {
        return [self searchBST:node.left value:value];
    }
    else
    {
        return node;
    }
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@4 left:@2 right:@7];

    root.left.left = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P700 getTree];
    P700 *case1 = [[P700 alloc] init];

    NSLog(@"%@", [case1 searchBST:tree.root value:2]);
    NSLog(@"%@", [case1 searchBST:tree.root value:5]);
}
@end

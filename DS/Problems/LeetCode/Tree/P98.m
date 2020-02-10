//
//  P98.m
//  DS
//
//  Created by Kiruthika on 10/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//
//Given a binary tree, determine if it is a valid binary search tree (BST).
//
//Assume a BST is defined as follows:
//
//The left subtree of a node contains only nodes with keys less than the node's key.
//The right subtree of a node contains only nodes with keys greater than the node's key.
//Both the left and right subtrees must also be binary search trees.
// 
//
//Example 1:
//
//    2
//   / \
//  1   3
//
//Input: [2,1,3]
//Output: true
//Example 2:
//
//    5
//   / \
//  1   4
//     / \
//    3   6
//
//Input: [5,1,4,null,null,3,6]
//Output: false
//Explanation: The root node's value is 5 but its right child's value is 4.

#import "P98.h"
#import "Tree.h"

@implementation P98

- (BOOL)isValidBST:(TreeNode *)node min:(NSInteger)min max:(NSInteger)max
{
    if(node == NULL)
    {
        return YES;
    }
    if(node.data.integerValue < min || node.data.integerValue > max)
    {
        return NO;
    }
    return [self isValidBST:node.left min:min max:node.data.integerValue] && [self isValidBST:node.right min:node.data.integerValue max:max];
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@1 right:@7];
    //  5
    // 1 7

    root.right.left = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@9 left:NULL right:NULL];
    //    5
    // 1    7
    //     3 9
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P98 getTree];
    P98 *case1 = [[P98 alloc] init];

    [case1 isValidBST:tree.root min:NSIntegerMin max:NSIntegerMax] ? NSLog(@"Valid BST") : NSLog(@"Not valid BST");
}
@end

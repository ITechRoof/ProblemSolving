//
//  P783.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/minimum-distance-between-bst-nodes/
//Given a Binary Search Tree (BST) with the root node root, return the minimum difference between the values of any two different nodes in the tree.
//
//Example :
//
//Input: root = [4,2,6,1,3,null,null]
//Output: 1
//Explanation:
//Note that root is a TreeNode object, not an array.
//
//The given tree [4,2,6,1,3,null,null] is represented by the following diagram:
//
//          4
//        /   \
//      2      6
//     / \
//    1   3
//
//while the minimum difference in this tree is 1, it occurs between node 1 and node 2, also between node 3 and node 2.
//Note:
//
//The size of the BST will be between 2 and 100.
//The BST is always valid, each node's value is an integer, and each node's value is different.
//This question is the same as 530: https://leetcode.com/problems/minimum-absolute-difference-in-bst/

#import "P783.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P783
- (NSInteger)minDiffInBST:(TreeNode *)node
{
    StackUsingArray *s = [StackUsingArray new];
    TreeNode *temp = node;
    
    NSInteger minDiff = NSIntegerMax;
    TreeNode *prev;
    
    while (![s isEmpty] || temp) {
        while (temp != NULL) {
            [s push:temp];
            temp = temp.left;
        }
        
        temp = [s top];
        [s pop];
        
        if(prev)
        {
            minDiff = MIN(minDiff, temp.data.integerValue - prev.data.integerValue);
        }
        
        prev = temp;
        temp = temp.right;
    }
    return minDiff;
}


+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@44 left:@22 right:@70];

    
    root.left.left = [Tree createSubTreeWithRoot:@11 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@39 left:NULL right:NULL];

    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P783 getTree];
    P783 *case1 = [[P783 alloc] init];
    
    NSLog(@"%ld", (long)[case1 minDiffInBST:tree.root]);
}
@end

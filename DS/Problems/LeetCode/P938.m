//
//  P938.m
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/range-sum-of-bst/
//Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).
//
//The binary search tree is guaranteed to have unique values.
//
//
//
//Example 1:
//
//Input: root = [10,5,15,3,7,null,18], L = 7, R = 15
//Output: 32
//Example 2:
//
//Input: root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
//Output: 23
//
//
//Note:
//
//The number of nodes in the tree is at most 10000.
//The final answer is guaranteed to be less than 2^31.

#import "P938.h"
#import "Tree.h"

@implementation P938
- (NSInteger)rangeSumBST:(TreeNode *)node left:(NSInteger)left right:(NSInteger)right
{
    if(node == NULL)
    {
        return 0;
    }
    
    if(node.data.integerValue >= left && node.data.integerValue <= right)
    {
        return node.data.integerValue + [self rangeSumBST:node.left left:left right:right] + [self rangeSumBST:node.right left:left right:right];
    }
    else if(node.data.integerValue > right)
    {
        return [self rangeSumBST:node.left left:left right:right];
    }
    else
    {
        return [self rangeSumBST:node.right left:left right:right];
    }
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@10 left:@5 right:@15];
    //  10
    // 5  15

    root.left.left = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];
    
    root.right.right = [Tree createSubTreeWithRoot:@18 left:NULL right:NULL];

     //       10
    //     5    15
    //  3   7      18
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

 + (Tree *)getTree1 {

     //Creating tree
     TreeNode *root = [Tree createSubTreeWithRoot:@10 left:@5 right:@15];
     //  10
     // 5  15

     root.left.left = [Tree createSubTreeWithRoot:@3 left:@1 right:NULL];
     root.left.right = [Tree createSubTreeWithRoot:@7 left:@6 right:NULL];
     
     root.right.left = [Tree createSubTreeWithRoot:@13 left:NULL right:NULL];

     root.right.right = [Tree createSubTreeWithRoot:@18 left:NULL right:NULL];

      //       10
     //     5    15
     //  3   7      18
     
     Tree *tree = [[Tree alloc] initWithRoot:root];
     return tree;
 }
+ (void)solution
{
    Tree *tree = [P938 getTree];
    P938 *case1 = [[P938 alloc] init];

    NSLog(@"%ld", (long)[case1 rangeSumBST:tree.root left:7 right:15]);
    NSLog(@"%ld", (long)[case1 rangeSumBST:[P938 getTree1].root left:6 right:10]);

}
@end

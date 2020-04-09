//
//  P1026.m
//  DS
//
//  Created by Kiruthika on 09/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/
//Given the root of a binary tree, find the maximum value V for which there exists different nodes A and B where V = |A.val - B.val| and A is an ancestor of B.
//
//(A node A is an ancestor of B if either: any child of A is equal to B, or any child of A is an ancestor of B.)
//
//
//
//Example 1:
//
//
//
//Input: [8,3,10,1,6,null,14,null,null,4,7,13]
//Output: 7
//Explanation:
//We have various ancestor-node differences, some of which are given below :
//|8 - 3| = 5
//|3 - 7| = 4
//|8 - 1| = 7
//|10 - 13| = 3
//Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.
//
//
//Note:
//
//The number of nodes in the tree is between 2 and 5000.
//Each node will have value between 0 and 100000.


#import "P1026.h"
#import "Tree.h"

@implementation P1026
- (void)maxDiff:(TreeNode *)node max:(NSInteger *)max path:(NSMutableArray *)path
{
    if(node == NULL)
    {
        return;
    }
    
    for (TreeNode *ancestor in path) {
        *max = MAX(*max, ABS(node.data.integerValue - ancestor.data.integerValue));
    }
    
    [path addObject:node];
    
    [self maxDiff:node.left max:max path:[NSMutableArray arrayWithArray:[path copy]]];
    [self maxDiff:node.right max:max path:[NSMutableArray arrayWithArray:[path copy]]];
}
- (NSInteger)maxAncestorDiff:(TreeNode *)node
{
    NSInteger max = 0;
    [self maxDiff:node max:&max path:[NSMutableArray array]];
    return max;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@8 left:@3 right:@10];
    
    root.left.left = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@6 left:@4 right:@7];
    
    root.right.right = [Tree createSubTreeWithRoot:@14 left:@13 right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P1026 getTree];
    P1026 *case1 = [[P1026 alloc] init];
    
    NSLog(@"%ld", (long)[case1 maxAncestorDiff:tree.root]);
}
@end

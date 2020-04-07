//
//  P404.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/sum-of-left-leaves/
//Find the sum of all left leaves in a given binary tree.
//
//Example:
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//
//There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.

#import "P404.h"
#import "Tree.h"

@implementation P404
- (NSInteger)sumOfLeftLeaves:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    
    if(node.left && node.left.isLeaf)
    {
        return node.left.data.integerValue + [self sumOfLeftLeaves:node.left] + [self sumOfLeftLeaves:node.right];
    }
    
    return [self sumOfLeftLeaves:node.left] + [self sumOfLeftLeaves:node.right];
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
    Tree *tree = [P404 getTree];
    P404 *case1 = [[P404 alloc] init];
    
    NSLog(@"%ld", (long)[case1 sumOfLeftLeaves:tree.root]);
}
@end

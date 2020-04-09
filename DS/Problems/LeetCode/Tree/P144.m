//
//  P144.m
//  DS
//
//  Created by Kiruthika on 09/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/binary-tree-preorder-traversal/
//Given a binary tree, return the preorder traversal of its nodes' values.
//
//Example:
//
//Input: [1,null,2,3]
//   1
//    \
//     2
//    /
//   3
//
//Output: [1,2,3]
//Follow up: Recursive solution is trivial, could you do it iteratively?

#import "P144.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P144
- (NSArray *)preOrderTraversal:(TreeNode *)node
{
    if(node == NULL)
    {
        return @[];
    }
    
    NSMutableArray *res = [NSMutableArray array];
    
    StackUsingArray *s = [StackUsingArray new];
    [s push:node];
    
    while (![s isEmpty]) {
        
        TreeNode *temp = [s top];
        [s pop];
        
        [res addObject:temp.data];
        
        if(temp.right)
        {
            [s push:temp.right];
        }
        
        if(temp.left)
        {
            [s push:temp.left];
        }
    }
    return res;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:NULL right:@2];
    
    root.right.left = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P144 getTree];
    P144 *case1 = [[P144 alloc] init];
    NSLog(@"%@", [case1 preOrderTraversal:tree.root]);
}
@end


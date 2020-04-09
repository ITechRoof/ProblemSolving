//
//  P94.m
//  DS
//
//  Created by Kiruthika on 09/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/binary-tree-inorder-traversal/
//Given a binary tree, return the inorder traversal of its nodes' values.
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
//Output: [1,3,2]
//Follow up: Recursive solution is trivial, could you do it iteratively?

#import "P94.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P94
- (NSArray *)inOrderTraversal:(TreeNode *)node
{
    if(node == NULL)
    {
        return @[];
    }
    
    NSMutableArray *res = [NSMutableArray array];
    
    StackUsingArray *s = [StackUsingArray new];
    TreeNode *temp = node;
    while (![s isEmpty] || temp) {
        while (temp != NULL) {
            [s push:temp];
            temp = temp.left;
        }
        
        temp = [s top];
        [s pop];
        [res addObject:temp.data];
        
        temp = temp.right;
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
    Tree *tree = [P94 getTree];
    P94 *case1 = [[P94 alloc] init];
    NSLog(@"%@", [case1 inOrderTraversal:tree.root]);
}
@end

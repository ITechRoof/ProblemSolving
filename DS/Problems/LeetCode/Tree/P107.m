//
//  P107.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
//Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
//
//For example:
//Given binary tree [3,9,20,null,null,15,7],
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its bottom-up level order traversal as:
//[
//  [15,7],
//  [9,20],
//  [3]
//]

#import "P107.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P107
- (NSArray *)levelOrderBottom:(TreeNode *)node
{
    QueueUsingArray *q = [QueueUsingArray new];
    [q enqueue:node];
    
    NSMutableArray *res = [NSMutableArray array];
    
    while (![q isEmpty]) {
        NSMutableArray *levelNodes = [NSMutableArray array];
        NSInteger levelSize = [q sizeOfQueue];
        while (levelSize > 0) {
            TreeNode *front = [q dequeue];
            [levelNodes addObject:front.data];
            if(front.left)
            {
                [q enqueue:front.left];
            }
            if(front.right)
            {
                [q enqueue:front.right];
            }
            levelSize--;
        }
        [res insertObject:levelNodes atIndex:0];
    }
    return res;
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
    Tree *tree = [P107 getTree];
    P107 *case1 = [[P107 alloc] init];
    
    NSLog(@"%@", [case1 levelOrderBottom:tree.root]);
}
@end

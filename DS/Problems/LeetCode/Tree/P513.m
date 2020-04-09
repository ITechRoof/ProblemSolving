//
//  P513.m
//  DS
//
//  Created by Kiruthika on 09/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/find-bottom-left-tree-value/
//Given a binary tree, find the leftmost value in the last row of the tree.
//
//Example 1:
//Input:
//
//    2
//   / \
//  1   3
//
//Output:
//1
//Example 2:
//Input:
//
//        1
//       / \
//      2   3
//     /   / \
//    4   5   6
//       /
//      7
//
//Output:
//7
//Note: You may assume the tree (i.e., the given root node) is not NULL.

#import "P513.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P513
- (NSInteger)findBottomLeftValue:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    
    NSInteger res = 0;
    QueueUsingArray *q = [QueueUsingArray new];
    [q enqueue:node];
    
    while (![q isEmpty]) {
        NSInteger levelSize = [q sizeOfQueue];
        BOOL isLeft = YES;
        while (levelSize > 0) {
            
            TreeNode *front = [q dequeue];
            if(isLeft)
            {
                res = front.data.integerValue;
                isLeft = NO;
            }
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
    }
    
    return res;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    
    root.left.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    
    root.right.left = [Tree createSubTreeWithRoot:@5 left:@7 right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@6 left:NULL right:NULL];

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P513 getTree];
    P513 *case1 = [[P513 alloc] init];
    NSLog(@"%ld", (long)[case1 findBottomLeftValue:tree.root]);
}
@end

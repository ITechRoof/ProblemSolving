//
//  P897.m
//  DS
//
//  Created by Kiruthika on 12/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Given a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only 1 right child.
//
//Example 1:
//Input: [5,3,6,2,4,null,8,1,null,null,null,7,9]
//
//       5
//      / \
//    3    6
//   / \    \
//  2   4    8
// /        / \
//1        7   9
//
//Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]
//
// 1
//  \
//   2
//    \
//     3
//      \
//       4
//        \
//         5
//          \
//           6
//            \
//             7
//              \
//               8
//                \
//                 9
//Note:
//
//The number of nodes in the given tree will be between 1 and 100.
//Each node will have a unique integer value from 0 to 1000.

#import "P897.h"
#import "Tree.h"
#import "StackUsingArray.h"
#import "QueueUsingArray.h"

@implementation P897

//Solution 1
- (TreeNode *)increasingOrderSearchTree:(TreeNode *)node
{
    if(node == NULL)
       {
           return NULL;
       }
    QueueUsingArray *q = [[QueueUsingArray alloc] init];
    [self queueAllNodesInPreOrder:node queue:&q];
    
    TreeNode *root = [q dequeue];
    TreeNode *temp = root;
    while(![q isEmpty])
    {
        temp.right = [q dequeue];
        temp.left = NULL;
        temp = temp.right;
    }
    return root;
}

- (void)queueAllNodesInPreOrder:(TreeNode *)node queue:(QueueUsingArray **)queue
{
    if(node == NULL)
    {
        return;
    }
    [self queueAllNodesInPreOrder:node.left queue:queue];
    [*queue enqueue:node];
    [self queueAllNodesInPreOrder:node.right queue:queue];

}
//Solution 2
- (TreeNode *)increasingOrderTree:(TreeNode *)node
{
    if(node == NULL)
    {
        return NULL;
    }
    
    StackUsingArray *s = [[StackUsingArray alloc] init];
    // [s push:node];
    TreeNode *temp = node;
    TreeNode *root, *prev;
    
    while(![s isEmpty] || temp)
    {
        while(temp != NULL)
        {
            [s push:temp];
            temp = temp.left;
        }
        
        
        temp = [s top];
        [s pop];
        
        temp.left = NULL;
        prev.right = temp;
        if(!root)
        {
            root = temp;
        }
        
        prev = temp;
        temp = temp.right;
    }
    
    return root;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@3 right:@6];
    //  12
    // 13 14

    root.left.left = [Tree createSubTreeWithRoot:@2 left:@1 right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    //          12
    //      13      14
    //   15   18
    // 16 17 19 20

//    root.right.left = [Tree createSubTreeWithRoot:@21 left:@22 right:@23];
    root.right.right = [Tree createSubTreeWithRoot:@8 left:@7 right:@9];

    //            12
    //      13           14
    //   15   18      21    24
    // 16 17 19 20  22  23

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P897 getTree];
    P897 *case1 = [[P897 alloc] init];

   Tree *newTree = [[Tree alloc] initWithRoot:[case1 increasingOrderSearchTree:tree.root]];
    [newTree printLevelOrder];
}

@end

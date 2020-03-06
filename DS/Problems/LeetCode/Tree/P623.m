//
//  P623.m
//  DS
//
//  Created by Kiruthika on 05/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Given the root of a binary tree, then value v and depth d, you need to add a row of nodes with value v at the given depth d. The root node is at depth 1.
//
//The adding rule is: given a positive integer depth d, for each NOT null tree nodes N in depth d-1, create two tree nodes with value v as N's left subtree root and right subtree root. And N's original left subtree should be the left subtree of the new left subtree root, its original right subtree should be the right subtree of the new right subtree root. If depth d is 1 that means there is no depth d-1 at all, then create a tree node with value v as the new root of the whole original tree, and the original tree is the new root's left subtree.
//
//Example 1:
//Input:
//A binary tree as following:
//       4
//     /   \
//    2     6
//   / \   /
//  3   1 5
//
//v = 1
//
//d = 2
//
//Output:
//       4
//      / \
//     1   1
//    /     \
//   2       6
//  / \     /
// 3   1   5
//
//Example 2:
//Input:
//A binary tree as following:
//      4
//     /
//    2
//   / \
//  3   1
//
//v = 1
//
//d = 3
//
//Output:
//      4
//     /
//    2
//   / \
//  1   1
// /     \
//3       1
//Note:
//The given d is in range [1, maximum depth of the given tree + 1].
//The given binary tree has at least one tree node.


#import "P623.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@interface P623 ()

@property (nonatomic) Tree *tree;

@end

@implementation P623

- (void)addRowWithValue:(NSNumber *)val depth:(NSInteger)depth
{
    if(self.tree.root == NULL)
    {
        return;
    }
    
    if(depth == 1)
    {
        TreeNode *node = [[TreeNode alloc] initWithValue:val];
        node.left = self.tree.root;
        self.tree.root = node;
        return;
    }
    
    QueueUsingArray *q = [[QueueUsingArray alloc] init];
    [q enqueue:self.tree.root];
    
    NSInteger currentDepth = 1;
    
    while(![q isEmpty])
    {
        NSInteger nodeCount = [q sizeOfQueue];
        
        while (nodeCount > 0) {
            TreeNode *temp = [q dequeue];
            nodeCount--;
            if(currentDepth == depth - 1)
            {
                if(temp.left)
                {
                    TreeNode *node = [[TreeNode alloc] initWithValue:val];
                    node.left = temp.left;
                    node.right = NULL;
                    temp.left = node;
                }
                if(temp.right)
                {
                    TreeNode *node = [[TreeNode alloc] initWithValue:val];
                    node.left = NULL;
                    node.right = temp.right;
                    temp.right = node;
                }
            }
            else
            {
                if(temp.left)
                {
                    [q enqueue:temp.left];
                }
                if(temp.right)
                {
                    [q enqueue:temp.right];
                }
            }
        }
        currentDepth++;
    }
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@4 left:@2 right:@6];
    //  4
    // 2 6

    root.left.left = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    //  4
    // 2 6
    //3 1


    root.right.left = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];
//    root.right.right = [Tree createSubTreeWithRoot:@24 left:@25 right:@26];

    //    4
    // 2    6
    //3 1  5
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    P623 *case1 = [[P623 alloc] init];
    case1.tree = [P623 getTree];
    [case1 addRowWithValue:@1 depth:2];
    
    [case1.tree printLevelOrder];
}

@end

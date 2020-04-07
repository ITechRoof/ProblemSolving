//
//  P671.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/second-minimum-node-in-a-binary-tree/
//Given a non-empty special binary tree consisting of nodes with the non-negative value, where each node in this tree has exactly two or zero sub-node. If the node has two sub-nodes, then this node's value is the smaller value among its two sub-nodes. More formally, the property root.val = min(root.left.val, root.right.val) always holds.
//
//Given such a binary tree, you need to output the second minimum value in the set made of all the nodes' value in the whole tree.
//
//If no such second minimum value exists, output -1 instead.
//
//Example 1:
//
//Input:
//    2
//   / \
//  2   5
//     / \
//    5   7
//
//Output: 5
//Explanation: The smallest value is 2, the second smallest value is 5.
//
//
//Example 2:
//
//Input:
//    2
//   / \
//  2   2
//
//Output: -1
//Explanation: The smallest value is 2, but there isn't any second smallest value.

#import "P671.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P671
//Solution 1
- (NSInteger)findSecondMinimumValue:(TreeNode *)node min:(NSInteger)min ans:(NSInteger)ans
{
    if(node == NULL)
    {
        return -1;
    }
    
    if(min < node.data.integerValue && ans > node.data.integerValue)
    {
        return node.data.integerValue;
    }
    else
    {
        NSInteger left = [self findSecondMinimumValue:node.left min:min ans:ans];
        NSInteger right = [self findSecondMinimumValue:node.right min:min ans:ans];
        
        if(left != -1 && right != -1)
        {
            return MIN(left, right);
        }
        else if(left == -1)
        {
            return right;
        }
        else
        {
            return left;
        }
    }
}

//Solution 2
- (NSInteger)findSecondMinimumValue:(TreeNode *)node
{
    QueueUsingArray *q = [QueueUsingArray new];
    [q enqueue:node];
    
    NSInteger min = NSIntegerMax;
    
    while (![q isEmpty]) {
        NSInteger levelSize = [q sizeOfQueue];
        
        
        while (levelSize > 0) {
            
            TreeNode *front = [q dequeue];
            
            if(front.data.integerValue != node.data.integerValue)
            {
                min = MIN(min, front.data.integerValue);
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
        if(min != NSIntegerMax)
        {
            return min;
        }
    }
    return -1;
}
+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@2 left:@2 right:@5];

    root.right.left = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P671 getTree];
    P671 *case1 = [[P671 alloc] init];
    
    NSLog(@"%ld", (long)[case1 findSecondMinimumValue:tree.root min:tree.root.data.integerValue ans:NSIntegerMax]);
    NSLog(@"%ld", (long)[case1 findSecondMinimumValue:tree.root]);
}
@end

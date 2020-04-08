//
//  P1302.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/deepest-leaves-sum/
//Given a binary tree, return the sum of values of its deepest leaves.
// 
//
//Example 1:
//
//
//
//Input: root = [1,2,3,4,5,null,6,7,null,null,null,null,8]
//Output: 15
// 
//
//Constraints:
//
//The number of nodes in the tree is between 1 and 10^4.
//The value of nodes is between 1 and 100.

#import "P1302.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P1302
- (NSInteger)deepestLeavesSum:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    
    QueueUsingArray *q = [[QueueUsingArray alloc] init];
    [q enqueue:node];
    
    NSInteger result = 0;
    while (![q isEmpty]) {
        NSInteger levelSize = [q sizeOfQueue], levelSum = 0;
        while (levelSize > 0) {
            TreeNode *front = [q dequeue];
            if(front.isLeaf)
            {
                levelSum = levelSum + front.data.integerValue;
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
        result = levelSum;
    }
    return result;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    
    root.left.left = [Tree createSubTreeWithRoot:@4 left:@7 right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];
    
    root.right.right = [Tree createSubTreeWithRoot:@6 left:NULL right:@8];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P1302 getTree];
    P1302 *case1 = [[P1302 alloc] init];
    
    NSLog(@"%ld", (long)[case1 deepestLeavesSum:tree.root]);
}
@end


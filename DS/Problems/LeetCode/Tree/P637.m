//
//  P637.m
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/average-of-levels-in-binary-tree/
//Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
//Example 1:
//Input:
//    3
//   / \
//  9  20
//    /  \
//   15   7
//Output: [3, 14.5, 11]
//Explanation:
//The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
//Note:
//The range of node's value is in the range of 32-bit signed integer.

#import "P637.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P637
- (NSArray *)averageOfLevels:(TreeNode *)node
{
    QueueUsingArray *q = [[QueueUsingArray alloc] init];
    [q enqueue:node];
    
    NSMutableArray *res = [NSMutableArray array];
    
    while (![q isEmpty]) {
        NSInteger size = [q sizeOfQueue];
        float sum = 0, currentSize = size;
        while (currentSize > 0) {
            TreeNode *front = [q dequeue];
            if(front.left)
            {
                [q enqueue:front.left];
            }
            if(front.right)
            {
                [q enqueue:front.right];
            }
            sum = sum + front.data.integerValue;
            currentSize--;
        }
        float avg = sum / size;
        [res addObject:[NSNumber numberWithFloat:avg]];
    }
    return res;
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@3 left:@9 right:@20];
    
    root.right.left = [Tree createSubTreeWithRoot:@15 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P637 getTree];
    P637 *case1 = [[P637 alloc] init];

    NSLog(@"%@", [case1 averageOfLevels:tree.root]);
}
@end

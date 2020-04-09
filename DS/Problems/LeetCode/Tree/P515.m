//
//  P515.m
//  DS
//
//  Created by Kiruthika on 09/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/find-largest-value-in-each-tree-row/
//You need to find the largest value in each row of a binary tree.
//
//Example:
//Input:
//
//          1
//         / \
//        3   2
//       / \   \
//      5   3   9
//
//Output: [1, 3, 9]

#import "P515.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P515
- (NSArray *)largestValues:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    
    NSMutableArray *res = [NSMutableArray array];
    QueueUsingArray *q = [QueueUsingArray new];
    [q enqueue:node];
    
    while (![q isEmpty]) {
        NSInteger levelSize = [q sizeOfQueue];
        NSNumber *max = [NSNumber numberWithInteger:NSIntegerMin];
        
        while (levelSize > 0) {
            
            TreeNode *front = [q dequeue];
            if(max.integerValue < front.data.integerValue)
            {
                max = front.data;
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
        [res addObject:max];
    }
    
    return res;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@3 right:@2];
    
    root.left.left = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
    
    root.right.right = [Tree createSubTreeWithRoot:@9 left:NULL right:NULL];

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P515 getTree];
    P515 *case1 = [[P515 alloc] init];
    NSLog(@"%@", [case1 largestValues:tree.root]);
}
@end


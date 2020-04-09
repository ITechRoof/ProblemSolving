//
//  P429.m
//  DS
//
//  Created by Kiruthika on 09/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/n-ary-tree-level-order-traversal/
//Given an n-ary tree, return the level order traversal of its nodes' values.
//
//Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).
//
//
//
//Example 1:
//
//
//
//Input: root = [1,null,3,2,4,null,5,6]
//Output: [[1],[3,2,4],[5,6]]
//Example 2:
//
//
//
//Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
//Output: [[1],[2,3,4,5],[6,7,8,9,10],[11,12,13],[14]]
//
//
//Constraints:
//
//The height of the n-ary tree is less than or equal to 1000
//The total number of nodes is between [0, 10^4]

#import "P429.h"
#import "NaryTree.h"
#import "QueueUsingArray.h"

@implementation P429

- (void)printLevelOrder:(NaryNode *)node
{
    if(node == NULL)
    {
        return;
    }
    QueueUsingArray *q = [QueueUsingArray new];
    [q enqueue:node];
    
    while (![q isEmpty]) {
        NSInteger levelSize = [q sizeOfQueue];
        NSMutableArray *levelNodes = [NSMutableArray array];
        while (levelSize > 0) {
            NaryNode *front = [q dequeue];
            [levelNodes addObject:front.data];

            for (NaryNode *child in front.children) {
                [q enqueue:child];
            }
            levelSize--;
        }
        NSLog(@"%@", levelNodes);
    }

}

//+ (NaryNode *)getTree
//{
//    NaryNode *root = [NaryTree createSubTreeWithRoot:@1 childern:@[@3, @2, @4]];
//
//    root.children[0].children =@[[NaryTree createSubTreeWithRoot:@5 childern:nil], [NaryTree createSubTreeWithRoot:@6 childern:nil]];
//
//    return root;
//}
+ (NaryNode *)getTree
{
    NaryNode *root = [NaryTree createSubTreeWithRoot:@1 childern:@[@2, @3, @4, @5]];

    root.children[1].children =@[[NaryTree createSubTreeWithRoot:@6 childern:nil], [NaryTree createSubTreeWithRoot:@7 childernNodes:@[[NaryTree createSubTreeWithRoot:@11 childernNodes:@[[NaryTree createSubTreeWithRoot:@14 childernNodes:nil]]]]]];
    root.children[2].children =@[[NaryTree createSubTreeWithRoot:@8 childernNodes:@[[NaryTree createSubTreeWithRoot:@12 childernNodes:nil]]]];
    root.children[3].children =@[[NaryTree createSubTreeWithRoot:@9 childernNodes:@[[NaryTree createSubTreeWithRoot:@13 childernNodes:nil]]], [NaryTree createSubTreeWithRoot:@10 childern:nil]];

    return root;
}

+ (void)solution
{
    NaryNode *root = [P429 getTree];
    P429 *case1 = [[P429 alloc] init];
    [case1 printLevelOrder:root];
}
@end

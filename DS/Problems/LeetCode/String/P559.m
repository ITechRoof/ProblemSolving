//
//  P559.m
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/maximum-depth-of-n-ary-tree/
//Given a n-ary tree, find its maximum depth.
//
//The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
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
//Output: 3
//Example 2:
//
//
//
//Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
//Output: 5
//
//
//Constraints:
//
//The depth of the n-ary tree is less than or equal to 1000.
//The total number of nodes is between [0, 10^4].

#import "P559.h"
#import "NaryTree.h"

@implementation P559
- (NSInteger)maxDepth:(NaryNode *)node
{
    if(node.children.count == 0)
    {
        return 1;
    }
    NSInteger max = 0;
    for (NaryNode *child in node.children) {
        max = MAX(max, [self maxDepth:child]);
    }
    return max + 1;
}
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
    NaryNode *root = [P559 getTree];
    P559 *case1 = [[P559 alloc] init];
    NSLog(@"%ld", (long)[case1 maxDepth:root]);
}
@end

//
//  P589.m
//  DS
//
//  Created by Kiruthika on 12/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//


//Given an n-ary tree, return the preorder traversal of its nodes' values.
//
//Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).
//
// 
//
//Follow up:
//
//Recursive solution is trivial, could you do it iteratively?
//
// 
//
//Example 1:
//
//
//
//Input: root = [1,null,3,2,4,null,5,6]
//Output: [1,3,5,6,2,4]
//Example 2:
//
//
//
//Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
//Output: [1,2,3,6,7,11,14,4,8,12,5,9,13,10]
// 
//
//Constraints:
//
//The height of the n-ary tree is less than or equal to 1000
//The total number of nodes is between [0, 10^4]

#import "P589.h"
#import "NaryTree.h"

@implementation P589

- (void)printPreOrder:(NaryNode *)node
{
    NSLog(@"%ld", (long)node.data.integerValue);
    
    for (NaryNode *child in node.children) {
        [self printPreOrder:child];
    }
}

//+ (NaryNode *)getTree
//{
//    NaryNode *root = [NaryTree createSubTreeWithRoot:@1 childer:@[@3, @2, @4]];
//
//    root.children[0].children =@[[NaryTree createSubTreeWithRoot:@5 childer:nil], [NaryTree createSubTreeWithRoot:@6 childer:nil]];
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
    NaryNode *root = [P589 getTree];
    
    P589 *case1 = [[P589 alloc] init];
    
    [case1 printPreOrder:root];
}

@end

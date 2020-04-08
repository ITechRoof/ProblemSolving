//
//  P1305.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/all-elements-in-two-binary-search-trees/
//Given two binary search trees root1 and root2.
//
//Return a list containing all the integers from both trees sorted in ascending order.
//
//
//
//Example 1:
//
//
//Input: root1 = [2,1,4], root2 = [1,0,3]
//Output: [0,1,1,2,3,4]
//Example 2:
//
//Input: root1 = [0,-10,10], root2 = [5,1,7,0,2]
//Output: [-10,0,0,1,2,5,7,10]
//Example 3:
//
//Input: root1 = [], root2 = [5,1,7,0,2]
//Output: [0,1,2,5,7]
//Example 4:
//
//Input: root1 = [0,-10,10], root2 = []
//Output: [-10,0,10]
//Example 5:
//
//
//Input: root1 = [1,null,8], root2 = [8,1]
//Output: [1,1,8,8]
//
//
//Constraints:
//
//Each tree has at most 5000 nodes.
//Each node's value is between [-10^5, 10^5].

#import "P1305.h"
#import "Tree.h"

@implementation P1305
- (void)dfs:(TreeNode *)node inorder:(NSMutableArray **)arr
{
    if(node == NULL)
    {
        return;
    }
    [self dfs:node.left inorder:arr];
    [*arr addObject:node];
    [self dfs:node.right inorder:arr];
}

- (NSArray *)getAllElements:(TreeNode *)node1 node:(TreeNode *)node2
{
    NSMutableArray<TreeNode *> *node1Elements = [NSMutableArray array];
    [self dfs:node1 inorder:&node1Elements];
    
    NSMutableArray<TreeNode *> *node2Elements = [NSMutableArray array];
    [self dfs:node2 inorder:&node2Elements];
    
    NSMutableArray *res = [NSMutableArray array];
    
    NSInteger i = 0, j = 0;
    while (i < node1Elements.count && j < node2Elements.count) {
        if(node1Elements[i].data.integerValue < node2Elements[j].data.integerValue)
        {
            [res addObject:node1Elements[i].data];
            i++;
        }
        else
        {
            [res addObject:node2Elements[j].data];
            j++;
        }
    }
    
    while (i < node1Elements.count) {
        [res addObject:node1Elements[i].data];
        i++;
    }
    
    while (j < node2Elements.count) {
        [res addObject:node2Elements[j].data];
        j++;
    }
    
    return res;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@2 left:@1 right:@4];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (Tree *)getTree1
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@0 right:@3];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    P1305 *case1 = [[P1305 alloc] init];
    NSLog(@"%@", [case1 getAllElements:[P1305 getTree].root node:[P1305 getTree1].root]);
}
@end

//
//  P257.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/binary-tree-paths/
//Given a binary tree, return all root-to-leaf paths.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Input:
//
//   1
// /   \
//2     3
// \
//  5
//
//Output: ["1->2->5", "1->3"]
//
//Explanation: All root-to-leaf paths are: 1->2->5, 1->3

#import "P257.h"
#import "Tree.h"

@implementation P257
- (NSArray *)binaryTreePaths:(TreeNode *)node
{
    NSMutableArray *res = [NSMutableArray array];
    [self pathToLeaf:node path:@"" res:&res];
    return res;
}
- (void)pathToLeaf:(TreeNode *)node path:(NSString *)path res:(NSMutableArray **)res
{
    if(node == NULL)
    {
        return;
    }
    if(node.isLeaf)
    {
        path = [path stringByAppendingFormat:@"%@", node.data];
        [*res addObject:path];
        return;
    }
    
    path = [path stringByAppendingFormat:@"%@->", node.data];
    [self pathToLeaf:node.left path:path res:res];
    [self pathToLeaf:node.right path:path res:res];
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];

    root.left.right = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];

    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P257 getTree];
    P257 *case1 = [[P257 alloc] init];
    
    NSLog(@"%@", (long)[case1 binaryTreePaths:tree.root]);
}
@end

//
//  P222.m
//  DS
//
//  Created by Kiruthika on 11/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Given a complete binary tree, count the number of nodes.
//
//Note:
//
//Definition of a complete binary tree from Wikipedia:
//In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
//
//Example:
//
//Input:
//    1
//   / \
//  2   3
// / \  /
//4  5 6
//
//Output: 6

#import "P222.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P222

- (NSInteger)leftHeight:(TreeNode *)node
{
    NSInteger height = 0;
    while(node != NULL)
    {
        node = node.left;
        height++;
    }
    return height;
}
- (NSInteger)rightHeight:(TreeNode *)node
{
    NSInteger height = 0;
    while(node != NULL)
    {
        node = node.right;
        height++;
    }
    return height;
}

- (NSInteger)countCompleteTreeNode:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    NSInteger leftHeight = [self leftHeight:node];
    NSInteger rightHeight = [self rightHeight:node];
    
    if(leftHeight == rightHeight)
    {
        return pow(2, leftHeight) - 1;
    }
    
    return [self countCompleteTreeNode:node.left] + [self countCompleteTreeNode:node.right] + 1;
}

+ (Tree *)getTree
{
    
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@12 left:@13 right:@14];
    //  12
    // 13 14
    
    root.left.left = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
    root.left.right = [Tree createSubTreeWithRoot:@18 left:@19 right:@20];
    //          12
    //      13      14
    //   15   18
    // 16 17 19 20
    
    root.right.left = [Tree createSubTreeWithRoot:@21 left:@22 right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@24 left:NULL right:NULL];
    
    //            12
    //      13           14
    //   15   18      21    24
    // 16 17 19 20  22  23
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P222 getTree];
    P222 *case1 = [[P222 alloc] init];
    
    NSLog(@"%ld", (long)[case1 countCompleteTreeNode:tree.root]);
}

@end

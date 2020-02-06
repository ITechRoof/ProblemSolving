//
//  P226.m
//  DS
//
//  Created by Kiruthika on 06/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P226.h"
#import "Tree.h"

@implementation P226

- (void)invertTree:(TreeNode *)node
{
    if(node == NULL)
    {
        return;
    }
    TreeNode *temp = node.left;
    node.left = node.right;
    node.right = temp;
    [self invertTree:node.left];
    [self invertTree:node.right];
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
    
    root.right.left = [Tree createSubTreeWithRoot:@21 left:@22 right:@23];
    root.right.right = [Tree createSubTreeWithRoot:@24 left:@25 right:@26];
    
    //            12
    //      13           14
    //   15   18      21    24
    // 16 17 19 20  22  23 25 26
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P226 getTree];
    P226 *case1 = [[P226 alloc] init];
    [case1 invertTree:tree.root];
    [tree printLevelOrder];
}

@end

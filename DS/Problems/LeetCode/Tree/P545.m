//
//  P545.m
//  DS
//
//  Created by Kiruthika on 14/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P545.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P545

- (void)printBoundary:(TreeNode *)node
{
    [self printLeftView:node];
    [self printLeaves:node];
    [self printRightView:node];
}

- (void)printLeftView:(TreeNode *)node
{
    TreeNode *temp = node;
    
    while(temp)
    {
        while(temp.left != NULL)
        {
            NSLog(@"%ld", (long)temp.data.integerValue);
            temp = temp.left;
        }
        
        if(![temp isLeaf])
        {
            NSLog(@"%ld", (long)temp.data.integerValue);
        }
        
        temp = temp.right;
    }
}

- (void)printRightView:(TreeNode *)node
{
    StackUsingArray *s = [[StackUsingArray alloc] init];
    
    TreeNode *temp = node;
    while(temp)
    {
        while(temp.right != NULL)
        {
            [s push:temp];
            temp = temp.right;
        }
        [s push:temp];
        
        temp = temp.left;
    }
    temp = [s top];
    [s pop];
    
    while(![s isEmpty])
    {
        if(![temp isLeaf])
        {
            NSLog(@"%ld", (long)temp.data.integerValue);
        }
        temp = [s top];
        [s pop];
    }
}

- (void)printLeaves:(TreeNode *)node
{
    if(node == NULL)
    {
        return;
    }
    
    if([node isLeaf])
    {
        NSLog(@"%ld", (long)node.data.integerValue);
    }
    [self printLeaves:node.left];
    [self printLeaves:node.right];
}

+ (Tree *)getTree
{
    //    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@10 right:@10];
    //
    //    root.right.left = [Tree createSubTreeWithRoot:@2 left:NULL right:NULL];
    //    root.right.right = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
    
    
    TreeNode *root = [Tree createSubTreeWithRoot:@20 left:@8 right:@22];
    
    root.left.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@12 left:@10 right:@14];
    
    root.right.right = [Tree createSubTreeWithRoot:@25 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    P545 *case1 = [[P545 alloc] init];
    Tree *tree = [P545 getTree];
    [case1 printBoundary:tree.root];
}
@end

//
//  P872.m
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/leaf-similar-trees/
//Consider all the leaves of a binary tree.  From left to right order, the values of those leaves form a leaf value sequence.
//
//
//
//For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).
//
//Two binary trees are considered leaf-similar if their leaf value sequence is the same.
//
//Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.
//
//
//
//Constraints:
//
//Both of the given trees will have between 1 and 200 nodes.
//Both of the given trees will have values between 0 and 200

#import "P872.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P872

- (BOOL)leafSimilar:(TreeNode *)root1 root2:(TreeNode *)root2
{
    NSMutableArray <TreeNode *>*leaves = [NSMutableArray array];
    
    StackUsingArray *s = [[StackUsingArray alloc] init];
    
    TreeNode *temp = root1;
    
    while (![s isEmpty] || temp) {
        
        while (temp != NULL) {
            [s push:temp];
            temp = temp.left;
        }
        
        temp = [s top];
        [s pop];
        
        if(temp.isLeaf)
        {
            [leaves addObject:temp];
        }
        
        temp = temp.right;
    }
    
    temp = root2;
    NSInteger idx = 0;
    
    while (![s isEmpty] || temp) {
        
        while (temp != NULL) {
            [s push:temp];
            temp = temp.left;
        }
        
        temp = [s top];
        [s pop];
        
        if(temp.isLeaf)
        {
            if(temp.data.integerValue != leaves[idx].data.integerValue)
            {
                return NO;
            }
            idx++;
        }
        
        temp = temp.right;
    }
    return YES;
}

+ (Tree *)getTree1 {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@3 left:@5 right:@1];

    root.left.left = [Tree createSubTreeWithRoot:@6 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@2 left:@7 right:@4];
    
    root.right.left = [Tree createSubTreeWithRoot:@9 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@8 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (Tree *)getTree2 {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@3 left:@5 right:@1];

    root.left.left = [Tree createSubTreeWithRoot:@6 left:@6 right:@7];
    root.left.right = [Tree createSubTreeWithRoot:@2 left:@4 right:NULL];
    
    root.right.left = [Tree createSubTreeWithRoot:@9 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@8 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree1 = [P872 getTree1];
    Tree *tree2 = [P872 getTree2];

    P872 *case1 = [[P872 alloc] init];
    [case1 leafSimilar:tree1.root root2:tree2.root] ? NSLog(@"Similar") : NSLog(@"Not Similar");
}
@end

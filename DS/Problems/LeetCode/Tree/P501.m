//
//  P501.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/find-mode-in-binary-search-tree/
//Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.
//
//Assume a BST is defined as follows:
//
//The left subtree of a node contains only nodes with keys less than or equal to the node's key.
//The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
//Both the left and right subtrees must also be binary search trees.
//
//
//For example:
//Given BST [1,null,2,2],
//
//   1
//    \
//     2
//    /
//   2
//
//
//return [2].
//
//Note: If a tree has more than one mode, you can return them in any order.
//
//Follow up: Could you do that without using any extra space? (Assume that the implicit stack space incurred due to recursion does not count).

#import "P501.h"
#import "Tree.h"

@interface P501()

@property (nonatomic) TreeNode *prev;
@property (nonatomic) NSInteger currentCount;
@property (nonatomic) NSInteger maxCount;
@property (nonatomic) NSMutableSet *modeSet;

@end

@implementation P501
- (void)findMode:(TreeNode *)node
{
    if(node == NULL)
    {
        return;
    }
    
    [self findMode:node.left];
    
    if(self.prev)
    {
        if(self.prev.data.integerValue == node.data.integerValue)
        {
            self.currentCount++;
        }
        else
        {
            self.currentCount = 1;
        }
    }
    
    if(self.currentCount == self.maxCount)
    {
        [self.modeSet addObject:node.data];
    }
    else if(self.currentCount > self.maxCount)
    {
        self.maxCount = self.currentCount;
        [self.modeSet removeAllObjects];
        [self.modeSet addObject:node.data];
    }
    self.prev = node;
    
    [self findMode:node.right];
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:NULL right:@2];
    
    root.right.left = [Tree createSubTreeWithRoot:@2 left:NULL right:NULL];
        
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P501 getTree];
    P501 *case1 = [[P501 alloc] init];
    
    case1.modeSet = [NSMutableSet set];
    
    [case1 findMode:tree.root];
    NSLog(@"%@", case1.modeSet);
}
@end

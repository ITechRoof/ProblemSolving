//
//  P701.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/insert-into-a-binary-search-tree/
//Given the root node of a binary search tree (BST) and a value to be inserted into the tree, insert the value into the BST. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.
//
//Note that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.
//
//For example,
//
//Given the tree:
//        4
//       / \
//      2   7
//     / \
//    1   3
//And the value to insert: 5
//You can return this binary search tree:
//
//         4
//       /   \
//      2     7
//     / \   /
//    1   3 5
//This tree is also valid:
//
//         5
//       /   \
//      2     7
//     / \
//    1   3
//         \
//          4


#import "P701.h"
#import "Tree.h"

@implementation P701
- (TreeNode *)insertIntoBST:(TreeNode *)node val:(NSInteger)val
{
    if(node == NULL)
    {
        TreeNode *newNode = [TreeNode new];
        newNode.data = [NSNumber numberWithInteger:val];
        return newNode;
    }
    
    if(node.data.integerValue > val)
    {
        node.left = [self insertIntoBST:node.left val: val];
    }
    else
    {
        node.right = [self insertIntoBST:node.right val: val];
    }
    return node;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@4 left:@2 right:@7];
    
    root.left.left = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
        
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P701 getTree];
    P701 *case1 = [[P701 alloc] init];
    
    NSLog(@"%@", ((TreeNode *)[case1 insertIntoBST:tree.root val:5]).data);
}
@end



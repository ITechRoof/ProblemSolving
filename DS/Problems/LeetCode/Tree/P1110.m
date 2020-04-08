//
//  P1110.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/delete-nodes-and-return-forest/
//Given the root of a binary tree, each node in the tree has a distinct value.
//
//After deleting all nodes with a value in to_delete, we are left with a forest (a disjoint union of trees).
//
//Return the roots of the trees in the remaining forest.  You may return the result in any order.
//
// 
//
//Example 1:
//
//
//
//Input: root = [1,2,3,4,5,6,7], to_delete = [3,5]
//Output: [[1,2,null,4],[6],[7]]
// 
//
//Constraints:
//
//The number of nodes in the given tree is at most 1000.
//Each node has a distinct value between 1 and 1000.
//to_delete.length <= 1000
//to_delete contains distinct values between 1 and 1000.

#import "P1110.h"
#import "Tree.h"

@implementation P1110
- (NSArray *)delNodesHelper:(TreeNode *)node val:(NSArray *)valArr
{
    if(node == NULL)
    {
        return @[];
    }
    
    NSMutableArray *res = [NSMutableArray array];
    
    if([valArr containsObject:node.left.data])
    {
        if(node.left.left)
        {
            [res addObject:node.left.left];
        }
        if(node.left.right)
        {
            [res addObject:node.left.right];
        }
        node.left = NULL;
    }
    
    if([valArr containsObject:node.right.data])
    {
        if(node.right.left)
        {
            [res addObject:node.right.left];
        }
        if(node.right.right)
        {
            [res addObject:node.right.right];
        }
        node.right = NULL;
    }
    
    NSArray *left = [self delNodesHelper:node.left val:valArr];
    NSArray *right = [self delNodesHelper:node.right val:valArr];
    
    [res addObjectsFromArray:left];
    [res addObjectsFromArray:right];
    
    return res;
}
- (NSArray *)delNodes:(TreeNode *)node val:(NSArray *)valArr
{
    if(node == NULL)
    {
        return @[];
    }
    
    NSMutableArray *res = [NSMutableArray arrayWithArray:[self delNodesHelper:node val:valArr]];
    
    if([valArr containsObject:node.data])
    {
        if(node.left)
        {
            [res addObject:node.left];
        }
        if(node.right)
        {
            [res addObject:node.right];
        }
    }
    else
    {
        [res addObject:node];
    }
    
    return res;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    
    root.left.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];

    root.right.left = [Tree createSubTreeWithRoot:@6 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P1110 getTree];
    P1110 *case1 = [[P1110 alloc] init];
    
    NSLog(@"%@", [case1 delNodes:tree.root val:@[@3, @5]]);
}
@end




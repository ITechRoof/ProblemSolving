//
//  P653.m
//  DS
//
//  Created by Kiruthika on 07/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/two-sum-iv-input-is-a-bst/
//Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.
//
//Example 1:
//
//Input:
//    5
//   / \
//  3   6
// / \   \
//2   4   7
//
//Target = 9
//
//Output: True
//
//
//Example 2:
//
//Input:
//    5
//   / \
//  3   6
// / \   \
//2   4   7
//
//Target = 28
//
//Output: False

#import "P653.h"
#import "Tree.h"

@implementation P653
- (BOOL)findTarget:(TreeNode *)node target:(NSInteger)T set:(NSMutableSet *)set
{
    if(node == NULL)
    {
        return NO;
    }
    if(node.data.integerValue == T)
    {
        return YES;
    }
    
    if([set containsObject:node.data])
    {
        return YES;
    }
    [set addObject:[NSNumber numberWithInteger:T - node.data.integerValue]];
    
    return [self findTarget:node.left target:T set:set] || [self findTarget:node.right target:T set:set];
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@3 right:@6];

    root.left.left = [Tree createSubTreeWithRoot:@2 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    
    root.right.left = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P653 getTree];

    P653 *case1 = [[P653 alloc] init];
    [case1 findTarget:tree.root target:9 set:[NSMutableSet set]] ? NSLog(@"Found") : NSLog(@"Not Found");
    [case1 findTarget:tree.root target:28 set:[NSMutableSet set]] ? NSLog(@"Found") : NSLog(@"Not Found");
}
@end

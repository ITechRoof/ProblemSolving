//
//  P814.m
//  DS
//
//  Created by Kiruthika on 06/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//We are given the head node root of a binary tree, where additionally every node's value is either a 0 or a 1.
//
//Return the same tree where every subtree (of the given tree) not containing a 1 has been removed.
//
//(Recall that the subtree of a node X is X, plus every node that is a descendant of X.)
//
//Example 1:
//Input: [1,null,0,0,1]
//Output: [1,null,0,null,1]
// 
//Explanation:
//Only the red nodes satisfy the property "every subtree not containing a 1".
//The diagram on the right represents the answer.
//
//
//Example 2:
//Input: [1,0,1,0,0,0,1]
//Output: [1,null,1,null,1]
//
//
//
//Example 3:
//Input: [1,1,0,1,1,0,1,0]
//Output: [1,1,0,1,1,null,1]
//
//
//
//Note:
//
//The binary tree will have at most 100 nodes.
//The value of each node will only be 0 or 1.


#import "P814.h"
#import "Tree.h"

@implementation P814

- (TreeNode *)pruneNode:(TreeNode *)node containsValue:(BOOL *)containsValue
{
    if(node == NULL)
    {
        *containsValue = YES;
        return NULL;
    }
    else if(node.left == NULL && node.right == NULL)
    {
        if(node.data.integerValue == 0)
        {
            *containsValue = NO;
            return NULL;
        }
        else
        {
            *containsValue = YES;
            return node;
        }
        
        
    }
    BOOL leftContains = NO;
    BOOL rightContains = NO;
    
    node.left = [self pruneNode:node.left containsValue:&leftContains];
    node.right = [self pruneNode:node.right containsValue:&rightContains];
    
    if((leftContains || rightContains) || node.data.integerValue != 0)
    {
        *containsValue = YES;
        return node;
    }else
    {
        *containsValue = NO;
        return NULL;
    }
}

+ (Tree *)getTree {
    
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@0 right:@0];
    //  1
    // 0   0
    
    root.left.left = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    root.right.left = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    
    //  1
    // 0     0
    // 0 0    0   1
    //
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P814 getTree];
    P814 *case1 = [[P814 alloc] init];
    BOOL containsValue = NO;
    
    tree.root = [case1 pruneNode:tree.root containsValue:&containsValue];
    [tree printLevelOrder];
}
@end

//
//  P1008.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/
//Return the root node of a binary search tree that matches the given preorder traversal.
//
//(Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)
//
//
//
//Example 1:
//
//Input: [8,5,1,7,10,12]
//Output: [8,5,10,1,7,null,12]
//
// 
//
//Note:
//
//1 <= preorder.length <= 100
//The values of preorder are distinct.

#import "P1008.h"
#import "Tree.h"

@implementation P1008

- (TreeNode *)bstFromPreorder:(NSArray *)preorder
{
    if(preorder.count == 0)
    {
        return NULL;
    }
    
    TreeNode *node = [TreeNode new];
    node.data = preorder.firstObject;
    
    BOOL isLeft = YES;
    NSMutableArray *left = [NSMutableArray array];
    NSMutableArray *right = [NSMutableArray array];

    for (NSNumber *num in [preorder subarrayWithRange:NSMakeRange(1, preorder.count - 1)]) {
        
        if(num.integerValue > node.data.integerValue)
        {
            isLeft = NO;
        }
        if(isLeft)
        {
            [left addObject:num];
        }
        else
        {
            [right addObject:num];
        }
    }
    
    node.left = [self bstFromPreorder:left];
    node.right = [self bstFromPreorder:right];
    
    return node;
}

+ (void)solution
{
    P1008 *case1 = [[P1008 alloc] init];
    
    Tree *tree = [[Tree alloc] initWithRoot:[case1 bstFromPreorder:@[@8,@5,@1,@7,@10,@12]]];
    [tree printLevelOrder];
}
@end

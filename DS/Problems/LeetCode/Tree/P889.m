//
//  P889.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/
//Return any binary tree that matches the given preorder and postorder traversals.
//
//Values in the traversals pre and post are distinct positive integers.
//
//
//
//Example 1:
//
//Input: pre = [1,2,4,5,3,6,7], post = [4,5,2,6,7,3,1]
//Output: [1,2,3,4,5,6,7]
//
//
//Note:
//
//1 <= pre.length == post.length <= 30
//pre[] and post[] are both permutations of 1, 2, ..., pre.length.
//It is guaranteed an answer exists. If there exists multiple answers, you can return any of them.

#import "P889.h"
#import "Tree.h"

@implementation P889
- (TreeNode *)constructFromPrePost:(NSArray<NSNumber *> *)pre post:(NSArray<NSNumber *> *)post
{
    if(pre.count == 0)
    {
        return NULL;
    }
    TreeNode *node = [[TreeNode alloc] initWithValue:pre.firstObject];
    
    if(pre.count > 1)
    {
        NSNumber *leftParent = [pre objectAtIndex:1];
        NSInteger leftSubTreeSize = [post indexOfObject:leftParent] + 1;
        NSInteger rightSubTreeSize = post.count - leftSubTreeSize - 1;
        
        NSArray *preCopy = [pre copy];
        NSArray *postCopy = [post copy];
        
        if(leftSubTreeSize > 0)
        {
            node.left = [self constructFromPrePost:[preCopy subarrayWithRange:NSMakeRange(1, leftSubTreeSize)] post:[postCopy subarrayWithRange:NSMakeRange(0, leftSubTreeSize)]];
        }
        if(rightSubTreeSize > 0)
        {
            node.right = [self constructFromPrePost:[preCopy subarrayWithRange:NSMakeRange(leftSubTreeSize + 1, rightSubTreeSize)] post:[postCopy subarrayWithRange:NSMakeRange(leftSubTreeSize, rightSubTreeSize)]];
        }
    }
    return node;
}

+ (void)solution
{
    P889 *case1 = [[P889 alloc] init];
    Tree *tree = [[Tree alloc] initWithRoot:[case1 constructFromPrePost:@[@1,@2,@4,@5,@3,@6,@7] post:@[@4,@5,@2,@6,@7,@3,@1]]];
    [tree printLevelOrder];
}
@end





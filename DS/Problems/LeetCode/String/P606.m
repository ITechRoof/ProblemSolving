//
//  P606.m
//  DS
//
//  Created by Kiruthika on 29/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/construct-string-from-binary-tree/
//You need to construct a string consists of parenthesis and integers from a binary tree with the preorder traversing way.
//
//The null node needs to be represented by empty parenthesis pair "()". And you need to omit all the empty parenthesis pairs that don't affect the one-to-one mapping relationship between the string and the original binary tree.
//
//Example 1:
//Input: Binary tree: [1,2,3,4]
//       1
//     /   \
//    2     3
//   /
//  4
//
//Output: "1(2(4))(3)"
//
//Explanation: Originallay it needs to be "1(2(4)())(3()())",
//but you need to omit all the unnecessary empty parenthesis pairs.
//And it will be "1(2(4))(3)".
//Example 2:
//Input: Binary tree: [1,2,3,null,4]
//       1
//     /   \
//    2     3
//     \
//      4
//
//Output: "1(2()(4))(3)"
//
//Explanation: Almost the same as the first example,
//except we can't omit the first parenthesis pair to break the one-to-one mapping relationship between the input and the output.

#import "P606.h"
#import "Tree.h"

@implementation P606
- (NSString *)tree2str:(TreeNode *)node
{
    if(node == NULL)
    {
        return @"";
    }
    
    if(node.isLeaf)
    {
        return [NSString stringWithFormat:@"%ld", (long)node.data.integerValue];
    }
    
    if(!node.right)
    {
        return [NSString stringWithFormat:@"%ld(%@)", (long)node.data.integerValue, [self tree2str:node.left]];
    }
    else
    {
        return [NSString stringWithFormat:@"%ld(%@)(%@)", (long)node.data.integerValue, [self tree2str:node.left], [self tree2str:node.right]];
    }
}

+ (Tree *)getTree1 {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    root.left.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (Tree *)getTree2 {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    root.left.right = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}


+ (void)solution
{
    P606 *case1 = [[P606 alloc] init];
    NSLog(@"%@", [case1 tree2str:[P606 getTree1].root]);
    NSLog(@"%@", [case1 tree2str:[P606 getTree2].root]);
}
@end

//
//  P1022.m
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
//Given a binary tree, each node has value 0 or 1.  Each root-to-leaf path represents a binary number starting with the most significant bit.  For example, if the path is 0 -> 1 -> 1 -> 0 -> 1, then this could represent 01101 in binary, which is 13.
//
//For all leaves in the tree, consider the numbers represented by the path from the root to that leaf.
//
//Return the sum of these numbers.
//
//
//
//Example 1:
//
//
//
//Input: [1,0,1,0,1,0,1]
//Output: 22
//Explanation: (100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22
//
//
//Note:
//
//The number of nodes in the tree is between 1 and 1000.
//node.val is 0 or 1.
//The answer will not exceed 2^31 - 1.

#import "P1022.h"
#import "Tree.h"

@implementation P1022

- (void)pathToLeaf:(TreeNode *)node currentStr:(NSString *)str numArr:(NSMutableArray **)numArr
{
    str = [str stringByAppendingFormat:@"%ld", node.data.integerValue];

    if(node.left == NULL && node.right == NULL)
    {
        [*numArr addObject:str];
        return;
    }
    
    [self pathToLeaf:node.left currentStr:str numArr:numArr];
    [self pathToLeaf:node.right currentStr:str numArr:numArr];
}

- (NSInteger)binaryToDecimal:(NSString *)str
{
    
    NSInteger res = 0, factor = 1;
    for (NSInteger i = str.length - 1; i >= 0; i--) {
        char c = [str characterAtIndex:i];
        res = res + (factor * ((c == '1') ? 1 : 0));
        factor = factor * 2;
    }
    return res;
    
}
- (NSInteger)sumRootToLeaf:(TreeNode *)node
{
    NSMutableArray *num = [NSMutableArray array];
    [self pathToLeaf:node currentStr:@"" numArr:&num];
    NSInteger sum = 0;
    for (NSString *s in num) {
        sum = sum + [self binaryToDecimal:s];
    }
    return sum;
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@0 right:@1];

    root.left.left = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    
    root.right.left = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P1022 getTree];
    P1022 *case1 = [[P1022 alloc] init];

    NSLog(@"%ld", (long)[case1 sumRootToLeaf:tree.root]);
}
@end

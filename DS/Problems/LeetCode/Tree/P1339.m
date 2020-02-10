//
//  P1339.m
//  DS
//
//  Created by Kiruthika on 07/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

// Given a binary tree root. Split the binary tree into two subtrees by removing 1 edge such that the product of the sums of the subtrees are maximized.
//
// Since the answer may be too large, return it modulo 10^9 + 7.
//
//
//
// Example 1:
//
//
//
// Input: root = [1,2,3,4,5,6]
// Output: 110
// Explanation: Remove the red edge and get 2 binary trees with sum 11 and 10. Their product is 110 (11*10)
// Example 2:
//
//
//
// Input: root = [1,null,2,3,4,null,null,5,6]
// Output: 90
// Explanation:  Remove the red edge and get 2 binary trees with sum 15 and 6.Their product is 90 (15*6)
// Example 3:
//
// Input: root = [2,3,9,10,7,8,6,5,4,11,1]
// Output: 1025
// Example 4:
//
// Input: root = [1,1]
// Output: 1
//
//
// Constraints:
//
// Each tree has at most 50000 nodes and at least 2 nodes.
// Each node's value is between [1, 10000].


#import "P1339.h"
#import "Tree.h"

@interface P1339()

@property NSMapTable *sumMap;

@end

@implementation P1339

- (NSInteger)getSum:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    if([self.sumMap objectForKey:node])
    {
      return ((NSNumber *)[self.sumMap objectForKey:node]).integerValue;
    }

    NSInteger sum = node.data.integerValue + [self getSum:node.left] + [self getSum:node.right];
    if(!self.sumMap)
    {
        self.sumMap = [[NSMapTable alloc] initWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsWeakMemory capacity:100];
    }
    [self.sumMap setObject:[NSNumber numberWithInteger:sum] forKey:node];

    return sum;
}

- (void)maxProduct:(TreeNode *)node totalSum:(NSInteger)totalSum product:(NSInteger *)maxProduct
{
    if(node == NULL || (node.left == NULL && node.right == NULL))
    {
        return;
    }

    [self maxProduct:node.left totalSum:totalSum product:maxProduct];
    [self maxProduct:node.right totalSum:totalSum product:maxProduct];

    NSInteger leftSum = [self getSum:node.left];
    NSInteger rightSum = [self getSum:node.right];

    *maxProduct = MAX(*maxProduct, MAX(leftSum * (totalSum - leftSum), rightSum * (totalSum - rightSum)));
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    //  1
    // 2 3

    root.left.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];
    //  1
    // 2 3
    //4 5


    root.right.left = [Tree createSubTreeWithRoot:@6 left:NULL right:NULL];
//    root.right.right = [Tree createSubTreeWithRoot:@24 left:@25 right:@26];

    //     1
    //   2   3
    // 4  5 6
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P1339 getTree];
    P1339 *case1 = [[P1339 alloc] init];

    NSInteger maxProduct = 1;
    [case1 maxProduct:tree.root totalSum:[case1 getSum:tree.root] product:&maxProduct];
    NSLog(@"%ld", (long)maxProduct);
}
@end

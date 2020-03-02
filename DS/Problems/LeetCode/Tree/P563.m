//
//  P563.m
//  DS
//
//  Created by Kiruthika on 29/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/binary-tree-tilt/
//Given a binary tree, return the tilt of the whole tree.
//
//The tilt of a tree node is defined as the absolute difference between the sum of all left subtree node values and the sum of all right subtree node values. Null node has tilt 0.
//
//The tilt of the whole tree is defined as the sum of all nodes' tilt.
//
//Example:
//Input:
//         1
//       /   \
//      2     3
//Output: 1
//Explanation:
//Tilt of node 2 : 0
//Tilt of node 3 : 0
//Tilt of node 1 : |2-3| = 1
//Tilt of binary tree : 0 + 0 + 1 = 1
//Note:
//
//The sum of node values in any subtree won't exceed the range of 32-bit integer.
//All the tilt values won't exceed the range of 32-bit integer.

#import "P563.h"
#import "Tree.h"
#import "TreeNode.h"

@interface P563()

@property (nonatomic) NSInteger totalTilt;

@end

@implementation P563

- (NSInteger)calculateTilt:(TreeNode *)root {
    if(root == NULL) {
      return 0;
    }
    NSInteger leftSum = [self calculateTilt:root.left];
    NSInteger rightSum = [self calculateTilt:root.right];

    NSInteger currentTilt = leftSum - rightSum;
    self.totalTilt += ABS(currentTilt);
    return leftSum + rightSum + root.data.integerValue;
}
- (NSInteger)tiltOfBinaryTree:(Tree *)tree {

    self.totalTilt = 0;
    [self calculateTilt:tree.root];
    return ABS(self.totalTilt);
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@12 left:@13 right:@14];
    //  12
    // 13 14

    root.left.left = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
    root.left.right = [Tree createSubTreeWithRoot:@18 left:@19 right:@20];
    //          12
    //      13      14
    //   15   18
    // 16 17 19 20

    root.right.left = [Tree createSubTreeWithRoot:@21 left:@22 right:@23];
    root.right.right = [Tree createSubTreeWithRoot:@24 left:@25 right:@26];

    //            12
    //      13           14
    //   15   18      21    24
    // 16 17 19 20  22  23 25 26

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution {
    P563 *case1 = [[P563 alloc] init];
    NSLog(@"Tilt %ld", (long)[case1 tiltOfBinaryTree:[P563 getTree]]);
}

@end

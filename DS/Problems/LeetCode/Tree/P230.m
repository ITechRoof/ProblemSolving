//
//  P230.m
//  DS
//
//  Created by Kiruthika on 09/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/kth-smallest-element-in-a-bst/
//Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
//
//Note:
//You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
//
//Example 1:
//
//Input: root = [3,1,4,null,2], k = 1
//   3
//  / \
// 1   4
//  \
//   2
//Output: 1
//Example 2:
//
//Input: root = [5,3,6,2,4,null,null,1], k = 3
//       5
//      / \
//     3   6
//    / \
//   2   4
//  /
// 1
//Output: 3
//Follow up:
//What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?

#import "P230.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P230
- (NSInteger)kthSmallest:(TreeNode *)node K:(NSInteger)K
{
    if(node == NULL)
    {
        return -1;
    }
    
    NSInteger kSmallest = 0;
    
    StackUsingArray *s = [StackUsingArray new];
    TreeNode *temp = node;
    while (![s isEmpty] || temp) {
        while (temp != NULL) {
            [s push:temp];
            temp = temp.left;
        }
        
        temp = [s top];
        [s pop];
        
        kSmallest++;
        if(kSmallest == K)
        {
            return temp.data.integerValue;
        }
        
        temp = temp.right;
    }
    return -1;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@3 right:@6];
    
    root.left.left = [Tree createSubTreeWithRoot:@2 left:@1 right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P230 getTree];
    P230 *case1 = [[P230 alloc] init];
    NSLog(@"%ld", (long)[case1 kthSmallest:tree.root K:3]);
}
@end

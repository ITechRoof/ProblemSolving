//
//  P1130.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/minimum-cost-tree-from-leaf-values/
//Given an array arr of positive integers, consider all binary trees such that:
//
//Each node has either 0 or 2 children;
//The values of arr correspond to the values of each leaf in an in-order traversal of the tree.  (Recall that a node is a leaf if and only if it has 0 children.)
//The value of each non-leaf node is equal to the product of the largest leaf value in its left and right subtree respectively.
//Among all possible binary trees considered, return the smallest possible sum of the values of each non-leaf node.  It is guaranteed this sum fits into a 32-bit integer.
//
//
//
//Example 1:
//
//Input: arr = [6,2,4]
//Output: 32
//Explanation:
//There are two possible trees.  The first has non-leaf node sum 36, and the second has non-leaf node sum 32.
//
//    24            24
//   /  \          /  \
//  12   4        6    8
// /  \               / \
//6    2             2   4
//
//
//Constraints:
//
//2 <= arr.length <= 40
//1 <= arr[i] <= 15
//It is guaranteed that the answer fits into a 32-bit signed integer (ie. it is less than 2^31).

#import "P1130.h"
#import "StackUsingArray.h"

@implementation P1130
- (NSInteger)mctFromLeafValues:(NSArray<NSNumber *> *)arr
{
    StackUsingArray *s = [StackUsingArray new];
    
    NSInteger res = 0;
    [s push:arr.firstObject];
    
    for (NSInteger i = 1; i < arr.count; i++) {
        NSNumber *current = arr[i];
        NSNumber *top = [s top];
        while (top.integerValue <= current.integerValue) {
            [s pop];
            res = res + (top.integerValue * MIN(((NSNumber *)[s top]).integerValue, current.integerValue));
            top = [s top];
        }
        [s push:current];
    }
    
    
    while ([s sizeOfStack] >= 2) {
          NSNumber *top = [s top];
         [s pop];
          res = res + (top.integerValue * ((NSNumber *)[s top]).integerValue);
    }
    
    return res;
}

+ (void)solution
{
    P1130 *case1 = [[P1130 alloc] init];
    
    NSLog(@"%ld", (long)[case1 mctFromLeafValues:@[@6,@2,@4]]);
}
@end

//
//  P894.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/all-possible-full-binary-trees/
//A full binary tree is a binary tree where each node has exactly 0 or 2 children.
//
//Return a list of all possible full binary trees with N nodes.  Each element of the answer is the root node of one possible tree.
//
//Each node of each tree in the answer must have node.val = 0.
//
//You may return the final list of trees in any order.
//
//
//
//Example 1:
//
//Input: 7
//Output: [[0,0,0,null,null,0,0,null,null,0,0],[0,0,0,null,null,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,null,null,null,null,0,0],[0,0,0,0,0,null,null,0,0]]
//Explanation:
//
//
//
//Note:
//
//1 <= N <= 20

#import "P894.h"
#import "Tree.h"

@interface P894()

@property (nonatomic) NSMutableDictionary *memo;

@end

@implementation P894
- (NSArray *)allPossibleFBT:(NSInteger)N
{
    NSNumber *key = [NSNumber numberWithInteger:N];
    NSArray *val = [self.memo objectForKey:key];
    if(val)
    {
        return val;
    }
    
    NSMutableArray *res = [NSMutableArray array];
    if(N == 1)
    {
        TreeNode *newNode = [TreeNode new];
        newNode.data = @0;
        [res addObject:newNode];
    }
    else if(N % 2 == 1)
    {
        for (NSInteger i = 1; i < N ; i++) {
            NSInteger j = N - 1 - i;
            NSArray *leftArr = [self allPossibleFBT:i];
            NSArray *rightArr = [self allPossibleFBT:j];
            
            for (TreeNode *left in leftArr) {
                for (TreeNode *right in rightArr) {
                    TreeNode *newNode = [TreeNode new];
                    newNode.data = @0;
                    newNode.left =  left;
                    newNode.right = right;
                    [res addObject:newNode];
                }
            }
        }
    }
    
    [self.memo setObject:res forKey:key];
    
    return res;
}

+ (void)solution
{
    P894 *case1 = [[P894 alloc] init];
    case1.memo = [NSMutableDictionary dictionary];
    
    NSLog(@"%@", [case1 allPossibleFBT:7]);
}
@end

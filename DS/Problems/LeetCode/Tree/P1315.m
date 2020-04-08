//
//  P1315.m
//  DS
//
//  Created by Kiruthika on 08/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/sum-of-nodes-with-even-valued-grandparent/
//Given a binary tree, return the sum of values of nodes with even-valued grandparent.  (A grandparent of a node is the parent of its parent, if it exists.)
//
//If there are no nodes with an even-valued grandparent, return 0.
//
//
//
//Example 1:
//
//
//
//Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
//Output: 18
//Explanation: The red nodes are the nodes with even-value grandparent while the blue nodes are the even-value grandparents.
//
//
//Constraints:
//
//The number of nodes in the tree is between 1 and 10^4.
//The value of nodes is between 1 and 100.

#import "P1315.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P1315
- (NSInteger)sumEvenGrandparent:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    
    NSInteger res = 0;
    QueueUsingArray *q = [QueueUsingArray new];
    [q enqueue:node];
    
    while (![q isEmpty]) {
        NSInteger levelSize = [q sizeOfQueue];
        while (levelSize > 0) {
            
            TreeNode *front = [q dequeue];
            BOOL isEven = front.data.integerValue % 2 == 0;
            
            if(front.left)
            {
                if(isEven)
                {
                    if(front.left.left)
                    {
                        res = res + front.left.left.data.integerValue;
                    }
                    if(front.left.right)
                    {
                        res = res + front.left.right.data.integerValue;
                    }
                }
                [q enqueue:front.left];
            }
            if(front.right)
            {
                if(isEven)
                {
                    if(front.right.left)
                    {
                        res = res + front.right.left.data.integerValue;
                    }
                    if(front.right.right)
                    {
                        res = res + front.right.right.data.integerValue;
                    }
                }
                [q enqueue:front.right];
            }
            levelSize--;
        }
    }
    
    return res;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@6 left:@7 right:@8];
    
    root.left.left = [Tree createSubTreeWithRoot:@2 left:@9 right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@7 left:@1 right:@4];
    
    root.right.left = [Tree createSubTreeWithRoot:@1 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@3 left:NULL right:@5];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P1315 getTree];
    P1315 *case1 = [[P1315 alloc] init];
    
    NSLog(@"%ld", (long)[case1 sumEvenGrandparent:tree.root]);
}
@end





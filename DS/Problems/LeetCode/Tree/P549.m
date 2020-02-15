//
//  P549.m
//  DS
//
//  Created by Kiruthika on 14/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P549.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P549

- (NSInteger)longestConsecutiveSequence:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    
    StackUsingArray *s = [[StackUsingArray alloc] init];
    TreeNode *temp = node;
    
    NSInteger increasingValue = NSIntegerMax;
    NSInteger increasingCount = 0;
    NSInteger decreasingValue = NSIntegerMax;
    NSInteger decreasingCount = 0;
    NSInteger incrRes = 0,decrRes = 0;
    
    while(![s isEmpty] || temp)
    {
        while (temp != NULL) {
            [s push:temp];
            temp = temp.left;
        }
        temp = [s top];
        [s pop];
        
        if(temp.data.integerValue == increasingValue + 1)
        {
            increasingCount++;
        }else
        {
            increasingCount = 1;
        }
        
        if(temp.data.integerValue == decreasingValue - 1)
        {
            decreasingCount++;
        }else
        {
            decreasingCount = 1;
        }
        
        increasingValue = temp.data.integerValue;
        decreasingValue = temp.data.integerValue;
        incrRes = MAX(incrRes, increasingCount);
        decrRes = MAX(decrRes, decreasingCount);
        
        temp = temp.right;
    }
    return MAX(incrRes, decrRes);
}

+ (Tree *)getTree
{
    //        TreeNode *root = [Tree createSubTreeWithRoot:@2 left:@1 right:@3];
    //
    
    //    TreeNode *root = [Tree createSubTreeWithRoot:@6 left:NULL right:@9];
    //    root.right.left = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];
    //    root.right.right = [Tree createSubTreeWithRoot:@10 left:NULL right:@11];
    
    
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@5];
    
    root.left.left = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
    
    root.right.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@6 left:NULL right:@7];
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    P549 *case1 = [[P549 alloc] init];
    Tree *tree = [P549 getTree];
    
    NSLog(@"%ld",   [case1 longestConsecutiveSequence:tree.root]);
}

@end

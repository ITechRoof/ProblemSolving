//
//  P102.m
//  DS
//
//  Created by Kiruthika on 10/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P102.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P102

+ (NSArray *)levelOrder:(TreeNode *)root
{
    if(root == NULL)
    {
        return @[];
    }
    
    NSMutableArray *res = [NSMutableArray array];
    
    QueueUsingArray *q = [[QueueUsingArray alloc] init];
    
    [q enqueue:root];
    
    while (![q isEmpty]) {
        NSMutableArray *levelNodes = [NSMutableArray array];
        NSInteger levelSize = [q sizeOfQueue];
        while (levelSize > 0) {
            TreeNode *front = [q dequeue];
            [levelNodes addObject:front.data];
            if(front.left)
            {
                [q enqueue:front.left];
            }
            if(front.right)
            {
                [q enqueue:front.right];
            }
            levelSize--;
        }
        [res addObject:levelNodes];
    }
    return res;
}

+ (Tree *)getTree {
    
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@12 left:@13 right:@13];
    //  12
    // 13 13
    
    root.left.left = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
    root.left.right = [Tree createSubTreeWithRoot:@18 left:@19 right:@20];
    //          12
    //      13      13
    //   15   18
    // 16 17 19 20
    
    root.right.left = [Tree createSubTreeWithRoot:@18 left:@20 right:@19];
    root.right.right = [Tree createSubTreeWithRoot:@15 left:@17 right:@16];
    
    //            12
    //      13           13
    //   15   18      18    15
    // 16 17 19 20  20  19 17 16
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P102 getTree];
    NSLog(@"%@", [P102 levelOrder:tree.root]);
}

@end


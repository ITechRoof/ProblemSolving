//
//  P958.m
//  DS
//
//  Created by Kiruthika on 12/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P958.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P958

- (BOOL)isComplete:(TreeNode *)node
{
    if(node == NULL)
    {
        return YES;
    }
    
    QueueUsingArray *q = [[QueueUsingArray alloc] init];
    [q enqueue:node];
    
    BOOL fullNode = YES;
    
    while(![q isEmpty])
    {
        TreeNode *temp = [q dequeue];
        
        if(temp.left)
        {
            if(!fullNode)
            {
                return NO;
            }
            [q enqueue:temp.left];
            if(temp.right)
            {
                [q enqueue:temp.right];
            }
            else
            {
                fullNode = NO;
            }
        }
        else if(temp.right)
        {
            return NO;
        }
        else
        {
            fullNode = NO;
        }
    }
    
    return YES;
}

+ (Tree *)getTree
{
    
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
    root.right.right = [Tree createSubTreeWithRoot:@24 left:NULL right:NULL];
    
    //            12
    //      13           14
    //   15   18      21    24
    // 16 17 19 20  22  23
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P958 getTree];
    P958 *case1 = [[P958 alloc] init];
    
    [case1 isComplete:tree.root] ? NSLog(@"Complete tree") : NSLog(@"Not Complete tree");
}


@end

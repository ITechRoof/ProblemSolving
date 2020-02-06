//
//  P662.m
//  DS
//
//  Created by Kiruthika on 06/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P662.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P662

- (NSInteger)maxWidth:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    QueueUsingArray *queue = [[QueueUsingArray alloc] init];
    [queue enqueue:node];
    
    NSInteger maxWidth = 1;
    
    while(![queue isEmpty])
    {
        NSInteger levelSize = [queue sizeOfQueue];
        NSInteger currentWidth = 0;
        NSInteger startIndex = -1, endIndex = -1;
        NSInteger index = 0;
        while(levelSize > 0 )
        {
            TreeNode *top = [queue dequeue];
            if(top != [NSNull null])
            {
                if(startIndex == -1)
                {
                    startIndex = index;
                }
                else
                {
                    endIndex = index;
                }
                
                if(top.left)
                {
                    [queue enqueue:top.left];
                }
                else
                {
                    [queue enqueue:[NSNull null]];
                }
                
                if(top.right)
                {
                    [queue enqueue:top.right];
                }
                else
                {
                    [queue enqueue:[NSNull null]];
                }
            }
            else {
                [queue enqueue:[NSNull null]];
                [queue enqueue:[NSNull null]];
            }
            
            index++;
            levelSize--;
        }
        if(startIndex == -1)
        {
            break;
        }
        else
        {
            if(endIndex == -1)
            {
                currentWidth = 1;
            }
            else
            {
                currentWidth = endIndex - startIndex + 1;
            }
        }
        maxWidth = MAX(currentWidth, maxWidth);
    }
    return maxWidth;
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
    
    //    root.right.left = [Tree createSubTreeWithRoot:@21 left:@22 right:@23];
    root.right.right = [Tree createSubTreeWithRoot:@24 left:NULL right:NULL];
    
    //            12
    //      13           14
    //   15   18           24
    // 16 17 19 20
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P662 getTree];
    P662 *case1 = [[P662 alloc] init];
    
    NSLog(@"%ld", (long)[case1 maxWidth:tree.root]);
}
@end

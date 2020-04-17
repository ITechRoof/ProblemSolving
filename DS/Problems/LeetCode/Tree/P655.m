//
//  P655.m
//  DS
//
//  Created by Kiruthika on 06/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Print a binary tree in an m*n 2D string array following these rules:
//
//The row number m should be equal to the height of the given binary tree.
//The column number n should always be an odd number.
//The root node's value (in string format) should be put in the exactly middle of the first row it can be put. The column and the row where the root node belongs will separate the rest space into two parts (left-bottom part and right-bottom part). You should print the left subtree in the left-bottom part and print the right subtree in the right-bottom part. The left-bottom part and the right-bottom part should have the same size. Even if one subtree is none while the other is not, you don't need to print anything for the none subtree but still need to leave the space as large as that for the other subtree. However, if two subtrees are none, then you don't need to leave space for both of them.
//Each unused space should contain an empty string "".
//Print the subtrees following the same rules.
//Example 1:
//Input:
//     1
//    /
//   2
//Output:
//[["", "1", ""],
// ["2", "", ""]]
//Example 2:
//Input:
//     1
//    / \
//   2   3
//    \
//     4
//Output:
//[["", "", "", "1", "", "", ""],
// ["", "2", "", "", "", "3", ""],
// ["", "", "4", "", "", "", ""]]
//Example 3:
//Input:
//      1
//     / \
//    2   5
//   /
//  3
// /
//4
//Output:
//
//[["",  "",  "", "",  "", "", "", "1", "",  "",  "",  "",  "", "", ""]
// ["",  "",  "", "2", "", "", "", "",  "",  "",  "",  "5", "", "", ""]
// ["",  "3", "", "",  "", "4", "", "",  "",  "6",  "",  "",  "", "7", ""]
// ["4", "",  "8", "",  "9", "", "1", "",  "1",  "",  "1",  "",  "1", "", "1"]]
//Note: The height of binary tree is in the range of [1, 10].

#import "P655.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P655

- (NSInteger)height:(TreeNode *)node
{
    if(node == NULL)
    {
        return -1;
    }else if(node.left == NULL && node.right == NULL)
    {
        return 0;
    }
    
    return MAX([self height:node.left], [self height:node.right]) + 1;
}

- (NSArray *)getPrintMatrixForTree:(TreeNode *)node
{
    NSInteger height = [self height:node];
    NSMutableArray *printMatrix = [[NSMutableArray alloc] init];
    
    if(node == NULL)
    {
        return printMatrix;
    }
    NSInteger row = pow(2, height + 1) - 1;
    
    QueueUsingArray *q = [[QueueUsingArray alloc] init];
    [q enqueue:node];
    
    NSInteger level = 0;
    while(![q isEmpty] && level <= height)
    {
        NSMutableArray *levelRow = [[NSMutableArray alloc] init];
        NSInteger spaceBetween = pow(2, height - level + 1) - 1;
        NSInteger spaceBegin = pow(2, height - level) - 1;
        
        int i = 0;
        for(; i < spaceBegin; i++)
        {
            [levelRow addObject: @""];
        }
        for(NSInteger between = spaceBetween; i < row; i++, between++)
        {
            if(between == spaceBetween)
            {
                TreeNode *top = [q dequeue];
                
                if(top != [NSNull null])
                {
                    [levelRow addObject:top.data.stringValue];
                    
                    if(top.left)
                        
                    {
                        [q enqueue:top.left];
                    }
                    else
                    {
                        [q enqueue:[NSNull null]];
                    }
                    if(top.right)
                    {
                        [q enqueue:top.right];
                    }
                    else
                    {
                        [q enqueue:[NSNull null]];
                    }
                }
                else
                {
                    [q enqueue:[NSNull null]];
                    [q enqueue:[NSNull null]];
                    [levelRow addObject: @""];
                }
                between = -1;
            }
            else
            {
                [levelRow addObject: @""];
            }
        }
        [printMatrix addObject:levelRow];
        //            levelSize--;
        //        }
        
        level++;
    }
    return printMatrix;
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
    Tree *tree = [P655 getTree];
    P655 *case1 = [[P655 alloc] init];
    
    NSArray *arr = [case1 getPrintMatrixForTree:tree.root];
    
    for (NSArray *row in arr)
    {
        NSLog(@"%@", row);
    }
}

@end

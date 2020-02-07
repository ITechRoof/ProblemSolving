//
//  P199.m
//  DS
//
//  Created by Kiruthika on 07/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

// Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
//
// Example:
//
// Input: [1,2,3,null,5,null,4]
// Output: [1, 3, 4]
// Explanation:
//
//    1            <---
//  /   \
// 2     3         <---
//  \     \
//   5     4       <---


#import "P199.h"
#import "Tree.h"
#import "QueueUsingArray.h"

@implementation P199

- (void)printRightView:(TreeNode *)node
{
  if(node == NULL)
  {
    return;
  }

  QueueUsingArray *q = [[QueueUsingArray alloc] init];
  [q enqueue:node];

  while(![q isEmpty])
  {
    NSInteger levelSize = [q sizeOfQueue];

    while(levelSize > 0)
    {
      TreeNode *temp = [q dequeue];
      if(levelSize == 1)
      {
        NSLog(@"%ld", (long)temp.data.integerValue);
      }
      if(temp.left)
      {
        [q enqueue:temp.left];
      }
      if(temp.right)
      {
        [q enqueue:temp.right];
      }
      levelSize--;
    }
  }
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

//  root.right.left = [Tree createSubTreeWithRoot:@18 left:@20 right:@19];
//  root.right.right = [Tree createSubTreeWithRoot:@15 left:@17 right:@16];

  //            12
  //      13           13
  //   15   18      18    15
  // 16 17 19 20  20  19 17 16

  Tree *tree = [[Tree alloc] initWithRoot:root];
  return tree;
}

+ (void)solution
{
    Tree *tree = [P199 getTree];
    P199 *case1 = [[P199 alloc] init];

    [case1 printRightView:tree.root];
}

@end

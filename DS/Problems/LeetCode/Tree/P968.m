//
//  P968.m
//  DS
//
//  Created by Kiruthika on 14/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Given a binary tree, we install cameras on the nodes of the tree.
//
//Each camera at a node can monitor its parent, itself, and its immediate children.
//
//Calculate the minimum number of cameras needed to monitor all nodes of the tree.
//
// 
//
//Example 1:
//
//
//Input: [0,0,null,0,0]
//Output: 1
//Explanation: One camera is enough to monitor all nodes if placed as shown.
//Example 2:
//
//
//Input: [0,0,null,0,null,0,null,null,0]
//Output: 2
//Explanation: At least two cameras are needed to monitor all nodes of the tree. The above image shows one of the valid configurations of camera placement.

#import "P968.h"
#import "Tree.h"
#import "StackUsingArray.h"

@interface P968()

@property (nonatomic) NSMutableArray *coveredNode;

@end

@implementation P968

- (NSInteger)minimumCamera:(TreeNode *)node
{
    if(!node) {
      return 0;
    }

    self.coveredNode = [NSMutableArray array];
    NSInteger miminumCamera = 0;
    
    StackUsingArray *s1 = [[StackUsingArray alloc] init];
    StackUsingArray *s2 = [[StackUsingArray alloc] init];

    [s1 push:node];
    TreeNode *temp;

    while(![s1 isEmpty]) {
      temp = [s1 top];
      [s1 pop];

      [s2 push:temp];

      if(temp.left) {
          [s1 push:temp.left];
      }

      if(temp.right) {
          [s1 push:temp.right];
      }
    }

    while(![s2 isEmpty]) {
        temp = [s2 top];
        [s2 pop];
        //      NSLog(@"%@", temp.data);
        
        
        if((temp.left && ![self.coveredNode containsObject:temp.left]) || (temp.right && ![self.coveredNode containsObject:temp.right])) {
            TreeNode *parent = [s2 top];
            if(parent)
            {
                [self.coveredNode addObject:parent]; //add parent;
                miminumCamera++;
                
                if(parent.left && ![self.coveredNode containsObject:parent.left])
                {
                    [self.coveredNode addObject:parent.left];
                }
                if(parent.right && ![self.coveredNode containsObject:parent.right])
                {
                    [self.coveredNode addObject:parent.right];
                }
            }
            else //Root node
            {
                [self.coveredNode addObject:temp]; //add parent;
                miminumCamera++;
            }
            
        }
    }
    return miminumCamera;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@0 left:@0 right:NULL];
    //   0
    // 0

    root.left.left = [Tree createSubTreeWithRoot:@0 left:@0 right:NULL];
//    root.left.right = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    //       0
    //     0
    //   0
    // 0

    root.left.left.left.right = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    //       0
    //     0
    //   0
    // 0
    //  0
    
//        //Creating tree
//        TreeNode *root = [Tree createSubTreeWithRoot:@0 left:@0 right:NULL];
//        //   0
//        // 0
//
//        root.left.left = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
//        root.left.right = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
//        //   0
//        // 0
//        //0 0
//
//        root.left.left.left.right = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];


    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P968 getTree];
    P968 *case1 = [[P968 alloc] init];

    NSLog(@"%ld", (long)[case1 minimumCamera:tree.root]);
}

@end

//
//  P1261.m
//  DS
//
//  Created by Kiruthika on 07/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

// Given a binary tree with the following rules:
//
// root.val == 0
// If treeNode.val == x and treeNode.left != null, then treeNode.left.val == 2 * x + 1
// If treeNode.val == x and treeNode.right != null, then treeNode.right.val == 2 * x + 2
// Now the binary tree is contaminated, which means all treeNode.val have been changed to -1.
//
// You need to first recover the binary tree and then implement the FindElements class:
//
// FindElements(TreeNode* root) Initializes the object with a contamined binary tree, you need to recover it first.
// bool find(int target) Return if the target value exists in the recovered binary tree.
//
//
// Example 1:
//
//
//
// Input
// ["FindElements","find","find"]
// [[[-1,null,-1]],[1],[2]]
// Output
// [null,false,true]
// Explanation
// FindElements findElements = new FindElements([-1,null,-1]);
// findElements.find(1); // return False
// findElements.find(2); // return True
// Example 2:
//
//
//
// Input
// ["FindElements","find","find","find"]
// [[[-1,-1,-1,-1,-1]],[1],[3],[5]]
// Output
// [null,true,true,false]
// Explanation
// FindElements findElements = new FindElements([-1,-1,-1,-1,-1]);
// findElements.find(1); // return True
// findElements.find(3); // return True
// findElements.find(5); // return False
// Example 3:
//
//
//
// Input
// ["FindElements","find","find","find","find"]
// [[[-1,null,-1,-1,null,-1]],[2],[3],[4],[5]]
// Output
// [null,true,false,false,true]
// Explanation
// FindElements findElements = new FindElements([-1,null,-1,-1,null,-1]);
// findElements.find(2); // return True
// findElements.find(3); // return False
// findElements.find(4); // return False
// findElements.find(5); // return True
//
//
// Constraints:
//
// TreeNode.val == -1
// The height of the binary tree is less than or equal to 20
// The total number of nodes is between [1, 10^4]
// Total calls of find() is between [1, 10^4]
// 0 <= target <= 10^6


#import "P1261.h"
#import "Tree.h"

@interface P1261()

@property (nonatomic) Tree *tree;
@property (nonatomic) NSMutableSet *hashSet;

@end

@implementation P1261

- (instancetype)initWithTree:(Tree *)tree
{
    self = [super init];
    if(self)
    {
      self.hashSet = [NSMutableSet set];
        self.tree = tree;
        [self recoverTree:0 node:tree.root];
    }
    return self;
}


- (void)recoverTree:(NSInteger)parentValue node:(TreeNode *)root
{
    if(root == NULL)
    {
      return;
    }

    root.data = [NSNumber numberWithInteger:parentValue];

    [self.hashSet addObject:root.data];

    [self recoverTree:(2 * parentValue + 1) node:root.left];
    [self recoverTree:(2 * parentValue + 2) node:root.right];
}

- (BOOL)isElementExist:(NSInteger)val
{
    return [self.hashSet containsObject:[NSNumber numberWithInteger:val]];
}

+ (Tree *)getTree {

  //Creating tree
  TreeNode *root = [Tree createSubTreeWithRoot:@-1 left:NULL right:@-1];
  //  -1
  //    -1


  root.right.left = [Tree createSubTreeWithRoot:@-1 left:@-1 right:NULL];

  //         -1
  //                   -1
  //                -1
 //               -1


  Tree *tree = [[Tree alloc] initWithRoot:root];
  return tree;
}

+ (void)solution
{
    Tree *tree = [P1261 getTree];
    P1261 *case1 = [[P1261 alloc] initWithTree:tree];

    [case1 isElementExist:2] ? NSLog(@"Found") : NSLog(@"Not found");
    [case1 isElementExist:3] ? NSLog(@"Found") : NSLog(@"Not found");
    [case1 isElementExist:4] ? NSLog(@"Found") : NSLog(@"Not found");
    [case1 isElementExist:5] ? NSLog(@"Found") : NSLog(@"Not found");
}

@end

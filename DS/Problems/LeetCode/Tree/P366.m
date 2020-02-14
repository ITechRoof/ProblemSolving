//
//  P366.m
//  DS
//
//  Created by Kiruthika on 14/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Given a binary tree, collect a tree's nodes as if you were doing this: Collect and remove all leaves, repeat until the tree is empty.
//
//Example:
//Input: [1,2,3,4,5]
//  
//          1
//         / \
//        2   3
//       / \
//      4   5
//
//Output: [[4,5,3],[2],[1]]

#import "P366.h"
#import "Tree.h"

@implementation P366

- (NSMapTable *)findLeaves:(TreeNode *)node
{
    if(node == NULL)
    {
        return NULL;
    }
    NSMapTable *leavesAtDepthDict = [[NSMapTable alloc] init];
    [self findLeavesHelper:node leaves:&leavesAtDepthDict];
    return leavesAtDepthDict;
}

- (NSInteger)findLeavesHelper:(TreeNode *)node leaves:(NSMapTable **)leavesAtDepthDict
{
    if(node == NULL)
    {
        return -1;
    }
    
    NSInteger depth = MAX([self findLeavesHelper:node.left leaves:leavesAtDepthDict], [self findLeavesHelper:node.right leaves:leavesAtDepthDict]) + 1;
    NSNumber *key = [NSNumber numberWithInteger:depth];
    
    NSMapTable *leavesAtDepthLocalDict = *leavesAtDepthDict;
    NSMutableArray *leaves = [[NSMutableArray alloc] initWithArray:([leavesAtDepthLocalDict objectForKey:key] ?: @[])];
    [leaves addObject:node];
    
    [leavesAtDepthLocalDict setObject:leaves forKey:key];
    
    *leavesAtDepthDict = leavesAtDepthLocalDict;
    
    return depth;
}

+ (Tree *)getTree
{
    
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    //  1
    // 2 3
    
    root.left.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];
    //    1
    // 2    3
    //4 5
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P366 getTree];
    P366 *case1 = [[P366 alloc] init];
    
    NSMapTable *leavesAtDepthDict = [case1 findLeaves:tree.root];
    
    for (NSArray *nodes in leavesAtDepthDict.objectEnumerator) {
        NSLog(@"Depth");
        for (TreeNode *node in nodes) {
            
            NSLog(@"%ld",(long)node.data.integerValue );
            
        }
    }
}


@end

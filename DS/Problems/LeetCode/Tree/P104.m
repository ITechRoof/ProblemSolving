//
//  P104.m
//  DS
//
//  Created by Kiruthika on 12/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P104.h"
#import "Tree.h"

@implementation P104

- (NSInteger)maxDepth:(TreeNode *)node
{
    if(node == NULL || [node isLeaf])
    {
        return 0;
    }
    
    return MAX([self maxDepth:node.left], [self maxDepth:node.right]) + 1;
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
    Tree *tree = [P104 getTree];
    P104 *case1 = [[P104 alloc] init];
    
    NSLog(@"%ld", (long)[case1 maxDepth:tree.root]);
}
@end

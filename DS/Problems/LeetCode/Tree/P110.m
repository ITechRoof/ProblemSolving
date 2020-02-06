//
//  P110.m
//  DS
//
//  Created by Kiruthika on 06/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P110.h"
#import "Tree.h"

@implementation P110

- (BOOL)isBalanced:(TreeNode *)root height:(NSInteger *)height
{
    if(root == NULL)
    {
        *height = -1;
        return NO;
    }else if(root.left == NULL && root.right == NULL)
    {
        *height = 0;
        return YES;
    }
    
    NSInteger leftHeight = 0;
    [self isBalanced:root.left height:&leftHeight];
    NSInteger rightHeight = 0;
    [self isBalanced:root.right height:&rightHeight];
    
    *height = MAX(leftHeight, rightHeight) + 1;
    return ABS(leftHeight - rightHeight) <= 1;
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
    //    root.right.right = [Tree createSubTreeWithRoot:@24 left:@25 right:@26];
    
    //            12
    //      13           14
    //   15   18      21    24
    // 16 17 19 20  22  23 25 26
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P110 getTree];
    P110 *case1 = [[P110 alloc] init];
    
    NSInteger height = 0;
    [case1 isBalanced:tree.root height:&height] ? NSLog(@"Balanced") : NSLog(@"Not balanced");
}
@end

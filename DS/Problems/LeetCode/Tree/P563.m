//
//  P563.m
//  DS
//
//  Created by Kiruthika on 29/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P563.h"
#import "Tree.h"
#import "TreeNode.h"

@interface P563()

@property (nonatomic) NSInteger totalTilt;

@end

@implementation P563

- (NSInteger)calculateTilt:(TreeNode *)root {
    if(root == NULL) {
      return 0;
    }
    NSInteger leftTilt = [self calculateTilt:root.left];
    NSInteger rightTilt = [self calculateTilt:root.right];

    NSInteger currentTilt = leftTilt - rightTilt;
    self.totalTilt += leftTilt - currentTilt  < -1 ? currentTilt *-1 : currentTilt;
    return leftTilt + rightTilt + root.data.integerValue;
}
- (NSInteger)tiltOfBinaryTree:(Tree *)tree {

    self.totalTilt = 0;
    [self calculateTilt:tree.root];
    return self.totalTilt < 0 ? self.totalTilt * -1 : self.totalTilt;
}

+ (Tree *)getTree {

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
    root.right.right = [Tree createSubTreeWithRoot:@24 left:@25 right:@26];

    //            12
    //      13           14
    //   15   18      21    24
    // 16 17 19 20  22  23 25 26

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution {
    P563 *case1 = [[P563 alloc] init];
    NSLog(@"Tilt %ld", (long)[case1 tiltOfBinaryTree:[P563 getTree]]);
}

@end

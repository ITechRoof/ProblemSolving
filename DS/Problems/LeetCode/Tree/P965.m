//
//  P965.m
//  DS
//
//  Created by Kiruthika on 29/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P965.h"
#import "Tree.h"

@implementation P965

- (BOOL)isUnivalued:(TreeNode *)root {
    if(root == NULL) {
        return true;
    }
    BOOL isLeftUnivalued =  root.left == NULL || (root.data.integerValue == root.left.data.integerValue && [self isUnivalued:root.left]);
     BOOL isRightUnivalued =  root.right == NULL || (root.data.integerValue == root.right.data.integerValue && [self isUnivalued:root.right]);
    return isLeftUnivalued && isRightUnivalued;
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@12 left:@12 right:@12];
    //  12
    // 12 12

    root.left.left = [Tree createSubTreeWithRoot:@12 left:@12 right:@12];
    root.left.right = [Tree createSubTreeWithRoot:@12 left:@12 right:NULL];
    //          12
    //      12      12
    //   12   12
    // 12 12 12

    root.right.left = [Tree createSubTreeWithRoot:@12 left:@12 right:NULL];

    //            12
    //      12           12
    //   12   12      12
    // 12 12 12   12   12

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution {
    P965 *case1 = [[P965 alloc] init];
    [case1 isUnivalued:[P965 getTree].root] ? NSLog(@"Univalued") : NSLog(@"Not Univalued");
}

@end

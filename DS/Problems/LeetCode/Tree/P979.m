//
//  P979.m
//  DS
//
//  Created by Kiruthika on 29/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P979.h"
#import "Tree.h"

@interface P979()

@property (nonatomic) NSInteger totalMoves;

@end

@implementation P979

- (NSInteger)getMovesToDistributeCoins:(TreeNode *)root {

  if(root == NULL) {
    return 0;
  }else if(root.left == NULL && root.right == NULL) {
      return root.data.integerValue - 1;
  }
    NSInteger leftMove = [self getMovesToDistributeCoins:root.left];
    NSInteger rightMove = [self getMovesToDistributeCoins:root.right];

    self.totalMoves += ABS(leftMove);
    self.totalMoves += ABS(rightMove);

    NSInteger move = leftMove + rightMove + root.data.integerValue - 1;
    return move;
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@0 right:@3];
    //  1
    // 0 3

     root.left.right = [Tree createSubTreeWithRoot:@0 left:NULL right:NULL];
    //  1
    // 0 3
    //  0
    //

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution {
    P979 *case1 = [[P979 alloc] init];
    [case1 getMovesToDistributeCoins:[P979 getTree].root];
    NSLog(@"Distribute coins in %ld moves", (long) case1.totalMoves );
}
@end


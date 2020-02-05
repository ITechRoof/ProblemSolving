//
//  P993.m
//  DS
//
//  Created by Kiruthika on 04/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P993.h"
#import "Tree.h"

@interface NodeInfo: NSObject

@property (nonatomic) TreeNode *parent;
@property (nonatomic) NSInteger level;

@end

@implementation NodeInfo

- (instancetype)initWithParent:(TreeNode *)parent level:(NSInteger)lev
{
    self = [super init];
    if(self)
    {
    self.parent = parent;
    self.level = lev;
    }
    return self;
}

@end

@interface P993()

@property (nonatomic) Tree *tree;
@property (nonatomic) TreeNode *node1;
@property (nonatomic) TreeNode *node2;
@property (nonatomic) NodeInfo *nodeInfo1;
@property (nonatomic) NodeInfo *nodeInfo2;

@end

@implementation P993

- (void)updateNodeInfo:(TreeNode *)node level:(NSInteger)lev
{
    if(node == NULL)
    {
        return;
    }
    if(node == self.node1 &&  self.nodeInfo1 == NULL)
    {
        self.nodeInfo1 = [[NodeInfo alloc] initWithParent:NULL level:lev];
    }
    
    if(node == self.node2 &&  self.nodeInfo2 == NULL)
    {
        self.nodeInfo2 = [[NodeInfo alloc] initWithParent:NULL level:lev];
    }
    if(node.left == self.node1 || node.right == self.node1)
    {
        self.nodeInfo1 = [[NodeInfo alloc] initWithParent:node level:lev+1];
    }
    
    if(node.left == self.node2 || node.right == self.node2)
    {
        self.nodeInfo2 = [[NodeInfo alloc] initWithParent:node level:lev+1];
        
    }
    
    if(self.nodeInfo1 == NULL || self.nodeInfo2 == NULL)
    {
        [self updateNodeInfo:node.left level:lev+1];
        [self updateNodeInfo:node.right level:lev+1];
    }
}

- (BOOL)isCousin
{
  [self updateNodeInfo:self.tree.root level:0];
  if (self.nodeInfo1.level == self.nodeInfo2.level)
  {
    return (self.nodeInfo1.parent != NULL && self.nodeInfo2.parent != NULL) && self.nodeInfo1.parent != self.nodeInfo2.parent;
  }
  return NO;
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

+ (void)solution
{
    Tree *tree = [P993 getTree];
    P993 *case1 = [[P993 alloc] init];
    case1.tree = tree;
    case1.node1 = tree.root.right.right;
    case1.node2 = tree.root.left.right;
    [case1 isCousin] ? NSLog(@"cousin") :   NSLog(@"Not cousin");
}

@end

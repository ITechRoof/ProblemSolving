//
//  P558.m
//  DS
//
//  Created by Kiruthika on 13/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//A quadtree is a tree data in which each internal node has exactly four children: topLeft, topRight, bottomLeft and bottomRight. Quad trees are often used to partition a two-dimensional space by recursively subdividing it into four quadrants or regions.
//
//We want to store True/False information in our quad tree. The quad tree is used to represent a N * N boolean grid. For each node, it will be subdivided into four children nodes until the values in the region it represents are all the same. Each node has another two boolean attributes : isLeaf and val. isLeaf is true if and only if the node is a leaf node. The val attribute for a leaf node contains the value of the region it represents.
//
//For example, below are two quad trees A and B:
//
//A:
//+-------+-------+   T: true
//|       |       |   F: false
//|   T   |   T   |
//|       |       |
//+-------+-------+
//|       |       |
//|   F   |   F   |
//|       |       |
//+-------+-------+
//topLeft: T
//topRight: T
//bottomLeft: F
//bottomRight: F
//
//B:
//+-------+---+---+
//|       | F | F |
//|   T   +---+---+
//|       | T | T |
//+-------+---+---+
//|       |       |
//|   T   |   F   |
//|       |       |
//+-------+-------+
//topLeft: T
//topRight:
//     topLeft: F
//     topRight: F
//     bottomLeft: T
//     bottomRight: T
//bottomLeft: T
//bottomRight: F
//
//
//Your task is to implement a function that will take two quadtrees and return a quadtree that represents the logical OR (or union) of the two trees.
//
//A:                 B:                 C (A or B):
//+-------+-------+  +-------+---+---+  +-------+-------+
//|       |       |  |       | F | F |  |       |       |
//|   T   |   T   |  |   T   +---+---+  |   T   |   T   |
//|       |       |  |       | T | T |  |       |       |
//+-------+-------+  +-------+---+---+  +-------+-------+
//|       |       |  |       |       |  |       |       |
//|   F   |   F   |  |   T   |   F   |  |   T   |   F   |
//|       |       |  |       |       |  |       |       |
//+-------+-------+  +-------+-------+  +-------+-------+
//Note:
//
//Both A and B represent grids of size N * N.
//N is guaranteed to be a power of 2.
//If you want to know more about the quad tree, you can refer to its wiki.
//The logic OR operation is defined as this: "A or B" is true if A is true, or if B is true, or if both A and B are true.

#import "P558.h"

@interface QuadTreeNode : NSObject

@property (nonatomic) BOOL value;
@property (nonatomic) BOOL isLeaf;
@property (nonatomic) QuadTreeNode *topLeft;
@property (nonatomic) QuadTreeNode *topRight;
@property (nonatomic) QuadTreeNode *bottomLeft;
@property (nonatomic) QuadTreeNode *bottomRight;

@end

@implementation QuadTreeNode

- (instancetype)initWithValue:(BOOL)value
                       isLeaf:(BOOL)isLeaf
                      topLeft:(QuadTreeNode *)topLeft
                     topRight:(QuadTreeNode *)topRight
                   bottomLeft:(QuadTreeNode *)bottomLeft
                  bottomRight:(QuadTreeNode *)bottomRight
{
    self = [super init];
    if(self)
    {
        self.value = value;
        self.isLeaf = isLeaf;
        
        self.topLeft = topLeft;
        self.topRight = topRight;
        self.bottomLeft = bottomLeft;
        self.bottomRight = bottomRight;
    }
    return self;
}
@end

@implementation P558

- (QuadTreeNode *)intersectTree1:(QuadTreeNode *)node1 tree2:(QuadTreeNode *)node2
{
    if(node1 == NULL && node2 == NULL)
    {
        return NULL;
    }
    if(node1 == NULL)
    {
        return node2;
    }
    if(node2 == NULL)
    {
        return node1;
    }
    
    if(node1.isLeaf)
    {
        if(node1.value)
        {
            return node1;
        }
        else
        {
            return node2;
        }
    }
    if(node2.isLeaf)
    {
        if(node2.value)
        {
            return node2;
        }
        else
        {
            return node1;
        }
    }
    
    node1.topLeft = [self intersectTree1:node1.topLeft tree2:node2.topLeft];
    node1.topRight = [self intersectTree1:node1.topRight tree2:node2.topRight];
    node1.bottomLeft = [self intersectTree1:node1.bottomLeft tree2:node2.bottomLeft];
    node1.bottomRight = [self intersectTree1:node1.bottomRight tree2:node2.bottomRight];
    
    if(node1.topLeft.isLeaf && node1.topRight.isLeaf && node1.bottomLeft.isLeaf && node1.bottomRight.isLeaf && (node1.topLeft.value == node1.topRight.value == node1.bottomLeft.value == node1.bottomRight.value))
    {
        node1.value = node1.topLeft;
        node1.isLeaf = YES;
        node1.topLeft = NULL;
        node1.topRight = NULL;
        node1.bottomLeft = NULL;
        node1.bottomRight = NULL;
    }
    return node1;
}

+ (void)solution
{
    P558 *case1 = [[P558 alloc] init];
    QuadTreeNode *tree1 = [[QuadTreeNode alloc] initWithValue:NO isLeaf:NO topLeft:[[QuadTreeNode alloc] initWithValue:YES isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL] topRight:[[QuadTreeNode alloc] initWithValue:YES isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL] bottomLeft:[[QuadTreeNode alloc] initWithValue:NO isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL] bottomRight:[[QuadTreeNode alloc] initWithValue:NO isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL]];
    
    QuadTreeNode *tree2 = [[QuadTreeNode alloc] initWithValue:NO isLeaf:NO topLeft:[[QuadTreeNode alloc] initWithValue:YES isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL] topRight:[[QuadTreeNode alloc] initWithValue:NO isLeaf:NO topLeft:[[QuadTreeNode alloc] initWithValue:NO isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL] topRight:[[QuadTreeNode alloc] initWithValue:NO isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL] bottomLeft:[[QuadTreeNode alloc] initWithValue:YES isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL] bottomRight:[[QuadTreeNode alloc] initWithValue:YES isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL]] bottomLeft:[[QuadTreeNode alloc] initWithValue:YES isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL] bottomRight:[[QuadTreeNode alloc] initWithValue:NO isLeaf:YES topLeft:NULL topRight:NULL bottomLeft:NULL bottomRight:NULL]];
    
    QuadTreeNode *intersectTree = [case1 intersectTree1:tree1 tree2:tree2];
    NSLog(@"%@", intersectTree);
}


@end

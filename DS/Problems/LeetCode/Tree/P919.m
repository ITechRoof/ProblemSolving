//
//  P919.m
//  DS
//
//  Created by Kiruthika on 13/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//A complete binary tree is a binary tree in which every level, except possibly the last, is completely filled, and all nodes are as far left as possible.
//
//Write a data structure CBTInserter that is initialized with a complete binary tree and supports the following operations:
//
//CBTInserter(TreeNode root) initializes the data structure on a given tree with head node root;
//CBTInserter.insert(int v) will insert a TreeNode into the tree with value node.val = v so that the tree remains complete, and returns the value of the parent of the inserted TreeNode;
//CBTInserter.get_root() will return the head node of the tree.
//
//
//Example 1:
//
//Input: inputs = ["CBTInserter","insert","get_root"], inputs = [[[1]],[2],[]]
//Output: [null,1,[1,2]]
//Example 2:
//
//Input: inputs = ["CBTInserter","insert","insert","get_root"], inputs = [[[1,2,3,4,5,6]],[7],[8],[]]
//Output: [null,3,4,[1,2,3,4,5,6,7,8]]
//
//
//Note:
//
//The initial given tree is complete and contains between 1 and 1000 nodes.
//CBTInserter.insert is called at most 10000 times per test case.
//Every value of a given or inserted node is between 0 and 5000.
//

#import "P919.h"
#import "Tree.h"

@interface P919()

@property (nonatomic) Tree *tree;
@property (nonatomic) NSMutableArray *levelOrderArray;
@property (nonatomic) NSInteger currentParentIndex;

@end

@implementation P919

- (instancetype)initWithValues:(NSArray *)values
{
    self = [super init];
    
    if(self)
    {
        self.levelOrderArray = [[NSMutableArray alloc] init];
        
        if(values.count > 0)
        {
            for(NSNumber *value in values)
            {
                TreeNode *newNode = [[TreeNode alloc] initWithValue:value];
                
                if(!self.tree)
                {
                    self.tree = [[Tree alloc] initWithRoot:newNode];
                    self.currentParentIndex = 0;
                }
                else
                {
                    TreeNode *parent = [self.levelOrderArray objectAtIndex:self.currentParentIndex];
                    if(!parent.left)
                    {
                        parent.left = newNode;
                    }
                    else
                    {
                        parent.right = newNode;
                        self.currentParentIndex++;
                    }
                }
                 [self.levelOrderArray addObject:newNode];
            }
        }
    }
    return self;
}

- (TreeNode *)insert:(NSNumber *)data
{
    TreeNode *newNode = [[TreeNode alloc] initWithValue:data];
    [self.levelOrderArray addObject:newNode];

    if(!self.tree)
    {
        self.tree = [[Tree alloc] initWithRoot:newNode];
        
        self.currentParentIndex = 0;
        return NULL;
    }
    else
    {
        TreeNode *parent = [self.levelOrderArray objectAtIndex:self.currentParentIndex];
        if(!parent.left)
        {
            parent.left = newNode;
        }
        else
        {
            parent.right = newNode;
            self.currentParentIndex++;
        }
        return parent;

    }
}

- (TreeNode *)getRoot
{
    return self.tree.root;
}

+ (void)solution
{
    P919 *case1 = [[P919 alloc] initWithValues:@[@1,@2,@3,@4,@5,@6]];
    TreeNode *parent = [case1 insert:@7];
    NSLog(@"Parent of 7 is %ld", (long)parent.data.integerValue);
    Tree *tree = [[Tree alloc] initWithRoot:[case1 getRoot]];
    [tree printLevelOrder];
}


@end

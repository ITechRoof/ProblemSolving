//
//  P173.m
//  DS
//
//  Created by Kiruthika on 17/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P173.h"
#import "Tree.h"
#import "StackUsingArray.h"

@interface P173()

@property (nonatomic) Tree *tree;
@property (nonatomic) StackUsingArray *s;

@end

@implementation P173

- (instancetype)initWithTree:(Tree *)tree
{
    self = [super init];
    if(self)
    {
        self.tree = tree;
        self.s = [StackUsingArray new];
        [self pushAllLeft:self.tree.root];
    }
    return self;
}

- (BOOL)hasNext
{
    return ![self.s isEmpty];
}

- (void)pushAllLeft:(TreeNode *)node
{
    while (node) {
        [self.s push:node];
        node = node.left;
    }
}

- (TreeNode *)next
{
    TreeNode *node = [self.s top];
    [self.s pop];
    
    if(node.right)
    {
        [self pushAllLeft:node.right];
    }
    return node;
}

+ (Tree *)getTree
{
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@7 left:@3 right:@15];
    
    root.right.left = [Tree createSubTreeWithRoot:@9 left:NULL right:NULL];
    root.right.right = [Tree createSubTreeWithRoot:@20 left:NULL right:NULL];

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    P173 *case1 = [[P173 alloc] initWithTree:[P173 getTree]];
        
    while ([case1 hasNext]) {
        NSLog(@"%@", [case1 next].data);
    }
}
@end

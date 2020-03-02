//
//  P987.m
//  DS
//
//  Created by Kiruthika on 27/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P987.h"
#import "Tree.h"

@interface P987()

@property (nonatomic) NSMutableDictionary *verticalView;

@end

@implementation P987

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.verticalView = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setVerticalDict:(TreeNode *)node position:(NSInteger)pos
{
    if(node == NULL)
    {
        return;
    }
    
    NSNumber *key = [NSNumber numberWithInteger:pos];
    NSMutableArray *array = [NSMutableArray arrayWithArray:[self.verticalView objectForKey:key] ?: @[]];
    [array addObject:node];
    [self.verticalView setObject:array forKey:key];
    
    [self setVerticalDict:node.left position:key.integerValue - 1];
    [self setVerticalDict:node.right position:key.integerValue + 1];
}
- (void)printVerticalView:(TreeNode *)node
{
    [self setVerticalDict:node position:0];
    
    NSArray *keys = [self sortedKeys:[self.verticalView allKeys]];
    
    for(NSNumber *key in keys)
    {
        NSArray *array = [self.verticalView objectForKey:key] ?: @[];
        NSLog(@"Line %@", key);

        for(TreeNode *node in array)
        {
            NSLog(@"%@", node.data);
        }
    }
}

- (NSArray *)sortedKeys:(NSArray<NSNumber *> *)keys
{
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:keys];
    
    for(int i = 0; i < array.count; i++)
    {
        for(int j = i + 1; j < array.count; j++)
        {
            if(array[i].integerValue > array[j].integerValue)
            {
                NSNumber *temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    return array;
}

+ (Tree *)getTree {
    
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@3];
    //  1
    // 2 3
    
    root.left.left = [Tree createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.left.right = [Tree createSubTreeWithRoot:@5 left:NULL right:NULL];
    //     1
    //   2   3
    // 4   5
    
      root.right.left = [Tree createSubTreeWithRoot:@6 left:NULL right:NULL];
      root.right.right = [Tree createSubTreeWithRoot:@7 left:NULL right:NULL];
    
    //       1
    //   2      3
    // 4   5  6   7
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P987 getTree];
    P987 *case1 = [[P987 alloc] init];
    
    [case1 printVerticalView:tree.root];
}

@end

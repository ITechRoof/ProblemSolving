//
//  NaryTree.m
//  DS
//
//  Created by Kiruthika on 12/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "NaryTree.h"

@implementation NaryTree

- (instancetype)initWithRoot:(NaryNode *)root {
    self = [super init];
    if(self) {
        self.root = root;
    }
    return self;
}

+ (NaryNode *)createSubTreeWithRoot:(NSNumber *)rootValue childernNodes:(NSArray *)childrenNodeValues
{
    NaryNode *root = [[NaryNode alloc] initWithValue:rootValue];
    root.children = childrenNodeValues;
    
    return root;
}

+ (NaryNode *)createSubTreeWithRoot:(NSNumber *)rootValue childern:(NSArray *)childrenValues
{
    NaryNode *root = [[NaryNode alloc] initWithValue:rootValue];
    
    NSMutableArray *childNodes = [NSMutableArray array];
    
    for (NSNumber *childValue in childrenValues) {
        [childNodes addObject:[[NaryNode alloc] initWithValue:childValue]];
    }
    root.children = childNodes;
    
    return root;
}

@end

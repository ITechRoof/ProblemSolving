//
//  NaryTree.h
//  DS
//
//  Created by Kiruthika on 12/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NaryNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface NaryTree : NSObject

@property (nonatomic) NaryNode *root;

- (instancetype)initWithRoot:(NaryNode *)root;
+ (NaryNode *)createSubTreeWithRoot:(NSNumber *)rootValue childernNodes:(NSArray *)childrenNodeValues;
+ (NaryNode *)createSubTreeWithRoot:(NSNumber *)rootValue childern:(NSArray *)childrenValues;

@end

NS_ASSUME_NONNULL_END

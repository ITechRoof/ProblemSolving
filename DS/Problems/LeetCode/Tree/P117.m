//
//  P117.m
//  DS
//
//  Created by Kiruthika on 24/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P117.h"
#import "QueueUsingArray.h"

@interface TreeNodeWithNext : NSObject

@property (nonatomic) NSNumber *data;
@property (nonatomic) TreeNodeWithNext *left;
@property (nonatomic) TreeNodeWithNext *right;
@property (nonatomic) TreeNodeWithNext *next;

@end

@implementation TreeNodeWithNext

- (instancetype)initWithValue:(NSNumber *)value {

    self = [super init];
    if(self) {
        self.data = value;
    }
    return self;
}

@end

@implementation P117

+ (TreeNodeWithNext *)createSubTreeWithRoot:(NSNumber *)rootValue left:(NSNumber *)left right:(NSNumber *)right {

    if (!rootValue) {
        return NULL;
    }

    TreeNodeWithNext *root = [[TreeNodeWithNext alloc] initWithValue:rootValue];

    root.left = left  ? [[TreeNodeWithNext alloc] initWithValue:left] : NULL;
    root.right = right ? [[TreeNodeWithNext alloc] initWithValue:right] : NULL;

    return root;
}

- (TreeNodeWithNext *)connect:(TreeNodeWithNext *)node
{
    QueueUsingArray *q = [[QueueUsingArray alloc] init];
    [q enqueue:node];
    
    while (![q isEmpty]) {
        TreeNodeWithNext *prev, *temp;
        
        NSInteger levelSize = [q sizeOfQueue];
        
        while (levelSize > 0) {
            prev = temp;
            temp = [q dequeue];
            if(temp.left)
            {
                [q enqueue:temp.left];
            }
            if(temp.right)
            {
                [q enqueue:temp.right];
            }
            prev.next = temp;
            levelSize--;
        }
    }
    return node;
}

+ (TreeNodeWithNext *)getRoot
{
    //Creating tree
    TreeNodeWithNext *root = [P117 createSubTreeWithRoot:@1 left:@2 right:@3];
    
    root.left.left = [P117 createSubTreeWithRoot:@4 left:NULL right:NULL];
    root.left.right = [P117 createSubTreeWithRoot:@5 left:NULL right:NULL];

    root.right.right = [P117 createSubTreeWithRoot:@7 left:NULL right:NULL];

    return root;
}

+ (void)solution
{
    P117 *case1 = [[P117 alloc] init];
    [case1 connect:[P117 getRoot]];
}
@end

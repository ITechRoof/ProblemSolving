//
//  StackUsingArray.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 02/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "StackUsingArray.h"

@interface StackUsingArray()

@property (nonatomic) NSMutableArray *arr;

@end

@implementation StackUsingArray

- (void)push:(id)value {
    
    if (!self.arr) {
        self.arr = [[NSMutableArray alloc] init];
    }
    
    [self.arr addObject:value];
}

- (void)pop {
    if(![self isEmpty]) {
        [self top];
        [self.arr removeLastObject];
    }
}

- (NSInteger)sizeOfStack
{
    return self.arr.count;
}

- (id)top {
//    NSLog(@"%@", self.arr.lastObject);
    return self.arr.lastObject;
}

- (void)printStack {
    if(![self isEmpty]) {
        NSLog(@"%@", self.arr.description);
    }
}

- (BOOL)isEmpty {
    
    if(!self.arr || self.arr.count == 0) {
        return true;
    }
    return false;
}

+ (void)stackImplementation {
    
    StackUsingArray *stack = [[StackUsingArray alloc] init];

    [stack push:@"A"];
    [stack push:@"B"];
    [stack push:@"C"];
    [stack push:[[NSNumber alloc] initWithInt:12]];

    [stack top];
    [stack pop];

    [stack printStack];
}

@end

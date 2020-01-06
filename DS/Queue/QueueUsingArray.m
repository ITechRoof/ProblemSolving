//
//  QueueUsingArray.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 06/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "QueueUsingArray.h"

@interface QueueUsingArray()

@property (nonatomic) NSMutableArray *arr;
@property (nonatomic) NSInteger front;
@property (nonatomic) NSInteger rear;

@end

@implementation QueueUsingArray

- (instancetype)init {
    self = [super init];
    if(self) {
        self.arr = [[NSMutableArray alloc] init];
        self.front = -1;
        self.rear = 0;
    }
    return self;
}
- (void)enqueue:(id)value {
    [self.arr addObject:value];
    self.front++;
}

- (void)dequeue {
    if(![self isEmpty]) {
        self.rear++;
    }
}

- (BOOL)isEmpty {
    return self.front < self.rear;
}

- (void)print {
    if([self isEmpty]) {
        NSLog(@"Empty");
        return;
    }
    for (NSInteger i = self.rear; i <= self.front; i++) {
        NSLog(@"%@", self.arr[i]);
    }
}

- (NSInteger)sizeOfQueue {
    return self.rear - self.front + 1;
}

+ (void)solution {
    
    QueueUsingArray *queue = [[QueueUsingArray alloc] init];
    [queue print];
    
    [queue enqueue:@(10)];
    [queue enqueue:@(20)];
    [queue enqueue:@(30)];
    
    [queue dequeue];
    [queue dequeue];
    [queue dequeue];
    [queue enqueue:@(40)];

    [queue print];
    
}

@end

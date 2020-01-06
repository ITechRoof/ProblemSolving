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
        self.rear = -1;
        self.front = 0;
    }
    return self;
}
- (void)enqueue:(id)value {
    [self.arr addObject:value];
    self.rear++;
}

- (void)dequeue {
    if(![self isEmpty]) {
        self.front++;
    }
}

- (BOOL)isEmpty {
    return self.rear < self.front;
}

- (void)print {
    if([self isEmpty]) {
        NSLog(@"Empty");
        return;
    }
    for (NSInteger i = self.front; i <= self.rear; i++) {
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

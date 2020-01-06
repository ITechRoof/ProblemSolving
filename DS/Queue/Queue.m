//
//  Queue.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 06/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "Queue.h"
#import "ListNode.h"
#import "LinkedList.h"

@interface Queue()

@property (nonatomic) LinkedList *list;
@property (nonatomic) ListNode *front;
@property (nonatomic) ListNode *rear;

@end

@implementation Queue

- (instancetype)init {
    self = [super init];
    if(self) {
        self.list = [[LinkedList alloc] init];
    }
    return self;
}

- (void)enqueue:(id)value {
    ListNode *node = [[ListNode alloc] initWithValue:value];
    if([self isEmpty]) {
        self.front = node;
        self.rear = node;
    } else {
        self.rear.next = node;
        self.rear = node;
    }
}

- (void)dequeue {
    if(![self isEmpty]) {
        self.front = self.front.next;
    }
}

- (BOOL)isEmpty {
    return self.front == NULL;
}

- (void)print {
    if([self isEmpty]) {
        NSLog(@"Empty");
        return;
    }
    
    ListNode *temp = self.front;
    while(temp != NULL) {
       NSLog(@"%@", temp.data);
        temp = temp.next;
    }
}

+ (void)solution {
    
    Queue *queue = [[Queue alloc] init];
    [queue print];
    
    [queue enqueue:@(10)];
    [queue enqueue:@(20)];
    [queue enqueue:@(30)];

    [queue dequeue];
    [queue dequeue];
    [queue enqueue:@(40)];

    [queue print];
    
}
@end

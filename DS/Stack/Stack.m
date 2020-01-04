//
//  Stack.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 02/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "Stack.h"
#import "ListNode.h"

@interface Stack()

@property (nonatomic) ListNode *top;
@property (nonatomic) ListNode *head;

@end

@implementation Stack

- (void)push:(id)value {
    ListNode *node = [[ListNode alloc] initWithValue:value];
    
    if(![self isEmpty]) {
        self.top.next = node;
        self.top = node;
    }else {
        self.head = node;
    }
    self.top = node;
}

- (void)pop {
    if ([self isEmpty]) {
        NSLog(@"Stack empty");
    }else {
        ListNode *temp = self.head;
        
        if(temp.next == NULL) { // 1 Node
            self.top = self.head = NULL;
            return;
        }
        
        while(temp.next.next != NULL) {
            temp = temp.next;
        }
        temp.next = NULL;
        self.top = temp;
    }
}

- (void)printTop {
    
    if ([self isEmpty]) {
        NSLog(@"Stack empty");
    }else {
        NSLog(@"%@", self.top.data);
    }
}

- (void)printStack {
    if(![self isEmpty]) {
        ListNode *temp = self.head;
        while(temp != NULL) {
            NSLog(@"%@", temp.data);
            temp = temp.next;
        }
    }
}

- (BOOL)isEmpty {
    return self.head == NULL;
}

+ (void)stackImplementation {

    Stack *stack = [[Stack alloc] init];
    [stack push:@"Test"];
    [stack push:@"stack"];
    [stack push:@"data"];
    [stack push:@"structure"];
    
    [stack printTop];
    [stack pop];
    
    [stack printStack];
    
}

@end

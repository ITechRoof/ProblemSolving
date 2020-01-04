//
//  DoubleLinkedList.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 02/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "DoubleLinkedList.h"

@implementation DoubleLinkedList

- (instancetype)init {
    self.head = NULL;
    return self;
}

- (void)insertAtHead:(id)data {
    DoubleListNode *node = [[DoubleListNode alloc] initWithValue:data];
    node.next = self.head;
    self.head.prev = node;
    self.head = node;
}

- (void) insertAtTail:(id)data {
    
    DoubleListNode *node = [[DoubleListNode alloc] initWithValue:data];
    if ([self isEmpty]) {
        self.head = node;
        return;
    }
    
    DoubleListNode *temp = self.head;
    while(temp.next != NULL) {
        temp = temp.next;
    }
    temp.next = node;
    node.prev = temp;
}

- (void)insertAtPos:(id)data
           position:(int)pos {
    
    DoubleListNode *node = [[DoubleListNode alloc] initWithValue:data];
    if ([self isEmpty]) {
        self.head = node;
        return;
    }
    
    int i = 1;
    DoubleListNode *temp = self.head;
    while(temp != NULL && i < pos) {
        
        i++;
        temp = temp.next;
    }
}

- (void)deleteAtHead {
    self.head = self.head.next;
}

- (void)deleteAtTail {
    if ([self isEmpty]) {
        return;
    }
    
    DoubleListNode *temp = self.head;
    
    if (temp.next == NULL) { //1 node
        self.head = NULL;
        return;
    }
    
    //More then 1 node
    while(temp.next.next != NULL) {
        temp = temp.next;
    }
    temp.next = NULL;
    
}

- (void)deleteValue:(id)value {
    
    if([self.head.data isEqual:value]) {
        self.head = self.head.next;
        return;
    }
    
    DoubleListNode *current = self.head.next;
    while(current != NULL) {
        if ([current.data isEqual:value]) {
            DoubleListNode *temp = current.prev;
            current.prev.next = current.next;
            current.next.prev = temp;
            return;
        }
        current = current.next;
    }
}

- (void)findValue:(id)value {
    
    if ([self isEmpty]) {
        NSLog(@"Value not found");
        return;
    }
    
    int i = 1;
    DoubleListNode *temp = self.head;
    while(temp != NULL) {
        if ([temp.data isEqual:value]) {
            NSLog(@"Value found at %d", i);
            return;
        }
        i++;
        temp = temp.next;
    }
    NSLog(@"Value not found");
}

- (BOOL)isEmpty {
    
    if (self.head == NULL) {
        return TRUE;
    }
    return FALSE;
}

- (void)printList {
    
    DoubleListNode *temp = self.head;
    while(temp != NULL) {
        NSLog(@"%@", temp.data);
        temp = temp.next;
    }
}

- (void)printListUsingRecursion:(DoubleListNode *)node {
    
    if(node == NULL) {
        return;
    }
    NSLog(@"%@", node.data);

    [self printListUsingRecursion:node.next];
}

- (void)reversePrintRecursive:(DoubleListNode *)node {
    
    if(node == NULL) {
        return;
    }
    [self reversePrintRecursive:node.next];
    NSLog(@"%@", node.data);
}

- (void)reverseIterative {
    
    DoubleListNode *current = self.head;
    while(current != NULL) {
        
        DoubleListNode *q = current.prev;
        current.prev = current.next;
        current.next = q;
        self.head = current;
        current = current.prev;
    }
}

- (void)reverseRecursive:(DoubleListNode *)node  {
    
    if(node.next == NULL) {
        node.next = node.prev;
        node.prev = NULL;
        self.head = node;
        return;
    }
    [self reverseRecursive:node.next];
    DoubleListNode *temp = node.prev;
    node.prev = node.next;
    node.next = temp;
}

+ (void)doubleListImplementation {
    
    DoubleLinkedList *list = [[DoubleLinkedList alloc] init];
    
    [list insertAtTail:@"A"];
    [list insertAtTail:@"B"];
    [list insertAtTail:@"C"];
//    [list insertAtTail:@"D"];

//    [list deleteAtHead];
//    [list deleteAtTail];

    //    //    [list insertAtPos:[[NSNumber alloc] initWithInt:8] position:4];
    //        [list printListUsingRecursion:list.head];
    //    //    [list reversePrintRecursive:list.head];
    
    //        [list reverseRecursive:list.head];
    [list reverseIterative];
//    [list reverseIterative];
    [list printListUsingRecursion:list.head];
    
}

@end

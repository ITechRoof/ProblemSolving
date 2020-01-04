//
//  LinkedList.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 26/12/19.
//  Copyright © 2019 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"

@implementation LinkedList

- (instancetype)init {
    self.head = NULL;
    return self;
}

- (void)insertAtHead:(id)data {
    
    ListNode *newNode = [[ListNode alloc] initWithValue:data];
    newNode.next = self.head;
    self.head = newNode;
}

- (void) insertAtTail:(id)data {
    ListNode *newNode = [[ListNode alloc] initWithValue:data];
    
    if ([self isEmpty]) {
        self.head = newNode;
        return;
    }
    
    ListNode *temp = self.head;
    while(temp.next != NULL) {
        temp = temp.next;
    }
    temp.next = newNode;
}

- (void)insertAtPos:(id)data
           position:(int)pos {
    ListNode *newNode = [[ListNode alloc] initWithValue:data];
    
    if ([self isEmpty]) {
        self.head = newNode;
    }
    
    ListNode *temp = self.head;
    
    if (pos <= 1) {
        newNode.next = self.head;
        self.head = newNode;
    } else {
        int i = 1;
        while(temp.next != NULL && i < pos - 1) {
            temp = temp.next;
            i++;
        }
        newNode.next = temp.next;
        temp.next = newNode;
    }
}

- (void)deleteAtHead {
    
    self.head = self.head.next;
}

- (void)deleteAtTail {
    
    if ([self isEmpty]) {
        return;
    }
    
    ListNode *temp = self.head;
    
    if(temp.next == NULL){ //1 node
        self.head = NULL;
        return;
    }
    while(temp.next.next != NULL) {
        temp = temp.next;
    }
    temp.next = NULL;
}

- (void)deleteValue:(id)value {
    
    if(self.head.data == value) {
        self.head = self.head.next;
        return;
    }
    
    ListNode *temp = self.head;
    while (temp.next.data != value && temp != NULL) {
        temp = temp.next;
    }
    if (temp.next.data == value) {
        temp.next = temp.next.next;
    } else {
        NSLog(@"value not found");
    }
}

- (void)findValue:(id)value {
    
    ListNode *temp = self.head;
    for(int i = 1;temp != NULL;i++) {
        if (temp.data == value) {
            NSLog(@"Value found at %d", i);
            return;
        }
        temp = temp.next;
    }
    NSLog(@"value not found");
}

- (BOOL)isEmpty {
    
    if (self.head == NULL) {
        return TRUE;
    }
    return FALSE;
}

- (void)printList {
    
    ListNode *temp = self.head;
    while(temp != NULL) {
        NSLog(@"%@ ", temp.data);
        temp = temp.next;
    }
}

- (void)printListUsingRecursion:(ListNode *)node {
    
    if (node == NULL) {
        return;
    }
    NSLog(@"%@ ", node.data);
    [self printListUsingRecursion:node.next];
}

- (void)reverseIterative {
    ListNode *prev = NULL;
    ListNode *current = self.head;
    ListNode *next;
    while(current != NULL) {
        next = current.next;
        current.next = prev;
        prev = current;
        current = next;
    }
    self.head = prev;
}

- (void)reversePrintRecursive:(ListNode *)node {
    
    if (node == NULL) {
        return;
    }
    [self reversePrintRecursive:node.next];
    NSLog(@"%@ ", node.data);
}

- (void)reverseRecursive:(ListNode *)node  {
    if (node.next == NULL) {
        self.head = node;
        return;
    }
    [self reverseRecursive:node.next];
    ListNode *current = node.next;
    current.next = node;
    node.next = NULL;
}

+ (void)listImplementation {
    LinkedList *list = [[LinkedList alloc] init];
    
    [list insertAtTail:[[NSNumber alloc] initWithInt:1]];
    [list insertAtTail:[[NSNumber alloc] initWithInt:2]];
    [list insertAtTail:[[NSNumber alloc] initWithInt:3]];
    [list insertAtTail:[[NSNumber alloc] initWithInt:4]];
//    [list insertAtTail:[[NSNumber alloc] initWithInt:5]];
//    [list insertAtTail:[[NSNumber alloc] initWithInt:6]];
//    [list insertAtTail:[[NSNumber alloc] initWithInt:7]];
    [list deleteAtTail];
//    [list insertAtPos:[[NSNumber alloc] initWithInt:8] position:4];
//    [list printListUsingRecursion:list.head];
//    [list reversePrintRecursive:list.head];
    
//    [list reverseRecursive:list.head];
    [list printList];
}

+ (LinkedList *)listWithValues:(NSArray *)values {
    
    LinkedList *list = [[LinkedList alloc] init];

    for(id value in values) {
        [list insertAtTail:value];
    }
    return list;
}

@end


@implementation LinkedIntList

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.headPtr = NULL;
    }
    return self;
}

- (void)printList {
    
    ListIntNode *temp = self.headPtr;
    while(temp != NULL) {
        NSLog(@"%ld ", (long)temp.data);
        temp = temp.next;
    }
}

- (BOOL)isEmpty {
    
    if (self.headPtr == NULL) {
        return TRUE;
    }
    return FALSE;
}

- (void) insertIntAtTail:(NSInteger)data {
    ListIntNode *newNode = [[ListIntNode alloc] initWithValue:data];
    
    if ([self isEmpty]) {
        self.headPtr = newNode;
        return;
    }
    
    ListIntNode *temp = self.headPtr;
    while(temp.next != NULL) {
        temp = temp.next;
    }
    temp.next = newNode;
}

+ (LinkedIntList *)listWithIntValues:(NSArray *)values {
    
    LinkedIntList *list = [[LinkedIntList alloc] init];

    for(NSNumber *value in values) {
        
        [list insertIntAtTail:[value integerValue]];
    }
    return list;
}


@end

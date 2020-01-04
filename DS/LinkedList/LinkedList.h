//
//  LinkedList.h
//  DS
//
//  Created by Kiruthika Selvavinayagam on 26/12/19.
//  Copyright © 2019 Kiruthika Selvavinayagam. All rights reserved.
//

#import "ListNode.h"

@interface LinkedList: NSObject

@property ListNode *head;

+ (void)listImplementation;
+ (LinkedList *)listWithValues:(NSArray *)values;

- (void) insertAtTail:(id)data;
- (void)printList;

@end

@interface LinkedIntList : LinkedList

@property ListIntNode *headPtr;

- (void) insertIntAtTail:(NSInteger)data;
+ (LinkedIntList *)listWithIntValues:(NSArray *)values;

@end

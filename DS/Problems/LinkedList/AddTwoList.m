//
//  AddTwoList.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 02/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "AddTwoList.h"
#import "LinkedList.h"

@implementation AddTwoList

+ (void)solution {
    
    LinkedIntList *list1 = [LinkedIntList listWithIntValues:@[@2,@4,@3]];
    [list1 printList];
    
    LinkedIntList *list2 = [LinkedIntList listWithIntValues:@[@5,@6,@4]];
    [list2 printList];
    
    ListIntNode *temp1 = list1.headPtr;
    ListIntNode *temp2 = list2.headPtr;

    LinkedIntList *list3 = [[LinkedIntList alloc] init];
    
    NSInteger carry = 0;
    
    while(temp1 != NULL || temp2 != NULL) {
        
        NSInteger newValue = (temp1 != NULL ? temp1.data : 0) + (temp2 != NULL ? temp2.data : 0) + carry;
        
        [list3 insertIntAtTail:newValue % 10];
        carry = newValue / 10;
        temp1 = temp1.next;
        temp2 = temp2.next;
    }
    
    [list3 printList];
}
@end

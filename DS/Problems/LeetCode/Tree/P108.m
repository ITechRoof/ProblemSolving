//
//  P108.m
//  DS
//
//  Created by Kiruthika on 29/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P108.h"
#import "Tree.h"
#import "LinkedList.h"

@implementation P108

- (ListIntNode *)getMiddleFromList:(ListIntNode *)head
{
    ListIntNode *slow = head, *fast = head, *prev;
    
    while(fast.next != NULL)
    {
        prev = slow;
        slow = slow.next;
        fast = fast.next.next;
    }
    if(prev != NULL)
    {
        prev.next = NULL;
    }
    
    return slow;
}

- (TreeNode *)getTreeFromList:(ListIntNode *)head
{
    if (head == NULL) {
        return NULL;
    }
    ListIntNode *rootList = [self getMiddleFromList:head];
    
    TreeNode *root = [[TreeNode alloc] initWithValue:[NSNumber numberWithInteger:rootList.data]];
    
    if (rootList == head)
    {
        return root;
    }
    root.left = [self getTreeFromList:head];
    root.right = [self getTreeFromList:rootList.next];
    
    return root;
}

+ (void)solution
{
    P108 *case1 = [[P108 alloc] init];
    LinkedIntList *list = [LinkedIntList listWithIntValues:@[@-10,@-3,@0,@5,@9]];
    Tree *tree = [[Tree alloc] initWithRoot:[case1 getTreeFromList:list.headPtr]];
    [tree printLevelOrder];
}
@end

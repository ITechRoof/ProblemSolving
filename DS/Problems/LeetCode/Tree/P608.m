//
//  P608.m
//  DS
//
//  Created by Kiruthika on 14/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Given a table tree, id is identifier of the tree node and p_id is its parent node's id.
//
//+----+------+
//| id | p_id |
//+----+------+
//| 1  | null |
//| 2  | 1    |
//| 3  | 1    |
//| 4  | 2    |
//| 5  | 2    |
//+----+------+
//Each node in the tree can be one of three types:
//Leaf: if the node is a leaf node.
//Root: if the node is the root of the tree.
//Inner: If the node is neither a leaf node nor a root node.
//
//
//Write a query to print the node id and the type of the node. Sort your output by the node id. The result for the above sample is:
//
//
//+----+------+
//| id | Type |
//+----+------+
//| 1  | Root |
//| 2  | Inner|
//| 3  | Leaf |
//| 4  | Leaf |
//| 5  | Leaf |
//+----+------+

#import "P608.h"

@implementation P608

- (NSMapTable *)getTypeTable:(NSMapTable *)table
{
    NSMapTable *typeTable = [[NSMapTable alloc] init];
    NSArray *parents = table.dictionaryRepresentation.allValues;
    
    for (NSNumber *key in table.keyEnumerator) {
        NSNumber *parent = [table objectForKey:key];
        if(parent == [NSNull null])
        {
            [typeTable setObject:@"Root" forKey:key];
        }
        else
        {
            if([parents containsObject:key])
            {
                [typeTable setObject:@"Inner" forKey:key];
            }
            else
            {
                [typeTable setObject:@"Leaf" forKey:key];
                
            }
        }
    }
    return typeTable;
}

+ (void)solution
{
    
    P608 *case1 = [[P608 alloc] init];
    
    NSMapTable *table = [[NSMapTable alloc] init];
    
    NSNumber *one = [NSNumber numberWithInteger:1];
    NSNumber *two = [NSNumber numberWithInteger:2];
    NSNumber *three = [NSNumber numberWithInteger:3];
    NSNumber *four = [NSNumber numberWithInteger:4];
    NSNumber *five = [NSNumber numberWithInteger:5];
    
    [table setObject:[NSNull null] forKey:one];
    [table setObject:one forKey:two];
    [table setObject:one forKey:three];
    [table setObject:two forKey:four];
    [table setObject:two forKey:five];
    
    NSMapTable *typeTable = [case1 getTypeTable:table];
    NSLog(@"%@",typeTable.dictionaryRepresentation);
}

@end

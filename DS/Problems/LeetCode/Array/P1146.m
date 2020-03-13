//
//  P1146.m
//  DS
//
//  Created by Kiruthika on 13/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/snapshot-array/
//Implement a SnapshotArray that supports the following interface:
//
//SnapshotArray(int length) initializes an array-like data structure with the given length.  Initially, each element equals 0.
//void set(index, val) sets the element at the given index to be equal to val.
//int snap() takes a snapshot of the array and returns the snap_id: the total number of times we called snap() minus 1.
//int get(index, snap_id) returns the value at the given index, at the time we took the snapshot with the given snap_id
//
//
//Example 1:
//
//Input: ["SnapshotArray","set","snap","set","get"]
//[[3],[0,5],[],[0,6],[0,0]]
//Output: [null,null,0,null,5]
//Explanation:
//SnapshotArray snapshotArr = new SnapshotArray(3); // set the length to be 3
//snapshotArr.set(0,5);  // Set array[0] = 5
//snapshotArr.snap();  // Take a snapshot, return snap_id = 0
//snapshotArr.set(0,6);
//snapshotArr.get(0,0);  // Get the value of array[0] with snap_id = 0, return 5

#import "P1146.h"

@interface P1146()

@property (nonatomic) NSMutableArray *arr;
@property (nonatomic) NSInteger snapID;
@end

@implementation P1146

- (instancetype)initWithLength:(NSInteger)length
{
    self = [super init];
    if(self)
    {
        self.arr = [NSMutableArray array];
        self.snapID = 0;
        
        for(int i = 0; i < length; i++)
        {
            [self.arr addObject:@{[NSNumber numberWithInteger:_snapID] : @0}];
        }
    }
    return self;
}

- (void)setValue:(NSNumber *)value atIndex:(NSInteger)index
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.arr[index]];
    [dict setObject:value forKey:[NSNumber numberWithInteger:_snapID]];
    self.arr[index] = dict;
}

- (NSInteger)takeSnapShot
{
    return self.snapID++;
}

- (NSNumber *)getValueAtIndex:(NSInteger)index atSnapID:(NSInteger)snapID
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.arr[index]];
    for (NSInteger i = snapID; i >= 0; i--) {
        NSNumber *val = [dict objectForKey:[NSNumber numberWithInteger:i]];
        if(val)
        {
            return val;
        }
    }
    return @0;
}

+ (void)solution
{
    P1146 *case1 = [[P1146 alloc] initWithLength:3];
    
    [case1 setValue:@5 atIndex:0];
    NSInteger snapID = [case1 takeSnapShot];
    
    [case1 setValue:@6 atIndex:0];
    [case1 setValue:@16 atIndex:1];
    [case1 setValue:@26 atIndex:0];
    snapID = [case1 takeSnapShot];
    
    [case1 setValue:@36 atIndex:0];
    [case1 setValue:@46 atIndex:0];
    snapID = [case1 takeSnapShot];
    
    NSLog(@"%@", [case1 getValueAtIndex:1 atSnapID:snapID]);
}
@end

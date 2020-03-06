//
//  P215.m
//  DS
//
//  Created by Kiruthika on 06/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/kth-largest-element-in-an-array/
//Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
//
//Example 1:
//
//Input: [3,2,1,5,6,4] and k = 2
//Output: 5
//Example 2:
//
//Input: [3,2,3,1,2,4,5,5,6] and k = 4
//Output: 4
//Note:
//You may assume k is always valid, 1 ≤ k ≤ array's length.

#import "P215.h"
#import "MaxHeap.h"

@implementation P215

- (NSNumber *)findKLargest:(NSArray *)arr k:(NSInteger)k
{
    MaxHeap *heap = [[MaxHeap alloc] initWithArray:arr];
    
    NSNumber *currentMax;
    for (int i = 0; i < k; i++) {
        currentMax = [heap extractMax];
    }
    return currentMax;
    
//    //If k is distinct elements
//    NSNumber *prevMax = [heap extractMax];
//    NSNumber *currentMax;
//       for (int i = 1; i < k;) {
//
//           currentMax = [heap extractMax];
//           if(prevMax.integerValue != currentMax.integerValue)
//           {
//               i++;
//           }
//           prevMax = currentMax;
//       }
//       return prevMax;
}

+ (void)solution
{
    P215 *case1 = [[P215 alloc] init];
    NSLog(@"%@", [case1 findKLargest:@[@3,@2,@1,@5,@6,@4] k:2]);
    
    P215 *case2 = [[P215 alloc] init];
    NSLog(@"%@", [case2 findKLargest:@[@3,@2,@3,@1,@2,@4,@5,@5,@6] k:4]);
    
}
@end

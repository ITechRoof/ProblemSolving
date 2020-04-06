//
//  PriorityQueue.m
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "PriorityQueue.h"

@interface PriorityQueue()

@property (nonatomic) NSMutableArray<Pair *> *arr;

@end

@implementation PriorityQueue

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.arr = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)parentOfIndex:(NSInteger)index
{
    if(index == 0)
    {
        return -1;
    }
    return (index - 1)/ 2;
}

- (NSInteger)leftChildOfIndex:(NSInteger)index
{
    NSInteger left = 2 * index + 1;
    return  left >= self.arr.count ? - 1 : left;
}

- (NSInteger)rightChildOfIndex:(NSInteger)index
{
    NSInteger right = 2 * index + 2;
    return  right >= self.arr.count ? - 1 : right;
}

- (void)push:(Pair *)data
{
    [self.arr addObject:data];
    
    NSInteger index = self.arr.count - 1;
    NSInteger parentIndex = [self parentOfIndex:index];
    
    while(parentIndex != -1)
    {
        if(self.arr[index].count > self.arr[parentIndex].count)
        {
            Pair *temp = self.arr[parentIndex];
            self.arr[parentIndex] = self.arr[index];
            self.arr[index] = temp;
            index = parentIndex;
            parentIndex = [self parentOfIndex:index];
        }
        else
        {
            break;
        }
    }
}
- (BOOL)isEmpty
{
    return self.arr.count == 0;
}

- (Pair *)extractMax
{
    Pair *max = [self.arr firstObject];
    
    NSInteger index = 0;
    self.arr[index] = self.arr.lastObject;
    
    NSInteger leftIndex = [self leftChildOfIndex:index];
    NSInteger rightIndex = [self rightChildOfIndex:index];
    
    while(leftIndex != -1 || rightIndex != -1)
    {
        NSInteger maxIndex = [self findMaxIndex:index];
        
        if(maxIndex != NSIntegerMax)
        {
            Pair *temp = self.arr[index];
            self.arr[index] = self.arr[maxIndex];
            self.arr[maxIndex] = temp;
            
            index = maxIndex;
            leftIndex = [self leftChildOfIndex:index];
            rightIndex = [self rightChildOfIndex:index];
        }
        else
        {
            break;
        }
    }
    [self.arr removeLastObject];
    
    return max;
}

- (NSInteger)findMaxIndex:(NSInteger)index
{
    NSInteger leftIndex = [self leftChildOfIndex:index];
    NSInteger rightIndex = [self rightChildOfIndex:index];
    NSInteger maxIndex = NSIntegerMax;
    
    if(leftIndex != -1 || rightIndex != -1)
    {
        if(leftIndex != -1 && rightIndex != -1)
        {
            if(self.arr[leftIndex].count >= self.arr[rightIndex].count && self.arr[leftIndex].count >= self.arr[index].count)
            {
                maxIndex = leftIndex;
            }
            else if(self.arr[rightIndex].count >= self.arr[leftIndex].count && self.arr[rightIndex].count >= self.arr[index].count)
            {
                maxIndex = rightIndex;
            }
        }
        else if(leftIndex != -1)
        {
            if(self.arr[leftIndex].count >= self.arr[index].count)
            {
                maxIndex = leftIndex;
            }
        }
        else
        {
            if(self.arr[rightIndex].count >= self.arr[index].count)
            {
                maxIndex = rightIndex;
            }
        }
    }
    return maxIndex;
}

- (void)maxHeapify:(NSInteger)index
{
    NSInteger maxIndex = [self findMaxIndex:index];
    
    if(maxIndex != NSIntegerMax)
    {
        Pair *temp = self.arr[index];
        self.arr[index] = self.arr[maxIndex];
        self.arr[maxIndex] = temp;
        [self maxHeapify:maxIndex];
    }
    else
    {
        return;
    }
}
- (void)heapify:(NSArray *)arr
{
    self.arr = [NSMutableArray arrayWithArray:arr];
    
    for(NSInteger index = (self.arr.count - 1) / 2; index >= 0; index--)
    {
        [self maxHeapify:index];
    }
}
- (void)printHeap
{
    NSLog(@"%@", self.arr);
}

@end

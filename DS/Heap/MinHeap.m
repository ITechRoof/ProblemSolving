//
//  MinHeap.m
//  DS
//
//  Created by Kiruthika on 04/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "MinHeap.h"

@interface MinHeap()

@property (nonatomic) NSMutableArray<NSNumber *> *arr;

@end

@implementation MinHeap

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

- (void)push:(NSNumber *)data
{
    [self.arr addObject:data];
    
    NSInteger index = self.arr.count - 1;
    NSInteger parentIndex = [self parentOfIndex:index];
    
    while(parentIndex != -1)
    {
        if(self.arr[index].integerValue < self.arr[parentIndex].integerValue)
        {
            NSNumber *temp = self.arr[parentIndex];
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

- (NSNumber *)extractMin
{
    NSNumber *min = [self.arr firstObject];
    
    NSInteger index = 0;
    self.arr[index] = self.arr.lastObject;
    
    NSInteger leftIndex = [self leftChildOfIndex:index];
    NSInteger rightIndex = [self rightChildOfIndex:index];
    
    while(leftIndex != -1 || rightIndex != -1)
    {
        NSInteger minIndex = [self findMinIndex:index];
        
        if(minIndex != NSIntegerMax)
        {
            NSNumber *temp = self.arr[index];
            self.arr[index] = self.arr[minIndex];
            self.arr[minIndex] = temp;
            
            index = minIndex;
            leftIndex = [self leftChildOfIndex:index];
            rightIndex = [self rightChildOfIndex:index];
        }
        else
        {
            break;
        }
    }
    [self.arr removeLastObject];
    
    return min;
}

- (void)printHeap
{
    NSLog(@"%@", self.arr);
}

- (NSInteger)findMinIndex:(NSInteger)index
{
    NSInteger leftIndex = [self leftChildOfIndex:index];
    NSInteger rightIndex = [self rightChildOfIndex:index];
    NSInteger minIndex = NSIntegerMax;
    if(leftIndex != -1 || rightIndex != -1)
    {
        if(leftIndex != -1 && rightIndex != -1)
        {
            if(self.arr[leftIndex].integerValue < self.arr[rightIndex].integerValue && self.arr[leftIndex].integerValue < self.arr[index].integerValue)
            {
                minIndex = leftIndex;
            }
            else if(self.arr[rightIndex].integerValue < self.arr[leftIndex].integerValue && self.arr[rightIndex].integerValue < self.arr[index].integerValue)
            {
                minIndex = rightIndex;
            }
        }
        else if(leftIndex != -1)
        {
            if(self.arr[leftIndex].integerValue < self.arr[index].integerValue)
            {
                minIndex = leftIndex;
            }
        }
        else
        {
            if(self.arr[rightIndex].integerValue < self.arr[index].integerValue)
            {
                minIndex = rightIndex;
            }
        }
    }
    return minIndex;
}

- (void)minHeapify:(NSInteger)index
{
    NSInteger minIndex = [self findMinIndex:index];
    
    if(minIndex != NSIntegerMax)
    {
        NSNumber *temp = self.arr[index];
        self.arr[index] = self.arr[minIndex];
        self.arr[minIndex] = temp;
        [self minHeapify:minIndex];
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
        [self minHeapify:index];
    }
}

+ (void)heapImplementation
{
//    MinHeap *heap = [[MinHeap alloc] init];
//
//    [heap push:@44];
//    [heap push:@33];
//    [heap push:@77];
//    [heap push:@11];
//    [heap push:@55];
//    [heap push:@88];
//    [heap push:@66];
//    [heap push:@22];
//
//    [heap printHeap];
//
//    NSLog(@"%@", [heap extractMin]);
//    NSLog(@"%@", [heap extractMin]);
    
//    [heap printHeap];
    
    MinHeap *heap1 = [[MinHeap alloc] init];
    [heap1 heapify:@[@44, @33, @77, @11, @55, @88, @66, @22]];
    [heap1 printHeap];
}
@end

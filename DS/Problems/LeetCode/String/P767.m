//
//  P767.m
//  DS
//
//  Created by Kiruthika on 05/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/reorganize-string/
//Given a string S, check if the letters can be rearranged so that two characters that are adjacent to each other are not the same.
//
//If possible, output any possible result.  If not possible, return the empty string.
//
//Example 1:
//
//Input: S = "aab"
//Output: "aba"
//Example 2:
//
//Input: S = "aaab"
//Output: ""
//Note:
//
//S will consist of lowercase letters and have length in range [1, 500].

#import "P767.h"

@interface Pair: NSObject

@property (nonatomic) char ch;
@property (nonatomic) NSInteger count;

@end

@implementation Pair
@end

@interface PriorityQueue: NSObject

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

@implementation P767
- (NSString *)reorganizeString:(NSString *)str
{
    NSInteger count[26];
    for(NSInteger i = 0; i < 26; i++)
    {
        count[i] = 0;
    }
        
    for (int i = 0; i < str.length; i++) {
        count[[str characterAtIndex:i] - 'a']++;
    }
    PriorityQueue *queue = [[PriorityQueue alloc] init];
    for(NSInteger i = 0; i < 26; i++)
    {
        if(count[i] > (str.length + 1) / 2)
        {
            return @"";
        }
        if(count[i] > 0)
        {
            Pair *p = [[Pair alloc] init];
            p.count = count[i];
            p.ch = i + 'a';
            [queue push:p];
        }
        count[i] = 0;
    }
    
    NSString *res = @"";
    
    while (res.length != str.length) {
        Pair *top = [queue extractMax];
        if(res.length == 0 || top.ch != [res characterAtIndex:res.length - 1])
        {
            res = [res stringByAppendingFormat:@"%c", top.ch];
            top.count--;
        }
        else
        {
            Pair *secondMax = [queue extractMax];
            res = [res stringByAppendingFormat:@"%c", secondMax.ch];
            secondMax.count--;
            if (secondMax.count > 0) {
                 [queue push:secondMax];
            }
        }
        if(top.count > 0)
        {
            [queue push:top];
        }
    }
    
    return res;
}

+ (void)solution
{
    P767 *case1 = [[P767 alloc] init];
    NSLog(@"%@", [case1 reorganizeString:@"aab"]);
    NSLog(@"%@", [case1 reorganizeString:@"aaaaabbbbbcc"]);
}
@end

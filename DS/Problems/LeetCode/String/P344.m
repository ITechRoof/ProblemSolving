//
//  P344.m
//  DS
//
//  Created by Kiruthika on 14/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

// https://leetcode.com/problems/reverse-string/
// Write a function that reverses a string. The input string is given as an array of characters char[].
//
// Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
// You may assume all the characters consist of printable ascii characters.
//
//
//
// Example 1:
//
// Input: ["h","e","l","l","o"]
// Output: ["o","l","l","e","h"]
// Example 2:
//
// Input: ["H","a","n","n","a","h"]
// Output: ["h","a","n","n","a","H"]

#import "P344.h"

@implementation P344

- (NSArray *)reverseArray:(NSArray<NSString *> *)str
{
    NSMutableArray *arr = [NSMutableArray arrayWithArray:str];
    for (size_t i = 0, j = arr.count - 1; i < j; i++, j--) {
        NSString *temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    return arr;
}

+ (void)solution
{
    P344 *case1 = [[P344 alloc] init];
    NSLog(@"%@", [case1 reverseArray:@[@"h", @"e",@"l",@"l",@"o"]]);
}

@end

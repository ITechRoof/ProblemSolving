//
//  P443.m
//  DS
//
//  Created by Kiruthika on 16/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/string-compression/
//Given an array of characters, compress it in-place.
//
//The length after compression must always be smaller than or equal to the original array.
//
//Every element of the array should be a character (not int) of length 1.
//
//After you are done modifying the input array in-place, return the new length of the array.
//
//
//Follow up:
//Could you solve it using only O(1) extra space?
//
//
//Example 1:
//
//Input:
//["a","a","b","b","c","c","c"]
//
//Output:
//Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
//
//Explanation:
//"aa" is replaced by "a2". "bb" is replaced by "b2". "ccc" is replaced by "c3".
//
//
//Example 2:
//
//Input:
//["a"]
//
//Output:
//Return 1, and the first 1 characters of the input array should be: ["a"]
//
//Explanation:
//Nothing is replaced.
//
//
//Example 3:
//
//Input:
//["a","b","b","b","b","b","b","b","b","b","b","b","b"]
//
//Output:
//Return 4, and the first 4 characters of the input array should be: ["a","b","1","2"].
//
//Explanation:
//Since the character "a" does not repeat, it is not compressed. "bbbbbbbbbbbb" is replaced by "b12".
//Notice each digit has it's own entry in the array.
//

#import "P443.h"

@implementation P443

- (NSInteger)lengthOfCompressedArray:(NSArray<NSString *> *)arr
{
    NSMutableArray *cArr = [NSMutableArray array];
    NSInteger count = 1;
    NSString *temp = [arr firstObject];
    [cArr addObject:temp];
    
    for (int i = 1; i < arr.count; i++) {
        if([temp isEqualToString:arr[i]])
        {
            count++;
        }
        else
        {
            cArr = [NSMutableArray arrayWithArray:[self updateCount:count arr:cArr]];
            count = 1;
            temp = arr[i];
            [cArr addObject:temp];
        }
    }
    cArr = [NSMutableArray arrayWithArray:[self updateCount:count arr:cArr]];
    
    return cArr.count;
}

- (NSArray *)updateCount:(NSInteger)count arr:(NSArray *)arr
{
    NSMutableArray *temp = [NSMutableArray array];
    
    if(count > 1)
    {
        while (count >= 0)
        {
            [temp addObject:[NSNumber numberWithInteger:count % 10]];
            count = count > 10 ? count / 10 : -1;
        }
    }
    NSMutableArray *updatedArr = [NSMutableArray arrayWithArray:arr];
    [updatedArr addObjectsFromArray:[[temp reverseObjectEnumerator] allObjects]];
    
    return updatedArr;
}

+ (void)solution
{
    P443 *case1 = [[P443 alloc] init];
    NSLog(@"%ld", (long)[case1 lengthOfCompressedArray:@[@"a",@"a",@"b",@"b",@"c",@"c",@"c"]]);
    NSLog(@"%ld", (long)[case1 lengthOfCompressedArray:@[@"a"]]);
    NSLog(@"%ld", (long)[case1 lengthOfCompressedArray:@[@"a",@"b",@"b",@"b",@"b",@"b",@"b",@"b",@"b",@"b",@"b",@"b",@"b"]]);
}
@end

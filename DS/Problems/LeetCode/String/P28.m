//
//  P28.m
//  DS
//
//  Created by Kiruthika on 28/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/implement-strstr/
//Implement strStr().
//
//Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//
//Example 1:
//
//Input: haystack = "hello", needle = "ll"
//Output: 2
//Example 2:
//
//Input: haystack = "aaaaa", needle = "bba"
//Output: -1
//Clarification:
//
//What should we return when needle is an empty string? This is a great question to ask during an interview.
//
//For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

#import "P28.h"

@implementation P28

- (NSInteger)strStr:(NSString *)hayStack needle:(NSString *)needle
{
    if(needle.length == 0)
    {
        return 0;
    }
    for (NSInteger i = 0; i < hayStack.length - needle.length + 1; i++) {
        NSString *current = [hayStack substringWithRange:NSMakeRange(i, needle.length)];
        if([current isEqualToString:needle])
        {
            return i;
        }
    }
    return -1;
}

+ (void)solution
{
    P28 *case1 = [[P28 alloc] init];
    NSLog(@"%ld", (long)[case1 strStr:@"hello" needle:@"ll"]);
    NSLog(@"%ld", (long)[case1 strStr:@"aaaaa" needle:@"bba"]);

}
@end

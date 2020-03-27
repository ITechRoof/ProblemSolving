//
//  P709.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/to-lower-case/
//Implement function ToLowerCase() that has a string parameter str, and returns the same string in lowercase.
//
//Example 1:
//
//Input: "Hello"
//Output: "hello"
//Example 2:
//
//Input: "here"
//Output: "here"
//Example 3:
//
//Input: "LOVELY"
//Output: "lovely"

#import "P709.h"

@implementation P709

- (NSString *)toLowerCase:(NSString *)str
{
    NSString *res = @"";
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        NSInteger i = c - 'A';
        if(i < 26 && i >= 0)
        {
            c = 'a' + i;
        }
        res = [res stringByAppendingFormat:@"%c", c];
    }
    return res;
//    return str.lowercaseString;
}

+ (void)solution
{
    P709 *case1 = [[P709 alloc] init];
    NSLog(@"%@", [case1 toLowerCase:@"Hello"]);
    NSLog(@"%@", [case1 toLowerCase:@"here"]);
    NSLog(@"%@", [case1 toLowerCase:@"LOVELY"]);
}

@end

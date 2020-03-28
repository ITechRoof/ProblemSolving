//
//  P686.m
//  DS
//
//  Created by Kiruthika on 28/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/repeated-string-match/
//Given two strings A and B, find the minimum number of times A has to be repeated such that B is a substring of it. If no such solution, return -1.
//
//For example, with A = "abcd" and B = "cdabcdab".
//
//Return 3, because by repeating A three times (“abcdabcdabcd”), B is a substring of it; and B is not a substring of A repeated two times ("abcdabcd").
//
//Note:
//The length of A and B will be between 1 and 10000.

#import "P686.h"

@implementation P686
- (NSInteger)repeatedStringMatch:(NSString *)A B:(NSString *)B
{
    NSString *s = A;
    NSInteger i = 1;
    for (;s.length < B.length;i++)
    {
        s = [s stringByAppendingString:A];
    }
    if([s containsString:B])
    {
        return i;
    }
     s = [s stringByAppendingString:A];
    if([s containsString:B])
    {
        return i + 1;
    }
     
    return -1;
}

+ (void)solution
{
    P686 *case1 = [[P686 alloc] init];
    NSLog(@"%ld", (long)[case1 repeatedStringMatch:@"abcd" B:@"cdabcdab"]);
}
@end

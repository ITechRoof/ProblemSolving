//
//  P557.m
//  DS
//
//  Created by Kiruthika on 18/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/reverse-words-in-a-string-iii/
//Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
//
//Example 1:
//Input: "Let's take LeetCode contest"
//Output: "s'teL ekat edoCteeL tsetnoc"
//Note: In the string, each word is separated by single space and there will not be any extra space in the string.

#import "P557.h"

@implementation P557

- (NSString *)reverseString:(NSString *)str
{
    NSString *result = @"";
    NSArray *arr = [str componentsSeparatedByString:@" "];
    for (NSString *word in arr) {
        for (NSInteger i = word.length - 1; i >= 0; i--) {
            result = [result stringByAppendingString:[NSString stringWithFormat:@"%c", [word characterAtIndex:i]]];
        }
        result = [result stringByAppendingString:@" "];
    }
    return result;
}

+ (void)solution
{
    P557 *case1 = [[P557 alloc] init];
    NSLog(@"%@", [case1 reverseString:@"Let's take LeetCode contest"]);
}
@end

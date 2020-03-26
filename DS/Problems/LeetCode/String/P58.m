//
//  P58.m
//  DS
//
//  Created by Kiruthika on 26/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/length-of-last-word/
//Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word (last word means the last appearing word if we loop from left to right) in the string.
//
//If the last word does not exist, return 0.
//
//Note: A word is defined as a maximal substring consisting of non-space characters only.
//
//Example:
//
//Input: "Hello World"
//Output: 5

#import "P58.h"

@implementation P58

- (NSInteger)lengthOfLastWord:(NSString *)str
{
    NSString *s = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    for (NSInteger i = s.length - 1; i >= 0; i--) {
        if([s characterAtIndex:i] == ' ')
        {
            return s.length - 1 - i;
        }
    }
    return 0;
}

+ (void)solution
{
    P58 *case1 = [[P58 alloc] init];
    NSLog(@"%ld", (long)[case1 lengthOfLastWord:@"Hello World"]);
}

@end

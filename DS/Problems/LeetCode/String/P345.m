//
//  P345.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/reverse-vowels-of-a-string/
//Write a function that takes a string as input and reverse only the vowels of a string.
//
//Example 1:
//
//Input: "hello"
//Output: "holle"
//Example 2:
//
//Input: "leetcode"
//Output: "leotcede"
//Note:
//The vowels does not include the letter "y".

#import "P345.h"

@implementation P345

- (BOOL)isVowel:(char)c
{
    if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U')
    {
        return YES;
    }
    return NO;
}

- (NSString *)reverseVowels:(NSString *)str
{
    for (NSInteger i = 0, j = str.length - 1; i < j;) {
        char charI = [str characterAtIndex:i];
        char charJ = [str characterAtIndex:j];

        if(![self isVowel:charI])
        {
            i++;
        }
        else if(![self isVowel:charJ])
        {
            j--;
        }
        else
        {
            str = [str stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", charJ]];
            str = [str stringByReplacingCharactersInRange:NSMakeRange(j, 1) withString:[NSString stringWithFormat:@"%c", charI]];
            i++;
            j--;
        }
    }
    return str;
}

+ (void)solution
{
    P345 *case1 = [[P345 alloc] init];
    NSLog(@"%@", [case1 reverseVowels:@"hello"]);
    NSLog(@"%@", [case1 reverseVowels:@"leetcode"]);
}

@end

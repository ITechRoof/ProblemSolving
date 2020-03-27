//
//  P917.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/reverse-only-letters/
//Given a string S, return the "reversed" string where all characters that are not a letter stay in the same place, and all letters reverse their positions.
//
//
//
//Example 1:
//
//Input: "ab-cd"
//Output: "dc-ba"
//Example 2:
//
//Input: "a-bC-dEf-ghIj"
//Output: "j-Ih-gfE-dCba"
//Example 3:
//
//Input: "Test1ng-Leet=code-Q!"
//Output: "Qedo1ct-eeLg=ntse-T!"
//
//
//Note:
//
//S.length <= 100
//33 <= S[i].ASCIIcode <= 122
//S doesn't contain \ or "

#import "P917.h"

@implementation P917

- (BOOL)isAlphabet:(char)c
{
    if((c - 'A' >= 0 && c - 'Z' <= 26) || (c - 'a' >= 0 && c - 'z' <= 26))
    {
        return YES;
    }
    return NO;
}
- (NSString *)reverseOnlyLetters:(NSString *)str
{
    for (NSInteger i = 0, j = str.length - 1; i < j;) {
        char charI = [str characterAtIndex:i];
        char charJ = [str characterAtIndex:j];

        if(![self isAlphabet:charI])
        {
            i++;
        }
        else if(![self isAlphabet:charJ])
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
    P917 *case1 = [[P917 alloc] init];
    NSLog(@"%@", [case1 reverseOnlyLetters:@"ab-cd"]);
    NSLog(@"%@", [case1 reverseOnlyLetters:@"a-bC-dEf-ghIj"]);
    NSLog(@"%@", [case1 reverseOnlyLetters:@"Test1ng-Leet=code-Q!"]);
}
@end

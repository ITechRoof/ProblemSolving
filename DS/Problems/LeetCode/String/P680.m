//
//  P680.m
//  DS
//
//  Created by Kiruthika on 28/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//
//https://leetcode.com/problems/valid-palindrome-ii/
//Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.
//
//Example 1:
//Input: "aba"
//Output: True
//Example 2:
//Input: "abca"
//Output: True
//Explanation: You could delete the character 'c'.
//Note:
//The string will only contain lowercase characters a-z. The maximum length of the string is 50000.

#import "P680.h"

@implementation P680
- (BOOL)validPalindrome:(NSString *)str
{
    BOOL isCharDeleted = NO;
    for (NSInteger i = 0, j = str.length - 1; i < j;)
    {
        char charI = [str characterAtIndex:i];
        char charJ = [str characterAtIndex:j];
        
        if(charI == charJ)
        {
            i++;
            j--;
        }
        else if(!isCharDeleted)
        {
            if(j > 0 && charI == [str characterAtIndex:j - 1])
            {
                j--;
            }
            else if(i < str.length - 1 && charJ == [str characterAtIndex:i + 1])
            {
                i++;
            }
            else
            {
                 return NO;
            }
            isCharDeleted = YES;
        }
        else
        {
            return NO;
        }
    }
    return YES;
}

+ (void)solution
{
    P680 *case1 = [[P680 alloc] init];
    [case1 validPalindrome:@"aba"] ? NSLog(@"Palindrome") : NSLog(@"Not Palindrome");
    [case1 validPalindrome:@"abca"] ? NSLog(@"Palindrome") : NSLog(@"Not Palindrome");
    [case1 validPalindrome:@"acdbefdca"] ? NSLog(@"Palindrome") : NSLog(@"Not Palindrome");
    [case1 validPalindrome:@"fbab"] ? NSLog(@"Palindrome") : NSLog(@"Not Palindrome");
}
@end

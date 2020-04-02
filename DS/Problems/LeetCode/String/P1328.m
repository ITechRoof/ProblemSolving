//
//  P1328.m
//  DS
//
//  Created by Kiruthika on 02/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/break-a-palindrome/
//Given a palindromic string palindrome, replace exactly one character by any lowercase English letter so that the string becomes the lexicographically smallest possible string that isn't a palindrome.
//
//After doing so, return the final string.  If there is no way to do so, return the empty string.
//
//
//
//Example 1:
//
//Input: palindrome = "abccba"
//Output: "aaccba"
//Example 2:
//
//Input: palindrome = "a"
//Output: ""
//
//
//Constraints:
//
//1 <= palindrome.length <= 1000
//palindrome consists of only lowercase English letters.

#import "P1328.h"

@implementation P1328
- (NSString *)breakPalindrome:(NSString *)str
{
    if(str.length <= 1)
    {
        return @"";
    }
    
    for (NSInteger i = 0, j = str.length - 1; i < j; i++, j--) {
        char c = [str characterAtIndex:i];
        
        if(c == 'a')
        {
            continue;
        }
        else if(i != j)
        {
            return  [str stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"a"];
        }
    }
    return [str stringByReplacingCharactersInRange:NSMakeRange(str.length - 1, 1) withString:@"b"];
}
+ (void)solution
{
    P1328 *case1 = [[P1328 alloc] init];
    NSLog(@"%@", [case1 breakPalindrome:@"abccba"]);
    NSLog(@"%@", [case1 breakPalindrome:@"a"]);
    NSLog(@"%@", [case1 breakPalindrome:@"abba"]);
    NSLog(@"%@", [case1 breakPalindrome:@"aaa"]);
}
@end

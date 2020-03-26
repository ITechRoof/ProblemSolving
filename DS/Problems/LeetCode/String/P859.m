//
//  P859.m
//  DS
//
//  Created by Kiruthika on 26/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/buddy-strings/
//Given two strings A and B of lowercase letters, return true if and only if we can swap two letters in A so that the result equals B.
//
//
//
//Example 1:
//
//Input: A = "ab", B = "ba"
//Output: true
//Example 2:
//
//Input: A = "ab", B = "ab"
//Output: false
//Example 3:
//
//Input: A = "aa", B = "aa"
//Output: true
//Example 4:
//
//Input: A = "aaaaaaabc", B = "aaaaaaacb"
//Output: true
//Example 5:
//
//Input: A = "", B = "aa"
//Output: false
//
//
//Note:
//
//0 <= A.length <= 20000
//0 <= B.length <= 20000
//A and B consist only of lowercase letters.

#import "P859.h"

@implementation P859

- (BOOL)buddyStrings:(NSString *)str1 string:(NSString *)str2
{
    if(str1.length != str2.length)
    {
        return NO;
    }
    
    NSInteger s1Map[26];
    
    for (NSInteger i = 0; i < 26; i++) {
        s1Map[i] = 0;
    }
    NSInteger firstCharIndex = -1, secondCharIndex = -1;
    for (NSInteger i = 0; i < str1.length; i++) {
        char s1Ch = [str1 characterAtIndex:i];
        s1Map[s1Ch - 'a']++;
        if (s1Ch != [str2 characterAtIndex:i]) {
            if(firstCharIndex == -1)
            {
                firstCharIndex = i;
            }
            else if(secondCharIndex == -1)
            {
                secondCharIndex = i;
            }
            else
            {
                return NO; //More than two char is different;
            }
        }
    }
    
    if([str1 isEqualToString:str2])
    {
        for (NSInteger i = 0; i < 26; i++) {
            if(s1Map[i] > 1)
            {
                return YES;
            }
        }
    }
    return secondCharIndex != -1 && [str1 characterAtIndex:firstCharIndex] == [str2 characterAtIndex:secondCharIndex] && [str1 characterAtIndex:secondCharIndex] == [str2 characterAtIndex:firstCharIndex];
}

+ (void)solution
{
    P859 *case1 = [[P859 alloc] init];
    [case1 buddyStrings:@"ab" string:@"ba"] ?  NSLog(@"Buddy") : NSLog(@"Not Buddy");
    [case1 buddyStrings:@"ab" string:@"ab"] ?  NSLog(@"Buddy") : NSLog(@"Not Buddy");
    [case1 buddyStrings:@"aa" string:@"aa"] ?  NSLog(@"Buddy") : NSLog(@"Not Buddy");
    [case1 buddyStrings:@"aaaaaaabc" string:@"aaaaaaacb"] ?  NSLog(@"Buddy") : NSLog(@"Not Buddy");
    [case1 buddyStrings:@"" string:@"aa"] ?  NSLog(@"Buddy") : NSLog(@"Not Buddy");
}
@end

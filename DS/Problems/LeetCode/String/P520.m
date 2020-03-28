//
//  P520.m
//  DS
//
//  Created by Kiruthika on 28/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/detect-capital/
//Given a word, you need to judge whether the usage of capitals in it is right or not.
//
//We define the usage of capitals in a word to be right when one of the following cases holds:
//
//All letters in this word are capitals, like "USA".
//All letters in this word are not capitals, like "leetcode".
//Only the first letter in this word is capital, like "Google".
//Otherwise, we define that this word doesn't use capitals in a right way.
// 
//
//Example 1:
//
//Input: "USA"
//Output: True
// 
//
//Example 2:
//
//Input: "FlaG"
//Output: False
// 
//
//Note: The input will be a non-empty word consisting of uppercase and lowercase latin letters.

#import "P520.h"

@implementation P520

- (BOOL)isUpperCase:(char)c
{
    if((c - 'A' >= 0 && c - 'A' <= 26))
    {
        return YES;
    }
    return NO;
}

- (BOOL)detectCapitalUse:(NSString *)str
{
    BOOL isAllCapital = NO, isFirstCaps = NO;
    isFirstCaps = [self isUpperCase:[str characterAtIndex:0]];
    for (NSInteger i = 1; i < str.length;i++)
    {
        char ch = [str characterAtIndex:i];
        
        if(i == 1)
        {
            if([self isUpperCase:ch])
            {
                if(isFirstCaps)
                {
                    isAllCapital = YES;
                }
                else
                {
                    return NO;
                }
            }
        }
        else
        {
            if((isAllCapital && ![self isUpperCase:ch]) || (!isAllCapital && [self isUpperCase:ch]))
            {
                return NO;
            }
        }
    }
    return YES;
}

+ (void)solution
{
    P520 *case1 = [[P520 alloc] init];
    [case1 detectCapitalUse:@"USA"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 detectCapitalUse:@"FlaG"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
}

@end

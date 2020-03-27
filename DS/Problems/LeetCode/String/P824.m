//
//  P824.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/goat-latin/
//A sentence S is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.
//
//We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)
//
//The rules of Goat Latin are as follows:
//
//If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
//For example, the word 'apple' becomes 'applema'.
//
//If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
//For example, the word "goat" becomes "oatgma".
//
//Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
//For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
//Return the final sentence representing the conversion from S to Goat Latin.
//
//
//
//Example 1:
//
//Input: "I speak Goat Latin"
//Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
//Example 2:
//
//Input: "The quick brown fox jumped over the lazy dog"
//Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
//
//
//Notes:
//
//S contains only uppercase, lowercase and spaces. Exactly one space between each word.
//1 <= S.length <= 150.

#import "P824.h"

@implementation P824

- (BOOL)isVowel:(char)c
{
    if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U')
    {
        return YES;
    }
    return NO;
}

- (NSString *)toGoatLatin:(NSString *)s
{
    NSString *res = @"";
    NSArray *arr = [s componentsSeparatedByString:@" "];
    
    for (NSInteger i = 0; i < arr.count; i++) {
        
        NSString *current = arr[i];

        char c = [current characterAtIndex:0];
        BOOL isVowel = [self isVowel:c];
        
        if(isVowel)
        {
            current = [current stringByAppendingString:@"ma"];
        }
        else
        {
            current = [[current substringFromIndex:1] stringByAppendingFormat:@"%cma", c];
        }
        
        NSInteger count = i + 1;
        while (count > 0) {
            current = [current stringByAppendingString:@"a"];
            count--;
        }
        res = [res stringByAppendingString:current];
        if(i != arr.count)
        {
            res = [res stringByAppendingString:@" "];
        }
    }
    
    return res;
}

+ (void)solution
{
    P824 *case1 = [[P824 alloc] init];
    NSLog(@"%@", [case1 toGoatLatin:@"I speak Goat Latin"]);
    NSLog(@"%@", [case1 toGoatLatin:@"The quick brown fox jumped over the lazy dog"]);
}

@end

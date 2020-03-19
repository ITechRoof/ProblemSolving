//
//  P394.m
//  DS
//
//  Created by Kiruthika on 19/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/decode-string/
//Given an encoded string, return its decoded string.
//
//The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.
//
//You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.
//
//Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].
//
//Examples:
//
//s = "3[a]2[bc]", return "aaabcbc".
//s = "3[a2[c]]", return "accaccacc".
//s = "2[abc]3[cd]ef", return "abcabccdcdcdef".
//

#import "P394.h"
#import "StackUsingArray.h"

@implementation P394
- (NSString *)decodeString:(NSString *)str
{
    NSString *result = @"";
    StackUsingArray *num = [[StackUsingArray alloc] init];
    StackUsingArray *ch = [[StackUsingArray alloc] init];
    
    BOOL shouldPush = NO;
    for (int i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        if(c >= '0' && c <= '9')
        {
            [num push:[NSNumber numberWithChar:c - '0']];
            if(shouldPush)
            {
                [ch push:[NSNull null]];
            }
        }
        else if(c == '[')
        {
            shouldPush = YES;
        }
        else if(c == ']')
        {
            NSNumber *numTop = [num top];
            [num pop];
            
            NSString *currentStr = @"";
            NSNumber *chTop = [ch top];

            while (![ch isEmpty] && ![chTop isEqual:[NSNull null]]) {
                currentStr = [NSString stringWithFormat:@"%c%@", chTop.charValue, currentStr];
                [ch pop];
                chTop = [ch top];
            }
            
            NSString *temp = @"";
           for (int j = 0; j < numTop.integerValue; j++) {
               temp = [temp stringByAppendingFormat:@"%@",currentStr];
           }
            
            if(![num isEmpty])
            {
                [ch pop];
                for (int j = 0; j < temp.length; j++) {
                    [ch push:[NSNumber numberWithChar:[temp characterAtIndex:j]]];
                }
                shouldPush = YES;
            }
            else
            {
                result = [result stringByAppendingFormat:@"%@",temp];
                shouldPush = NO;
            }
        }
        else //character
        {
            if(shouldPush)
            {
                [ch push:[NSNumber numberWithChar:c]];
            }
            else
            {
                result = [result stringByAppendingFormat:@"%c",c];
            }
        }
    }
    return result;
}

+ (void)solution
{
    P394 *case1 = [[P394 alloc] init];
    NSLog(@"%@", [case1 decodeString:@"3[a]2[bc]"]);
    NSLog(@"%@", [case1 decodeString:@"3[a2[c]]"]);
    NSLog(@"%@", [case1 decodeString:@"2[abc]3[cd]ef"]);

}
@end

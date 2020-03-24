//
//  P1119.m
//  DS
//
//  Created by Kiruthika on 24/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//Given a string S, remove the vowels 'a', 'e', 'i', 'o', and 'u' from it, and return the new string.
//
//Example 1:
//Input: "leetcodeisacommunityforcoders"
//Output: "ltcdscmmntyfrcdrs"
//
//Example 2:
//Input: "aeiou"
//Output: ""
//
//Note:
//1.S consists of lowercase English letters only.
//2.1 <= S.length <= 1000

#import "P1119.h"

@implementation P1119

- (NSString *)removeVowels:(NSString *)str
{
    NSString *res = @"";
    for (NSInteger i = 0; i < str.length; i++) {
        char ch = [str characterAtIndex:i];
        if(!(ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u'))
        {
            res = [res stringByAppendingFormat:@"%c", ch];
        }
    }
    return res;
}

+ (void)solution
{
    P1119 *case1 = [[P1119 alloc] init];
    NSLog(@"%@", [case1 removeVowels:@"leetcodeisacommunityforcoders"]);
    NSLog(@"%@", [case1 removeVowels:@"aeiou"]);
}
@end

//
//  P1071.m
//  DS
//
//  Created by Kiruthika on 21/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/greatest-common-divisor-of-strings/
//For strings S and T, we say "T divides S" if and only if S = T + ... + T  (T concatenated with itself 1 or more times)
//
//Return the largest string X such that X divides str1 and X divides str2.
//
//
//
//Example 1:
//
//Input: str1 = "ABCABC", str2 = "ABC"
//Output: "ABC"
//Example 2:
//
//Input: str1 = "ABABAB", str2 = "ABAB"
//Output: "AB"
//Example 3:
//
//Input: str1 = "LEET", str2 = "CODE"
//Output: ""
//
//
//Note:
//
//1 <= str1.length <= 1000
//1 <= str2.length <= 1000
//str1[i] and str2[i] are English uppercase letters.

#import "P1071.h"

@implementation P1071

- (NSString *)gcdOfA:(NSString *)A B:(NSString *)B
{
    if(![[A stringByAppendingString:B] isEqualToString:[B stringByAppendingString:A]])
    {
        return @"";
    }
    
    if([A isEqualToString:B])
    {
        return A;
    }
    if(A.length > B.length)
    {
        return [self gcdOfA:[A substringFromIndex:B.length] B:B];
    }
    else
    {
        return [self gcdOfA:[B substringFromIndex:A.length] B:A];
    }
}

+ (void)solution
{
    P1071 *case1 = [[P1071 alloc] init];
    NSLog(@"%@", [case1 gcdOfA:@"ABCABC" B:@"ABC"]);
    NSLog(@"%@", [case1 gcdOfA:@"ABABAB" B:@"ABAB"]);
    NSLog(@"%@", [case1 gcdOfA:@"LEET" B:@"CODE"]);
}
@end

//
//  P1003.m
//  DS
//
//  Created by Kiruthika on 03/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/check-if-word-is-valid-after-substitutions/
//We are given that the string "abc" is valid.
//
//From any valid string V, we may split V into two pieces X and Y such that X + Y (X concatenated with Y) is equal to V.  (X or Y may be empty.)  Then, X + "abc" + Y is also valid.
//
//If for example S = "abc", then examples of valid strings are: "abc", "aabcbc", "abcabc", "abcabcababcc".  Examples of invalid strings are: "abccba", "ab", "cababc", "bac".
//
//Return true if and only if the given string S is valid.
//
// 
//
//Example 1:
//
//Input: "aabcbc"
//Output: true
//Explanation:
//We start with the valid string "abc".
//Then we can insert another "abc" between "a" and "bc", resulting in "a" + "abc" + "bc" which is "aabcbc".
//Example 2:
//
//Input: "abcabcababcc"
//Output: true
//Explanation:
//"abcabcabc" is valid after consecutive insertings of "abc".
//Then we can insert "abc" before the last letter, resulting in "abcabcab" + "abc" + "c" which is "abcabcababcc".
//Example 3:
//
//Input: "abccba"
//Output: false
//Example 4:
//
//Input: "cababc"
//Output: false
// 
//
//Note:
//
//1 <= S.length <= 20000
//S[i] is 'a', 'b', or 'c'

#import "P1003.h"

@implementation P1003
- (BOOL)isValid:(NSString *)str
{
    NSString *prev = [str stringByReplacingOccurrencesOfString:@"abc" withString:@""];
    while(prev.length != str.length)
    {
        str = prev;
        prev = [str stringByReplacingOccurrencesOfString:@"abc" withString:@""];
    }
    return prev.length == 0;
}
+ (void)solution
{
    P1003 *case1 = [[P1003 alloc] init];
    [case1 isValid:@"aabcbc"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 isValid:@"abcabcababcc"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 isValid:@"abccba"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 isValid:@"cababc"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 isValid:@"ab"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 isValid:@"cba"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
}
@end

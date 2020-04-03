//
//  P1358.m
//  DS
//
//  Created by Kiruthika on 03/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/
//Given a string s consisting only of characters a, b and c.
//
//Return the number of substrings containing at least one occurrence of all these characters a, b and c.
//
//
//
//Example 1:
//
//Input: s = "abcabc"
//Output: 10
//Explanation: The substrings containing at least one occurrence of the characters a, b and c are "abc", "abca", "abcab", "abcabc", "bca", "bcab", "bcabc", "cab", "cabc" and "abc" (again).
//Example 2:
//
//Input: s = "aaacb"
//Output: 3
//Explanation: The substrings containing at least one occurrence of the characters a, b and c are "aaacb", "aacb" and "acb".
//Example 3:
//
//Input: s = "abc"
//Output: 1
//
//
//Constraints:
//
//3 <= s.length <= 5 x 10^4
//s only consists of a, b or c characters.

#import "P1358.h"

@implementation P1358

- (NSInteger)numberOfSubstrings:(NSString *)str
{
    NSInteger start = 0, end = 0;
    NSInteger count[3], res = 0;

    for (NSInteger i = 0; i < 3; i++) {
        count[i] = 0;
    }

    while (start < str.length) {

        if (count[0] > 0 && count[1] > 0 && count[2] > 0) {
            res = res + str.length - end + 1;
            count[[str characterAtIndex:start] - 'a']--;
            start++;
        }
        else if(end == str.length)
        {
            return res;
        }
        else
        {
            count[[str characterAtIndex:end] - 'a']++;
            end++;
        }
    }
    return res;
}

+ (void)solution
{
    P1358 *case1 = [[P1358 alloc] init];
    NSLog(@"%ld", (long)[case1 numberOfSubstrings:@"abcabc"]);
    NSLog(@"%ld", (long)[case1 numberOfSubstrings:@"aaacb"]);
    NSLog(@"%ld", (long)[case1 numberOfSubstrings:@"abc"]);
}
@end

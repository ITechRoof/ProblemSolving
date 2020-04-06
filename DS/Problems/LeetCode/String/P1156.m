//
//  P1156.m
//  DS
//
//  Created by Kiruthika on 05/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/swap-for-longest-repeated-character-substring/
//Given a string text, we are allowed to swap two of the characters in the string. Find the length of the longest substring with repeated characters.
//
//Example 1:
//
//Input: text = "ababa"
//Output: 3
//Explanation: We can swap the first 'b' with the last 'a', or the last 'b' with the first 'a'. Then, the longest repeated character substring is "aaa", which its length is 3.
//Example 2:
//
//Input: text = "aaabaaa"
//Output: 6
//Explanation: Swap 'b' with the last 'a' (or the first 'a'), and we get longest repeated character substring "aaaaaa", which its length is 6.
//Example 3:
//
//Input: text = "aaabbaaa"
//Output: 4
//Example 4:
//
//Input: text = "aaaaa"
//Output: 5
//Explanation: No need to swap, longest repeated character substring is "aaaaa", length is 5.
//Example 5:
//
//Input: text = "abcdef"
//Output: 1
//
//
//Constraints:
//
//1 <= text.length <= 20000
//text consist of lowercase English characters only.

#import "P1156.h"

@implementation P1156
- (NSInteger)maxRepOpt1:(NSString *)str
{
    NSInteger map[26];
    
    for (NSInteger i = 0; i < 26; i++) {
        map[i] = 0;
    }
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        map[c - 'a']++;
    }
    
    NSInteger max = 0;
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        
        NSInteger j = i;
        NSInteger diffCh = 0;
        NSInteger currentCount = 0;
        while ((j < str.length && (c == [str characterAtIndex:j] || diffCh == 0)) && currentCount < map[c - 'a']) {
            if(c != [str characterAtIndex:j])
            {
                diffCh++; //diff char in between
            }
            currentCount++;
            j++;
        }
        max = MAX(max, currentCount);
    }
    return max;
}

+ (void)solution
{
    P1156 *case1 = [[P1156 alloc] init];
    NSLog(@"%ld", (long)[case1 maxRepOpt1:@"ababa"]);
    NSLog(@"%ld", (long)[case1 maxRepOpt1:@"aaabaaa"]);
    NSLog(@"%ld", (long)[case1 maxRepOpt1:@"aaabbaaa"]);
    NSLog(@"%ld", (long)[case1 maxRepOpt1:@"aaaaa"]);
    NSLog(@"%ld", (long)[case1 maxRepOpt1:@"abcdef"]);
}
@end

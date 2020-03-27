//
//  P1370.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/increasing-decreasing-string/
//Given a string s. You should re-order the string using the following algorithm:
//
//Pick the smallest character from s and append it to the result.
//Pick the smallest character from s which is greater than the last appended character to the result and append it.
//Repeat step 2 until you cannot pick more characters.
//Pick the largest character from s and append it to the result.
//Pick the largest character from s which is smaller than the last appended character to the result and append it.
//Repeat step 5 until you cannot pick more characters.
//Repeat the steps from 1 to 6 until you pick all characters from s.
//In each step, If the smallest or the largest character appears more than once you can choose any occurrence and append it to the result.
//
//Return the result string after sorting s with this algorithm.
//
//
//
//Example 1:
//
//Input: s = "aaaabbbbcccc"
//Output: "abccbaabccba"
//Explanation: After steps 1, 2 and 3 of the first iteration, result = "abc"
//After steps 4, 5 and 6 of the first iteration, result = "abccba"
//First iteration is done. Now s = "aabbcc" and we go back to step 1
//After steps 1, 2 and 3 of the second iteration, result = "abccbaabc"
//After steps 4, 5 and 6 of the second iteration, result = "abccbaabccba"
//Example 2:
//
//Input: s = "rat"
//Output: "art"
//Explanation: The word "rat" becomes "art" after re-ordering it with the mentioned algorithm.
//Example 3:
//
//Input: s = "leetcode"
//Output: "cdelotee"
//Example 4:
//
//Input: s = "ggggggg"
//Output: "ggggggg"
//Example 5:
//
//Input: s = "spo"
//Output: "ops"
//
//
//Constraints:
//
//1 <= s.length <= 500
//s contains only lower-case English letters.

#import "P1370.h"

@implementation P1370

- (NSString *)sortString:(NSString *)s
{
    NSInteger count[26];
    for (NSInteger i = 0; i < 26; i++) {
        count[i] = 0;
    }
    for (NSInteger i = 0; i < s.length; i++) {
        count[[s characterAtIndex:i] - 'a']++;
    }
    
    NSString *res = @"";
    BOOL isLeft = YES;
    for (NSInteger i = 0; res.length != s.length; ) {
        if(count[i] > 0)
        {
            res = [res stringByAppendingFormat:@"%c", (char)(i + 'a')];
            count[i]--;
        }
        
        
        if(isLeft)
        {
            i++;
        }
        else
        {
            i--;
        }
        if(i == 26)
        {
            isLeft = NO;
            i = 25;
            
        }
        else if(i == -1)
        {
            isLeft = YES;
            i = 0;
        }
        
    }
    return res;
}

+ (void)solution
{
    P1370 *case1 = [[P1370 alloc] init];
    NSLog(@"%@", [case1 sortString:@"aaaabbbbcccc"]);
    NSLog(@"%@", [case1 sortString:@"rat"]);
    NSLog(@"%@", [case1 sortString:@"leetcode"]);
    NSLog(@"%@", [case1 sortString:@"ggggggg"]);
    NSLog(@"%@", [case1 sortString:@"spo"]);
    NSLog(@"%@", [case1 sortString:@"zigzagz"]);
}
@end

//
//  P1234.m
//  DS
//
//  Created by Kiruthika on 24/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/replace-the-substring-for-balanced-string/
//You are given a string containing only 4 kinds of characters 'Q', 'W', 'E' and 'R'.
//
//A string is said to be balanced if each of its characters appears n/4 times where n is the length of the string.
//
//Return the minimum length of the substring that can be replaced with any other string of the same length to make the original string s balanced.
//
//Return 0 if the string is already balanced.
//
// 
//
//Example 1:
//
//Input: s = "QWER"
//Output: 0
//Explanation: s is already balanced.
//Example 2:
//
//Input: s = "QQWE"
//Output: 1
//Explanation: We need to replace a 'Q' to 'R', so that "RQWE" (or "QRWE") is balanced.
//Example 3:
//
//Input: s = "QQQW"
//Output: 2
//Explanation: We can replace the first "QQ" to "ER".
//Example 4:
//
//Input: s = "QQQQ"
//Output: 3
//Explanation: We can replace the last 3 'Q' to make s = "QWER".
// 
//
//Constraints:
//
//1 <= s.length <= 10^5
//s.length is a multiple of 4
//s contains only 'Q', 'W', 'E' and 'R'.

#import "P1234.h"

@implementation P1234
- (NSInteger)balancedString:(NSString *)str
{
    NSMutableDictionary<NSString *, NSNumber*> *count = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < str.length; i++) {
        NSString *ch = [NSString stringWithFormat:@"%c",[str characterAtIndex:i]];
        NSNumber *c = [count objectForKey:ch];
        [count setValue:[NSNumber numberWithInteger:c.integerValue + 1] forKey:ch];
    }
    
    NSInteger k = str.length / 4;
    NSInteger result = NSIntegerMax;
    
    int i = 0;
    for (int j = 0; j < str.length; j++) {
        NSString *ch = [NSString stringWithFormat:@"%c",[str characterAtIndex:j]];
        NSNumber *c = [count objectForKey:ch];
        [count setValue:[NSNumber numberWithInteger:c.integerValue - 1] forKey:ch];
        while (i < str.length && [count objectForKey:@"Q"].integerValue <= k && [count objectForKey:@"W"].integerValue <= k && [count objectForKey:@"E"].integerValue <= k && [count objectForKey:@"R"].integerValue <= k) {
            result = MIN(result, j - i + 1);
            
            NSString *ch = [NSString stringWithFormat:@"%c",[str characterAtIndex:i]];
            NSNumber *c = [count objectForKey:ch];
            [count setValue:[NSNumber numberWithInteger:c.integerValue + 1] forKey:ch];
            i++;
        }
    }
    return result;
}
+ (void)solution
{
    P1234 *case1 = [[P1234 alloc] init];
    NSLog(@"%ld", (long)[case1 balancedString:@"QWER"]);
    NSLog(@"%ld", (long)[case1 balancedString:@"QQWE"]);
    NSLog(@"%ld", (long)[case1 balancedString:@"QQQW"]);
    NSLog(@"%ld", (long)[case1 balancedString:@"QQQQ"]);
    NSLog(@"%ld", (long)[case1 balancedString:@"QWERQQRR"]);
}
@end

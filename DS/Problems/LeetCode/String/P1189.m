//
//  P1189.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/maximum-number-of-balloons/
//Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.
//
//You can use each character in text at most once. Return the maximum number of instances that can be formed.
//
//Example 1:
//
//
//
//Input: text = "nlaebolko"
//Output: 1
//Example 2:
//
//
//
//Input: text = "loonbalxballpoon"
//Output: 2
//Example 3:
//
//Input: text = "leetcode"
//Output: 0
// 
//
//Constraints:
//
//1 <= text.length <= 10^4
//text consists of lower case English letters only.

#import "P1189.h"

@implementation P1189
- (NSInteger)maxNumberOfBalloons:(NSString *)str
{
    NSInteger count[26];
    for (NSInteger i = 0; i < 26; i++) {
        count[i] = 0;
    }
    for (NSInteger i = 0; i < str.length; i++) {
        count[[str characterAtIndex:i] - 'a']++;
    }
    
    //a - 1 b - 1 l - 2 o - 2 n - 2
    
    NSInteger result = count['a' - 'a'];
    result = MIN(count['b' - 'a'], result);
    result = MIN(count['l' - 'a'] / 2, result);
    result = MIN(count['o' - 'a'] / 2, result);
    result = MIN(count['n' - 'a'], result);

    return result;
}

+ (void)solution
{
    P1189 *case1 = [[P1189 alloc] init];
    NSLog(@"%ld", (long)[case1 maxNumberOfBalloons:@"nlaebolko"]);
    NSLog(@"%ld", (long)[case1 maxNumberOfBalloons:@"loonbalxballpoon"]);
    NSLog(@"%ld", (long)[case1 maxNumberOfBalloons:@"leetcode"]);
}
@end

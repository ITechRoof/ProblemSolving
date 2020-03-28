//
//  P541.m
//  DS
//
//  Created by Kiruthika on 28/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/reverse-string-ii/
//Given a string and an integer k, you need to reverse the first k characters for every 2k characters counting from the start of the string. If there are less than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and left the other as original.
//Example:
//Input: s = "abcdefg", k = 2
//Output: "bacdfeg"
//Restrictions:
//The string consists of lower English letters only.
//Length of the given string and k will in the range [1, 10000]

#import "P541.h"

@implementation P541
- (NSString *)reverseStr:(NSString *)str K:(NSInteger)K
{
    NSInteger i = 0;
    while (i < str.length) {
        NSInteger j = MIN(i + K - 1, str.length);
        
        while (i < j) {
            //swap
            char charI = [str characterAtIndex:i];
            char charJ = [str characterAtIndex:j];
            str = [str stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", charJ]];
            str = [str stringByReplacingCharactersInRange:NSMakeRange(j, 1) withString:[NSString stringWithFormat:@"%c", charI]];
            j--;
        }
        i = (2 * K) + i;
    }
    return str;
}

+ (void)solution
{
    P541 *case1 = [[P541 alloc] init];
    NSLog(@"%@", [case1 reverseStr:@"abcdefg" K:2]);
}
@end

//
//  P1312.m
//  DS
//
//  Created by Kiruthika on 22/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/
//Given a string s. In one step you can insert any character at any index of the string.
//
//Return the minimum number of steps to make s palindrome.
//
//A Palindrome String is one that reads the same backward as well as forward.
//
//
//
//Example 1:
//
//Input: s = "zzazz"
//Output: 0
//Explanation: The string "zzazz" is already palindrome we don't need any insertions.
//Example 2:
//
//Input: s = "mbadm"
//Output: 2
//Explanation: String can be "mbdadbm" or "mdbabdm".
//Example 3:
//
//Input: s = "leetcode"
//Output: 5
//Explanation: Inserting 5 characters the string becomes "leetcodocteel".
//Example 4:
//
//Input: s = "g"
//Output: 0
//Example 5:
//
//Input: s = "no"
//Output: 1
//
//
//Constraints:
//
//1 <= s.length <= 500
//All characters of s are lower case English letters.

#import "P1312.h"

@implementation P1312

- (NSInteger)minInsertionForPalindrome:(NSString *)str
{
    NSInteger count = 0;
    for (NSInteger i = 0, j = str.length - 1; i < j; ) {
        if([str characterAtIndex:i] == [str characterAtIndex:j])
        {
            i++;
            j--;
        }
        else
        {
            count++;
            i++;
        }
    }
    return count;
}

+ (void)solution
{
    P1312 *case1 = [[P1312 alloc] init];
    NSLog(@"%ld", (long)[case1 minInsertionForPalindrome:@"zzazz"]);
    NSLog(@"%ld", (long)[case1 minInsertionForPalindrome:@"mbadm"]);
    NSLog(@"%ld", (long)[case1 minInsertionForPalindrome:@"leetcode"]);
    NSLog(@"%ld", (long)[case1 minInsertionForPalindrome:@"g"]);
    NSLog(@"%ld", (long)[case1 minInsertionForPalindrome:@"no"]);
}
@end

//
//  P1324.m
//  DS
//
//  Created by Kiruthika on 05/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/print-words-vertically/
//Given a string s. Return all the words vertically in the same order in which they appear in s.
//Words are returned as a list of strings, complete with spaces when is necessary. (Trailing spaces are not allowed).
//Each word would be put on only one column and that in one column there will be only one word.
//
//
//
//Example 1:
//
//Input: s = "HOW ARE YOU"
//Output: ["HAY","ORO","WEU"]
//Explanation: Each word is printed vertically.
// "HAY"
// "ORO"
// "WEU"
//Example 2:
//
//Input: s = "TO BE OR NOT TO BE"
//Output: ["TBONTB","OEROOE","   T"]
//Explanation: Trailing spaces is not allowed.
//"TBONTB"
//"OEROOE"
//"   T"
//Example 3:
//
//Input: s = "CONTEST IS COMING"
//Output: ["CIC","OSO","N M","T I","E N","S G","T"]
//
//
//Constraints:
//
//1 <= s.length <= 200
//s contains only upper case English letters.
//It's guaranteed that there is only one space between 2 words.

#import "P1324.h"

@implementation P1324
- (NSArray *)printVertically:(NSString *)str
{
    NSArray *words = [str componentsSeparatedByString:@" "];
    NSInteger i = 0;
    NSMutableArray *res = [NSMutableArray array];
    while (true) {
        NSString *current = @"", *emptySpace = @"";
        for (NSString *word in words) {
            if(word.length > i)
            {
                current = [current stringByAppendingFormat:@"%@%c", emptySpace, [word characterAtIndex:i]];
                emptySpace = @"";
            }
            else
            {
                emptySpace = [emptySpace stringByAppendingString:@" "];
            }
        }
        if(current.length == 0)
        {
            break;
        }
        i++;
        [res addObject:current];
    }
    return res;
}
+ (void)solution
{
    P1324 *case1 = [[P1324 alloc] init];
    NSLog(@"%@", [case1 printVertically:@"HOW ARE YOU"]);
    NSLog(@"%@", [case1 printVertically:@"TO BE OR NOT TO BE"]);
    NSLog(@"%@", [case1 printVertically:@"CONTEST IS COMING"]);
}
@end

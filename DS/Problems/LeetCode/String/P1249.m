//
//  P1249.m
//  DS
//
//  Created by Kiruthika on 04/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
//Given a string s of '(' , ')' and lowercase English characters.
//
//Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.
//
//Formally, a parentheses string is valid if and only if:
//
//It is the empty string, contains only lowercase characters, or
//It can be written as AB (A concatenated with B), where A and B are valid strings, or
//It can be written as (A), where A is a valid string.
//
//
//Example 1:
//
//Input: s = "lee(t(c)o)de)"
//Output: "lee(t(c)o)de"
//Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
//Example 2:
//
//Input: s = "a)b(c)d"
//Output: "ab(c)d"
//Example 3:
//
//Input: s = "))(("
//Output: ""
//Explanation: An empty string is also valid.
//Example 4:
//
//Input: s = "(a(b(c)d)"
//Output: "a(b(c)d)"
//
//
//Constraints:
//
//1 <= s.length <= 10^5
//s[i] is one of  '(' , ')' and lowercase English letters.


#import "P1249.h"

@implementation P1249
- (NSString *)minRemoveToMakeValid:(NSString *)str
{
    NSInteger open = 0;
    NSMutableArray<NSNumber *> *openIndex = [NSMutableArray array];
    NSMutableArray *deleteIndex = [NSMutableArray array];
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        if(c == '(')
        {
            [openIndex addObject:[NSNumber numberWithInteger:i]];
            open++;
        }
        else if(c == ')')
        {
            if(open > 0)
            {
                open--;
            }
            else
            {
                [deleteIndex addObject:[NSNumber numberWithInteger:i]];
            }
        }
    }
    while (open > 0) {
        BOOL isFound = NO;
        for (NSInteger i = 0; i < deleteIndex.count; i++) {
            NSNumber *index = [deleteIndex objectAtIndex:i];
            if(index.integerValue > openIndex.lastObject.integerValue)
            {
                [deleteIndex insertObject:openIndex.lastObject atIndex:i];
                [openIndex removeLastObject];
                isFound = YES;
                open--;
                break;
            }
        }
        if(!isFound)
        {
            [deleteIndex addObject:openIndex.lastObject];
            [openIndex removeLastObject];
            open--;
        }
    }
    
    while (deleteIndex.count > 0) {
        NSNumber *index = [deleteIndex lastObject];
        str = [str stringByReplacingCharactersInRange:NSMakeRange(index.integerValue, 1) withString:@""];
        [deleteIndex removeLastObject];
    }
    return str;
}

+ (void)solution
{
    P1249 *case1 = [[P1249 alloc] init];
    NSLog(@"%@", [case1 minRemoveToMakeValid:@"lee(t(c)o)de)"]);
    NSLog(@"%@", [case1 minRemoveToMakeValid:@"a)b(c)d"]);
    NSLog(@"%@", [case1 minRemoveToMakeValid:@"))(("]);
    NSLog(@"%@", [case1 minRemoveToMakeValid:@"(a(b(c)d)"]);
}
@end

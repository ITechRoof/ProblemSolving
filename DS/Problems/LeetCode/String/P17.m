//
//  P17.m
//  DS
//
//  Created by Kiruthika on 02/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/letter-combinations-of-a-phone-number/
//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
//
//
//
//Example:
//
//Input: "23"
//Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
//Note:
//
//Although the above answer is in lexicographical order, your answer could be in any order you want.

#import "P17.h"

@implementation P17
- (NSString *)letterForDigit:(char)c
{
    if( c == '2')
    {
        return @"abc";
    }
    else if( c == '3')
    {
        return @"def";
    }
    else if( c == '4')
    {
        return @"ghi";
    }
    else if( c == '5')
    {
        return @"jkl";
    }
    else if( c == '6')
    {
        return @"mno";
    }
    else if( c == '7')
    {
        return @"pqrs";
    }
    else if( c == '8')
    {
        return @"tuv";
    }
    else if( c == '9')
    {
        return @"wxyz";
    }
    else
    {
        return @"";
    }
}

- (void)backtrack:(NSString *)comb digits:(NSString *)digits res:(NSMutableArray **)res
{
    if(digits.length == 0)
    {
        [*res addObject:comb];
        return;
    }
    
    NSString *digitStr = [self letterForDigit:[digits characterAtIndex:0]];
    
    for (NSInteger i = 0; i < digitStr.length; i++) {
        [self backtrack:[comb stringByAppendingFormat:@"%c", [digitStr characterAtIndex:i]] digits:[digits substringFromIndex:1] res:res];
    }
}
- (NSArray *)letterCombinations:(NSString *)str
{
    NSMutableArray *res = [NSMutableArray array];
    [self backtrack:@"" digits:str res:&res];
    return res;
}

+ (void)solution
{
    P17 *case1 = [[P17 alloc] init];
    NSLog(@"%@", [case1 letterCombinations:@"237"]);
}
@end

//
//  P49.m
//  DS
//
//  Created by Kiruthika on 02/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/group-anagrams/
//Given an array of strings, group anagrams together.
//
//Example:
//
//Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
//Output:
//[
//  ["ate","eat","tea"],
//  ["nat","tan"],
//  ["bat"]
//]
//Note:
//
//All inputs will be in lowercase.
//The order of your output does not matter.

#import "P49.h"

@implementation P49
- (NSArray *)groupAnagrams:(NSArray *)arr
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSMutableArray *map = [NSMutableArray array];
    for (NSInteger i = 0; i < 26; i++) {
        [map addObject:@0];
    }
    for (NSString *s in arr) {
        NSMutableArray *currentMap = [map mutableCopy];
        
        for (NSInteger i = 0; i < s.length; i++) {
            char c = [s characterAtIndex:i];
            NSNumber *count = currentMap[c - 'a'];
            currentMap[c - 'a'] = [NSNumber numberWithInteger:count.integerValue + 1];
        }
        
        NSMutableArray *group = [dict objectForKey:currentMap] ?: [NSMutableArray array];
        [group addObject:s];
        [dict setObject:group forKey:currentMap];
    }
    
    NSMutableArray *res = [NSMutableArray array];
    for (NSMutableArray *gp in dict.allValues) {
        [res addObject:gp];
    }
    return res;
}

+ (void)solution
{
    P49 *case1 = [[P49 alloc] init];
    NSLog(@"%@", [case1 groupAnagrams:@[@"eat", @"tea", @"tan", @"ate", @"nat", @"bat"]]);
}
@end

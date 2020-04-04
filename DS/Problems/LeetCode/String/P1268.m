//
//  P1268.m
//  DS
//
//  Created by Kiruthika on 04/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/search-suggestions-system/
//Given an array of strings products and a string searchWord. We want to design a system that suggests at most three product names from products after each character of searchWord is typed. Suggested products should have common prefix with the searchWord. If there are more than three products with a common prefix return the three lexicographically minimums products.
//
//Return list of lists of the suggested products after each character of searchWord is typed.
//
//
//
//Example 1:
//
//Input: products = ["mobile","mouse","moneypot","monitor","mousepad"], searchWord = "mouse"
//Output: [
//["mobile","moneypot","monitor"],
//["mobile","moneypot","monitor"],
//["mouse","mousepad"],
//["mouse","mousepad"],
//["mouse","mousepad"]
//]
//Explanation: products sorted lexicographically = ["mobile","moneypot","monitor","mouse","mousepad"]
//After typing m and mo all products match and we show user ["mobile","moneypot","monitor"]
//After typing mou, mous and mouse the system suggests ["mouse","mousepad"]
//Example 2:
//
//Input: products = ["havana"], searchWord = "havana"
//Output: [["havana"],["havana"],["havana"],["havana"],["havana"],["havana"]]
//Example 3:
//
//Input: products = ["bags","baggage","banner","box","cloths"], searchWord = "bags"
//Output: [["baggage","bags","banner"],["baggage","bags","banner"],["baggage","bags"],["bags"]]
//Example 4:
//
//Input: products = ["havana"], searchWord = "tatiana"
//Output: [[],[],[],[],[],[],[]]
//
//
//Constraints:
//
//1 <= products.length <= 1000
//There are no repeated elements in products.
//1 <= Σ products[i].length <= 2 * 10^4
//All characters of products[i] are lower-case English letters.
//1 <= searchWord.length <= 1000
//All characters of searchWord are lower-case English letters.

#import "P1268.h"

@interface TrieNode : NSObject

@property (nonatomic) NSMutableArray *suggestion;
@property (nonatomic) NSMutableDictionary <NSString *, TrieNode *> *nextMap;

@end

@implementation TrieNode

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.suggestion = [NSMutableArray array];
        self.nextMap = [NSMutableDictionary dictionary];
    }
    return self;
}
@end

@implementation P1268
- (NSArray *)insert:(NSString *)str arr:(NSArray *)arr
{
    NSMutableArray<NSString *> *array = [NSMutableArray arrayWithArray:arr];
    NSInteger low = 0, high = arr.count - 1;
    while (low <= high) {
        NSInteger mid = (low + high) / 2;
        if([str compare:array[mid]] == NSOrderedAscending)
        {
            high = mid - 1;
        }
        else
        {
            low = mid + 1;
        }
    }
    [array insertObject:str atIndex:low];
    return array;
}
- (NSArray *)suggestedProducts:(NSArray *)products searchWord:(NSString *)searchWord
{
    TrieNode *root = [[TrieNode alloc] init];
    for (NSString *word in products) {
        TrieNode *temp = root;
        for (NSInteger i = 0; i < word.length; i++) {
            char c = [word characterAtIndex:i];
            NSString *key = [NSString stringWithFormat:@"%c", c];
            
            if([temp.nextMap objectForKey:key])
            {
                temp = [temp.nextMap objectForKey:key];
            }
            else
            {
                TrieNode *temp1 = [[TrieNode alloc] init];
                [temp.nextMap setObject:temp1 forKey:key];
                temp = temp1;
            }
            temp.suggestion =  [NSMutableArray arrayWithArray:[self insert:word arr:temp.suggestion]];
        }
    }
    
    TrieNode *temp = root;
    NSMutableArray *res = [NSMutableArray array];
    for (NSInteger i = 0; i < searchWord.length; i++) {
        char c = [searchWord characterAtIndex:i];
        temp = [temp.nextMap objectForKey:[NSString stringWithFormat:@"%c", c]];
        NSArray *suggestion = temp.suggestion ?: @[];
        [res addObject:[suggestion subarrayWithRange:NSMakeRange(0, MIN(3, suggestion.count))]];
    }
    
    return res;
}

+ (void)solution
{
    P1268 *case1 = [[P1268 alloc] init];
    NSLog(@"%@", [case1 suggestedProducts:@[@"mobile",@"mouse",@"moneypot",@"monitor",@"mousepad"] searchWord:@"mouse"]);
    NSLog(@"%@", [case1 suggestedProducts:@[@"havana"] searchWord:@"havana"]);
    NSLog(@"%@", [case1 suggestedProducts:@[@"bags",@"baggage",@"banner",@"box",@"cloths"] searchWord:@"bags"]);
    NSLog(@"%@", [case1 suggestedProducts:@[@"havana"] searchWord:@"tatiana"]);
}
@end

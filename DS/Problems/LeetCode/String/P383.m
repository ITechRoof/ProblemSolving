//
//  P383.m
//  DS
//
//  Created by Kiruthika on 29/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/ransom-note/
//Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
//
//Each letter in the magazine string can only be used once in your ransom note.
//
//Note:
//You may assume that both strings contain only lowercase letters.
//
//canConstruct("a", "b") -> false
//canConstruct("aa", "ab") -> false
//canConstruct("aa", "aab") -> true

#import "P383.h"

@implementation P383

- (BOOL)canConstruct:(NSString *)ransomNote magazine:(NSString *)magazine
{
    NSInteger rMap[26], mMap[26];
    for (NSInteger i = 0; i < 26; i++) {
        rMap[i] = 0;
        mMap[i] = 0;
    }
    
    for (NSInteger i = 0; i < ransomNote.length; i++) {
        rMap[[ransomNote characterAtIndex:i] - 'a']++;
    }
    
    for (NSInteger i = 0; i < magazine.length; i++) {
        mMap[[magazine characterAtIndex:i] - 'a']++;
    }
    
    for (NSInteger i = 0; i < 26; i++) {
        if(rMap[i] > mMap[i])
        {
            return NO;
        }
    }
    return YES;
}

+ (void)solution
{
    P383 *case1 = [[P383 alloc] init];
    [case1 canConstruct:@"a" magazine:@"b"] ? NSLog(@"Can construct") : NSLog(@"Cannot construct");
    [case1 canConstruct:@"aa" magazine:@"ab"] ? NSLog(@"Can construct") : NSLog(@"Cannot construct");
    [case1 canConstruct:@"aa" magazine:@"aab"] ? NSLog(@"Can construct") : NSLog(@"Cannot construct");
}
@end

//
//  P387.m
//  DS
//
//  Created by Kiruthika on 15/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/first-unique-character-in-a-string/
//Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
//
//Examples:
//
//s = "leetcode"
//return 0.
//
//s = "loveleetcode",
//return 2.
//Note: You may assume the string contain only lowercase letters.

#import "P387.h"

@implementation P387

- (NSInteger)findFirstNonRepeatngIndex:(NSString *)str
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        NSNumber *count = [dict objectForKey:[NSNumber numberWithChar:c]] ?: [NSNumber numberWithInteger:0];
        [dict setObject:[NSNumber numberWithInteger:count.integerValue + 1] forKey:[NSNumber numberWithChar:c]];
    }
    
    for (int i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        NSNumber *count = [dict objectForKey:[NSNumber numberWithChar:c]];
        if(count.integerValue == 1)
        {
            return i;
        }
    }
    
    return -1;
}

+ (void)solution
{
    P387 *case1 = [[P387 alloc] init];
    NSLog(@"%ld", (long)[case1 findFirstNonRepeatngIndex:@"leetcode"]);
    NSLog(@"%ld", (long)[case1 findFirstNonRepeatngIndex:@"loveleetcode"]);
}
@end

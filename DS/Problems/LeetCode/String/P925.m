//
//  P925.m
//  DS
//
//  Created by Kiruthika on 28/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/long-pressed-name/
//Your friend is typing his name into a keyboard.  Sometimes, when typing a character c, the key might get long pressed, and the character will be typed 1 or more times.
//
//You examine the typed characters of the keyboard.  Return True if it is possible that it was your friends name, with some characters (possibly none) being long pressed.
//
// 
//
//Example 1:
//
//Input: name = "alex", typed = "aaleex"
//Output: true
//Explanation: 'a' and 'e' in 'alex' were long pressed.
//Example 2:
//
//Input: name = "saeed", typed = "ssaaedd"
//Output: false
//Explanation: 'e' must have been pressed twice, but it wasn't in the typed output.
//Example 3:
//
//Input: name = "leelee", typed = "lleeelee"
//Output: true
//Example 4:
//
//Input: name = "laiden", typed = "laiden"
//Output: true
//Explanation: It's not necessary to long press any character.
// 
//
//Note:
//
//name.length <= 1000
//typed.length <= 1000
//The characters of name and typed are lowercase letters.

#import "P925.h"

@implementation P925

- (BOOL)isLongPressedName:(NSString *)name typed:(NSString *)typed
{
    if(typed.length < name.length)
    {
        return NO;
    }
    
    NSInteger i = 0, j = 0;
    for (; i < typed.length;i++)
    {
        char ch = [typed characterAtIndex:i];
        char actualCh = [name characterAtIndex:j];

        if(actualCh == ch)
        {
            j++;
        }
    }
    return j == name.length;
}

+ (void)solution
{
    P925 *case1 = [[P925 alloc] init];
    [case1 isLongPressedName:@"alex" typed:@"aaleex"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 isLongPressedName:@"saeed" typed:@"ssaaedd"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 isLongPressedName:@"leelee" typed:@"lleeelee"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
    [case1 isLongPressedName:@"laiden" typed:@"laiden"] ? NSLog(@"Valid") : NSLog(@"Not Valid");
}


@end

//
//  P125.m
//  DS
//
//  Created by Kiruthika on 28/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P125.h"

@implementation P125
- (BOOL)isAlphabet:(char)c
{
    if((c - 'A' >= 0 && c - 'A' <= 26) || (c - 'a' >= 0 && c - 'a' <= 26))
    {
        return YES;
    }
    return NO;
}

- (BOOL)isPalindrome:(NSString *)str
{
    for (NSInteger i = 0, j = str.length - 1; i < j;)
    {
        char charI = [str characterAtIndex:i];
        char charJ = [str characterAtIndex:j];
        
        if(![self isAlphabet:charI])
        {
            i++;
        }
        else if(![self isAlphabet:charJ])
        {
            j--;
        }
        else if([NSString stringWithFormat:@"%c", charI].lowercaseString != [NSString stringWithFormat:@"%c", charJ].lowercaseString)
        {
            return NO;
        }
        else
        {
            i++;
            j--;
        }
    }
    return YES;
}

+ (void)solution
{
    P125 *case1 = [[P125 alloc] init];
    [case1 isPalindrome:@"A man, a plan, a canal: Panama"] ? NSLog(@"Palindrome") : NSLog(@"Not Palindrome");
    [case1 isPalindrome:@"race a car"] ? NSLog(@"Palindrome") : NSLog(@"Not Palindrome");
}
@end

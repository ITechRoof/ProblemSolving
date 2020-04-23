//
//  P1021.m
//  DS
//
//  Created by Kiruthika on 23/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P1021.h"

@implementation P1021
- (NSString *)removeOuterParentheses:(NSString *)str
{
    NSString *res = @"";
    NSInteger start = 0, end = -1, open = 0, close = 0;
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        
        if (c == '(') {
            open++;
        }
        else
        {
            close++;
            end = i;
            if(open == close)
            {
                res = [res stringByAppendingString:[str substringWithRange:NSMakeRange(start + 1, end - start - 1)]];
                start = i + 1;
            }
        }
    }
    return res;
}

+ (void)solution
{
    P1021 *case1 = [[P1021 alloc] init];
    NSLog(@"%@", [case1 removeOuterParentheses:@"(()())(())"]);
    NSLog(@"%@", [case1 removeOuterParentheses:@"(()())(())(()(()))"]);
    NSLog(@"%@", [case1 removeOuterParentheses:@"()()"]);
}

@end

//
//  P151.m
//  DS
//
//  Created by Kiruthika on 26/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P151.h"

@implementation P151

- (NSString *)reverseWords:(NSString *)str
{
    NSString *s = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSArray *arr = [s componentsSeparatedByString:@" "];
    NSString *res = @"";
    for (NSInteger i =  arr.count - 1; i >= 0; i--) {
        NSString *current = [arr[i] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if(current.length > 0)
        {
            res = [res stringByAppendingString:arr[i]];
            if(i != 0)
            {
                res = [res stringByAppendingString:@" "];
                
            }
        }
        
    }
    return res;
}

+ (void)solution
{
    P151 *case1 = [[P151 alloc] init];
    NSLog(@"%@", [case1 reverseWords:@"the sky is blue"]);
    NSLog(@"%@", [case1 reverseWords:@"  hello world!  "]);
    NSLog(@"%@", [case1 reverseWords:@"a good   example"]);
}

@end

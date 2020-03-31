//
//  P93.m
//  DS
//
//  Created by Kiruthika on 31/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/restore-ip-addresses/
//Given a string containing only digits, restore it by returning all possible valid IP address combinations.
//
//Example:
//
//Input: "25525511135"
//Output: ["255.255.11.135", "255.255.111.35"]

#import "P93.h"

@implementation P93

- (BOOL)isValid:(NSString *)ip
{
    NSArray *comp = [ip componentsSeparatedByString:@"."];
    for (NSString *c in comp) {
          if(((NSNumber *)c).integerValue > 255)
          {
              return NO;
          }
        if([c characterAtIndex:0] == '0')
        {
            return NO;
        }
    }
  
    return YES;
}

- (NSArray *)restoreIpAddresses:(NSString *)s
{
    NSMutableArray *res = [NSMutableArray array];
    
    for (NSInteger i = 1; i <= 3; i++) {
        for (NSInteger j = 1; j <= 3; j++) {
            for (NSInteger k = 1; k <= 3; k++) {
                for (NSInteger l = 1; l <= 3; l++) {
                    NSString *str = s;

                    if(i + j + k + l == str.length)
                    {
                        NSString *ip = @"";
                        ip = [[[[[str substringWithRange:NSMakeRange(0, i)] stringByAppendingString:@"."] stringByAppendingString:[[str substringWithRange:NSMakeRange(i, j)] stringByAppendingString:@"."]] stringByAppendingString:[[str substringWithRange:NSMakeRange(i + j, k)] stringByAppendingString:@"."]] stringByAppendingString:[str substringWithRange:NSMakeRange(i + j + k, l)]];

                        if([self isValid:ip])
                        {
                            [res addObject:ip];
                        }
                    }
                }
            }
        }
    }
    return res;
}

+ (void)solution
{
    P93 *case1 = [[P93 alloc] init];
    NSLog(@"%@", [case1 restoreIpAddresses:@"25525511135"]);
    NSLog(@"%@", [case1 restoreIpAddresses:@"20010010010"]);
}
@end

//
//  P937.m
//  DS
//
//  Created by Kiruthika on 29/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/reorder-data-in-log-files/
//You have an array of logs.  Each log is a space delimited string of words.
//
//For each log, the first word in each log is an alphanumeric identifier.  Then, either:
//
//Each word after the identifier will consist only of lowercase letters, or;
//Each word after the identifier will consist only of digits.
//We will call these two varieties of logs letter-logs and digit-logs.  It is guaranteed that each log has at least one word after its identifier.
//
//Reorder the logs so that all of the letter-logs come before any digit-log.  The letter-logs are ordered lexicographically ignoring identifier, with the identifier used in case of ties.  The digit-logs should be put in their original order.
//
//Return the final order of the logs.
//
//
//
//Example 1:
//
//Input: logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
//Output: ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]
//
//
//Constraints:
//
//0 <= logs.length <= 100
//3 <= logs[i].length <= 100
//logs[i] is guaranteed to have an identifier, and a word after the identifier.

#import "P937.h"

@implementation P937

- (NSArray *)reorderLogFiles:(NSArray *)logs
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:logs];
    for (NSInteger i = 0; i < logs.count; i++) {
        for (NSInteger j = i+1; j < logs.count; j++) {
            NSString *str1 = [array objectAtIndex:i];
            NSString *str2 = [array objectAtIndex:j];
            
            if(![[str1 substringToIndex:3] isEqualToString:@"dig"])
            {
                if(![[str2 substringToIndex:3] isEqualToString:@"dig"])
                {
                    NSArray *c1 = [str1 componentsSeparatedByString:@" "];
                    NSArray *c2 = [str2 componentsSeparatedByString:@" "];

                    BOOL isTestNeeded = YES;
                    for (NSInteger m = 1, n = 1; m < c1.count && n < c2.count; m++, n++) {
                        NSString *v1 = c1[m];
                        NSString *v2 = c2[n];
                        if(!isTestNeeded)
                        {
                            break;
                        }
                        if(![v1 isEqualToString:v2])
                        {
                            for (NSInteger k = 0; k < v1.length; k++) {
                                if([v1 characterAtIndex:k] > [v2 characterAtIndex:k])
                                {
                                    array[i] = str2;
                                    array[j] = str1;
                                    isTestNeeded = NO;
                                    break;
                                }
                                else if([v1 characterAtIndex:k] < [v2 characterAtIndex:k])
                                {
                                    isTestNeeded = NO;
                                    break;
                                }
                            }
                        }
                        
                    }
                }
            }
            else
            {
                if(![[str2 substringToIndex:3] isEqualToString:@"dig"])
                {
                    //swap
                    array[i] = str2;
                    array[j] = str1;
                }
            }
        }
    }
    return array;
}
+ (void)solution
{
    P937 *case1 = [[P937 alloc] init];
    NSLog(@"%@", [case1 reorderLogFiles:@[@"dig1 8 1 5 1",@"let1 art can",@"dig2 3 6",@"let2 own kit dig",@"let3 art zero"]]);
}
@end

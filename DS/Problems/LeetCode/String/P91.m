//
//  P91.m
//  DS
//
//  Created by Kiruthika on 31/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/decode-ways/
//A message containing letters from A-Z is being encoded to numbers using the following mapping:
//
//'A' -> 1
//'B' -> 2
//...
//'Z' -> 26
//Given a non-empty string containing only digits, determine the total number of ways to decode it.
//
//Example 1:
//
//Input: "12"
//Output: 2
//Explanation: It could be decoded as "AB" (1 2) or "L" (12).
//Example 2:
//
//Input: "226"
//Output: 3
//Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).

#import "P91.h"

@implementation P91
- (NSInteger)numDecodings:(NSString *)str
{
    NSInteger count[str.length + 1];
    
    for (NSInteger i =  0; i <= str.length; i++) {
         count[i] = 1;
     }
    count[str.length] = 0;
    for (NSInteger i = str.length - 1; i >= 0; i--) {
        char c = [str characterAtIndex:i];
        
        if(c == '0')
        {
            count[i] = count[i + 1];
        }
        else
        {
            if(c == '2' && [str characterAtIndex:i + 1] - '1' > 6)
            {
                count[i] = count[i + 1];
            }
            else
            {
                count[i] = count[i] + count[i + 1];
            }
        }
    }
    return count[0];
}
+ (void)solution
{
    P91 *case1 = [[P91 alloc] init];
    NSLog(@"%ld", (long)[case1 numDecodings:@"101"]);
    NSLog(@"%ld", (long)[case1 numDecodings:@"226"]);
}
@end

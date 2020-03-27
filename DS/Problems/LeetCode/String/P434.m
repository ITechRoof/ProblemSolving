//
//  P434.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/number-of-segments-in-a-string/
//Count the number of segments in a string, where a segment is defined to be a contiguous sequence of non-space characters.
//
//Please note that the string does not contain any non-printable characters.
//
//Example:
//
//Input: "Hello, my name is John"
//Output: 5

#import "P434.h"

@implementation P434

- (NSInteger)countSegments:(NSString *)str
{
    return [str componentsSeparatedByString:@" "].count;
}

+ (void)solution
{
    P434 *case1 = [[P434 alloc] init];
    NSLog(@"%ld", (long)[case1 countSegments:@"Hello, my name is John"]);
}
@end

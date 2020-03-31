//
//  P71.m
//  DS
//
//  Created by Kiruthika on 31/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/simplify-path/
//Given an absolute path for a file (Unix-style), simplify it. Or in other words, convert it to the canonical path.
//
//In a UNIX-style file system, a period . refers to the current directory. Furthermore, a double period .. moves the directory up a level.
//
//Note that the returned canonical path must always begin with a slash /, and there must be only a single slash / between two directory names. The last directory name (if it exists) must not end with a trailing /. Also, the canonical path must be the shortest string representing the absolute path.
//
// 
//
//Example 1:
//
//Input: "/home/"
//Output: "/home"
//Explanation: Note that there is no trailing slash after the last directory name.
//Example 2:
//
//Input: "/../"
//Output: "/"
//Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.
//Example 3:
//
//Input: "/home//foo/"
//Output: "/home/foo"
//Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.
//Example 4:
//
//Input: "/a/./b/../../c/"
//Output: "/c"
//Example 5:
//
//Input: "/a/../../b/../c//.//"
//Output: "/c"
//Example 6:
//
//Input: "/a//b////c/d//././/.."
//Output: "/a/b/c"

#import "P71.h"
#import "StackUsingArray.h"

@implementation P71
- (NSString *)simplifyPath:(NSString *)str
{
    StackUsingArray *s = [[StackUsingArray alloc] init];
    
    NSArray *comp = [str componentsSeparatedByString:@"/"];
    for (NSInteger i = 0; i < comp.count; i++) {
        NSString *c = comp[i];
        if (c.length > 0) {
            
            if([c isEqualToString:@"."] || [c isEqualToString:@"/"])
            {
                continue;
            }
            else  if([c isEqualToString:@".."])
            {
                [s pop];
            }
            else
            {
                [s push:c];
            }
        }
    }
    
    NSString *res = @"";
    while (![s isEmpty]) {
        res = [NSString stringWithFormat:@"/%@%@", [s top], res];
        [s pop];
    }
    return res.length > 0 ? res : @"/";
}

+ (void)solution
{
    P71 *case1 = [[P71 alloc] init];
    NSLog(@"%@", [case1 simplifyPath:@"/home/"]);
    NSLog(@"%@", [case1 simplifyPath:@"/../"]);
    NSLog(@"%@", [case1 simplifyPath:@"/home//foo/"]);
    NSLog(@"%@", [case1 simplifyPath:@"/a/./b/../../c/"]);
    NSLog(@"%@", [case1 simplifyPath:@"/a/../../b/../c//.//"]);
    NSLog(@"%@", [case1 simplifyPath:@"/a//b////c/d//././/.."]);
}
@end

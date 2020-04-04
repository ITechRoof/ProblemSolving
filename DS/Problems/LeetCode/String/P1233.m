//
//  P1233.m
//  DS
//
//  Created by Kiruthika on 04/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/remove-sub-folders-from-the-filesystem/
//Given a list of folders, remove all sub-folders in those folders and return in any order the folders after removing.
//
//If a folder[i] is located within another folder[j], it is called a sub-folder of it.
//
//The format of a path is one or more concatenated strings of the form: / followed by one or more lowercase English letters. For example, /leetcode and /leetcode/problems are valid paths while an empty string and / are not.
//
//
//
//Example 1:
//
//Input: folder = ["/a","/a/b","/c/d","/c/d/e","/c/f"]
//Output: ["/a","/c/d","/c/f"]
//Explanation: Folders "/a/b/" is a subfolder of "/a" and "/c/d/e" is inside of folder "/c/d" in our filesystem.
//Example 2:
//
//Input: folder = ["/a","/a/b/c","/a/b/d"]
//Output: ["/a"]
//Explanation: Folders "/a/b/c" and "/a/b/d/" will be removed because they are subfolders of "/a".
//Example 3:
//
//Input: folder = ["/a/b/c","/a/b/ca","/a/b/d"]
//Output: ["/a/b/c","/a/b/ca","/a/b/d"]
//
//
//Constraints:
//
//1 <= folder.length <= 4 * 10^4
//2 <= folder[i].length <= 100
//folder[i] contains only lowercase letters and '/'
//folder[i] always starts with character '/'
//Each folder name is unique.


#import "P1233.h"

@implementation P1233

- (BOOL)containsFolder:(NSString *)s1 s2:(NSString *)s2
{
    NSRange range = [s1 rangeOfString:s2];
    if(range.location + range.length < s1.length)
    {
        if([s1 characterAtIndex:range.length + range.location] == '/')
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return YES;
    }
}

- (NSArray *)removeSubfolders:(NSArray *)folder
{
    NSMutableSet *set = [NSMutableSet set];
    for (NSString *path in folder) {
        if([set containsObject:path])
        {
            continue;
        }
        NSMutableSet *temp = [NSMutableSet set];
        BOOL isFound = NO;
        for (NSString *setPath in set) {
            
            if([setPath containsString:path])
            {
                if([self containsFolder:setPath s2:path])
                {
                    [temp addObject:path];
                    isFound = YES;
                }
                else
                {
                    [temp addObject:setPath];
                }
            }
            else if([path containsString:setPath])
            {
                if([self containsFolder:path s2:setPath])
                {
                    isFound = YES;
                }
                [temp addObject:setPath];
            }
            else
            {
                [temp addObject:setPath];
            }
            //            if([setPath containsString:path])
            //            {
            //                NSRange range = [setPath rangeOfString:path];
            //                if(range.location + range.length < setPath.length)
            //                {
            //                    if ([setPath characterAtIndex:range.location + range.length] == '/') {
            //                        [temp addObject:path];
            //                        isFound = YES;
            //                    }
            //                    else
            //                    {
            //                        [temp addObject:setPath];
            //                    }
            //                }
            //                else
            //                {
            //                    [temp addObject:path];
            //                    isFound = YES;
            //                }
            //            }
            //            else if([path containsString:setPath])
            //            {
            //                NSRange range = [path rangeOfString:setPath];
            //                if(range.location + range.length < path.length)
            //                {
            //                    if([path characterAtIndex:range.length + range.location] == '/')
            //                    {
            //                        [temp addObject:setPath];
            //                        isFound = YES;
            //                    }
            //                    else
            //                    {
            //                        [temp addObject:setPath];
            //                    }
            //                }
            //                else
            //                {
            //                    [temp addObject:setPath];
            //                    isFound = YES;
            //                }
            //            }
            //            else
            //            {
            //                [temp addObject:setPath];
            //            }
        }
        if(!isFound)
        {
            [temp addObject:path];
        }
        set = temp;
    }
    return set.allObjects;
}

+ (void)solution
{
    P1233 *case1 = [[P1233 alloc] init];
    NSLog(@"%@", [case1 removeSubfolders:@[@"/a",@"/a/b",@"/c/d",@"/c/d/e",@"/c/f"]]);
    NSLog(@"%@", [case1 removeSubfolders:@[@"/a/c",@"/a/b", @"/a",@"/c/d",@"/c/d/e",@"/c/f"]]);
    NSLog(@"%@", [case1 removeSubfolders:@[@"/a",@"/a/b/c",@"/a/b/d"]]);
    NSLog(@"%@", [case1 removeSubfolders:@[@"/a/b/c",@"/a/b/ca",@"/a/b/d"]]);
}

@end

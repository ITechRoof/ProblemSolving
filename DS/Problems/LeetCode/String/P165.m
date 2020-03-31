//
//  P165.m
//  DS
//
//  Created by Kiruthika on 31/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/compare-version-numbers/
//Compare two version numbers version1 and version2.
//If version1 > version2 return 1; if version1 < version2 return -1;otherwise return 0.
//
//You may assume that the version strings are non-empty and contain only digits and the . character.
//
//The . character does not represent a decimal point and is used to separate number sequences.
//
//For instance, 2.5 is not "two and a half" or "half way to version three", it is the fifth second-level revision of the second first-level revision.
//
//You may assume the default revision number for each level of a version number to be 0. For example, version number 3.4 has a revision number of 3 and 4 for its first and second level revision number. Its third and fourth level revision number are both 0.
//
//
//
//Example 1:
//
//Input: version1 = "0.1", version2 = "1.1"
//Output: -1
//Example 2:
//
//Input: version1 = "1.0.1", version2 = "1"
//Output: 1
//Example 3:
//
//Input: version1 = "7.5.2.4", version2 = "7.5.3"
//Output: -1
//Example 4:
//
//Input: version1 = "1.01", version2 = "1.001"
//Output: 0
//Explanation: Ignoring leading zeroes, both “01” and “001" represent the same number “1”
//Example 5:
//
//Input: version1 = "1.0", version2 = "1.0.0"
//Output: 0
//Explanation: The first version number does not have a third level revision number, which means its third level revision number is default to "0"
//
//
//Note:
//
//Version strings are composed of numeric strings separated by dots . and this numeric strings may have leading zeroes.
//Version strings do not start or end with dots, and they will not be two consecutive dots.

#import "P165.h"

@implementation P165
- (NSNumber *)numberFromString:(NSString *)string
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:string];
    return myNumber;
}
- (NSInteger)compareVersion:(NSString *)version1 version2:(NSString *)version2
{
    NSMutableArray *v1Comp = [[NSMutableArray alloc] initWithArray:[version1 componentsSeparatedByString:@"."]];
    NSMutableArray *v2Comp = [[NSMutableArray alloc] initWithArray:[version2 componentsSeparatedByString:@"."]];

    if(v1Comp.count > v2Comp.count)
    {
        while (v2Comp.count != v1Comp.count) {
            [v2Comp addObject:@"0"];
        }
    }
    else
    {
        while (v1Comp.count != v2Comp.count) {
            [v1Comp addObject:@"0"];
        }
    }
    
    for (NSInteger i = 0; i < v1Comp.count; i++) {
        NSInteger v1 = [self numberFromString:v1Comp[i]].integerValue;
        NSInteger v2 = [self numberFromString:v2Comp[i]].integerValue;
        if(v1 > v2)
        {
            return 1;
        }
        else if(v2 > v1)
        {
            return -1;
        }
    }
    return 0;
}

+ (void)solution
{
    P165 *case1 = [[P165 alloc] init];
    NSLog(@"%ld", (long)[case1 compareVersion:@"0.1" version2:@"1.1"]);
    NSLog(@"%ld", (long)[case1 compareVersion:@"1.0.1" version2:@"1"]);
    NSLog(@"%ld", (long)[case1 compareVersion:@"7.5.2.4" version2:@"7.5.3"]);
    NSLog(@"%ld", (long)[case1 compareVersion:@"1.01" version2:@"1.001"]);
    NSLog(@"%ld", (long)[case1 compareVersion:@"1.0" version2:@"1.0.0"]);
}
@end

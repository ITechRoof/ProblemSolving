//
//  P6.m
//  DS
//
//  Created by Kiruthika on 01/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/zigzag-conversion/
//The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//
//P   A   H   N
//A P L S I I G
//Y   I   R
//And then read line by line: "PAHNAPLSIIGYIR"
//
//Write the code that will take a string and make this conversion given a number of rows:
//
//string convert(string s, int numRows);
//Example 1:
//
//Input: s = "PAYPALISHIRING", numRows = 3
//Output: "PAHNAPLSIIGYIR"
//Example 2:
//
//Input: s = "PAYPALISHIRING", numRows = 4
//Output: "PINALSIGYAHRPI"
//Explanation:
//
//P     I    N
//A   L S  I G
//Y A   H R
//P     I

#import "P6.h"

@implementation P6
- (NSString *)convert:(NSString *)str numRows:(NSInteger)numRows
{
    NSMutableArray *rows = [NSMutableArray array];
    for (NSInteger i = 0; i < numRows; i++) {
        [rows addObject:@""];
    }
    
    BOOL isGoingDown = NO;
    NSInteger rowCount = 0;
    for (NSInteger i = 0; i < str.length;i++) {
        
        char c = [str characterAtIndex:i];
        NSString *s = rows[rowCount];
        s = [s stringByAppendingFormat:@"%c", c];
        rows[rowCount] = s;
        
        if(rowCount == 0 || rowCount == numRows - 1)
        {
            isGoingDown = !isGoingDown;
        }
        rowCount = rowCount + (isGoingDown ? 1 : -1);
    }
    
    NSString *res = @"";
    for (NSInteger i = 0; i < numRows; i++) {
        res = [res stringByAppendingString:rows[i]];
    }
    return res;
}

+ (void)solution
{
    P6 *case1 = [[P6 alloc] init];
    NSLog(@"%@", [case1 convert:@"PAYPALISHIRING" numRows:3]);
    NSLog(@"%@", [case1 convert:@"PAYPALISHIRING" numRows:4]);
}
@end

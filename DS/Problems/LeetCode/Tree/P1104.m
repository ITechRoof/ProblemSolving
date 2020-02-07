//
//  P1104.m
//  DS
//
//  Created by Kiruthika on 07/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//In an infinite binary tree where every node has two children, the nodes are labelled in row order.
//
//In the odd numbered rows (ie., the first, third, fifth,...), the labelling is left to right, while in the even numbered rows (second, fourth, sixth,...), the labelling is right to left.
//
//
//
//Given the label of a node in this tree, return the labels in the path from the root of the tree to the node with that label.
//
// 
//
//Example 1:
//
//Input: label = 14
//Output: [1,3,4,14]
//Example 2:
//
//Input: label = 26
//Output: [1,2,6,10,26]
// 
//
//Constraints:
//
//1 <= label <= 10^6

#import "P1104.h"

@implementation P1104

- (NSArray *)printPathFor:(NSInteger)val
{
    NSMutableArray *path = [NSMutableArray array];
    
    NSInteger level = 0;
    while(val > pow(2, level) - 1)
    {
        level++;
    }
    
    BOOL isLeftToRight = level % 2 == 1; // Odd level in left to right
    
    NSInteger totalVal = pow(2, level) - 1;
    NSInteger previousLevelVal = pow(2, level - 1) - 1;
    NSInteger index = isLeftToRight ? val - 1 : totalVal - (val - previousLevelVal);
    
    while(index >= 0)
    {
        totalVal = pow(2, level) - 1;
        previousLevelVal = pow(2, level - 1) - 1;
        NSInteger value = level % 2 == 1 ? index + 1 : totalVal - index + previousLevelVal;
        [path addObject:[NSNumber numberWithInteger:value]];
        
        if(index % 2 == 0)
        {
            index = (index - 2) / 2;
        }
        else
        {
            index = (index - 1) / 2;
        }
        level--;
    }
    return path;
}

+ (void)solution
{
    P1104 *case1 = [[P1104 alloc] init];
    NSLog(@"%@", [case1 printPathFor:14]);
}

@end

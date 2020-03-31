//
//  P385.m
//  DS
//
//  Created by Kiruthika on 31/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/mini-parser/
//Given a nested list of integers represented as a string, implement a parser to deserialize it.
//
//Each element is either an integer, or a list -- whose elements may also be integers or other lists.
//
//Note: You may assume that the string is well-formed:
//
//String is non-empty.
//String does not contain white spaces.
//String contains only digits 0-9, [, - ,, ].
//Example 1:
//
//Given s = "324",
//
//You should return a NestedInteger object which contains a single integer 324.
//Example 2:
//
//Given s = "[123,[456,[789]]]",
//
//Return a NestedInteger object containing a nested list with 2 elements:
//
//1. An integer containing value 123.
//2. A nested list containing two elements:
//    i.  An integer containing value 456.
//    ii. A nested list with one element:
//         a. An integer containing value 789.

#import "P385.h"
#import "StackUsingArray.h"

@interface NestedInteger: NSObject

@property (nonatomic) NSNumber *val;
@property (nonatomic) NSMutableArray <NestedInteger *> *nestedList;
@end

@implementation NestedInteger

@end

@implementation P385
- (NestedInteger *)deserialize:(NSString *)str
{
    StackUsingArray *s = [[StackUsingArray alloc] init];
    NSString *v = @"";
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        if(c == '[')
        {
            NestedInteger *n = [[NestedInteger alloc] init];
            [s push:n];
        }
        else if(c == ']')
        {
            NestedInteger *top = [s top];
            if(v.length > 0)
            {
                top.val = (NSNumber *)v;
                v = @"";
            }
            [s pop];

            if(![s isEmpty])
            {
                NestedInteger *newTop = [s top];

                if(!newTop.nestedList)
                {
                    newTop.nestedList = [NSMutableArray array];
                }
                [newTop.nestedList addObject:top];
            }
            else
            {
                return top;
            }
        }
        else if(c == ',')
        {
            NestedInteger *n = [s top];
            if(v.length > 0)
            {
                n.val = (NSNumber *)v;
                v = @"";
            }
        }
        else
        {
            v = [NSString stringWithFormat:@"%@%c", v, c];
        }
    }
    return NULL;
}
+ (void)solution
{
    P385 *case1 = [[P385 alloc] init];
    NSLog(@"%@", [case1 deserialize:@"[123,[456,[789]]]"]);
}
@end

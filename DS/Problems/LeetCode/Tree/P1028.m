//
//  P1028.m
//  DS
//
//  Created by Kiruthika on 12/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//We run a preorder depth first search on the root of a binary tree.
//
//At each node in this traversal, we output D dashes (where D is the depth of this node), then we output the value of this node.  (If the depth of a node is D, the depth of its immediate child is D+1.  The depth of the root node is 0.)
//
//If a node has only one child, that child is guaranteed to be the left child.
//
//Given the output S of this traversal, recover the tree and return its root.
//
//
//
//Example 1:
//
//
//
//Input: "1-2--3--4-5--6--7"
//Output: [1,2,5,3,4,6,7]
//Example 2:
//
//
//
//Input: "1-2--3---4-5--6---7"
//Output: [1,2,5,3,null,6,null,4,null,7]
//
//
//Example 3:
//
//
//
//Input: "1-401--349---90--88"
//Output: [1,401,null,349,88,90]

#import "P1028.h"
#import "Tree.h"

@implementation P1028

- (NSNumber *)numberFromString:(NSString *)string
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:string];
    return myNumber;
}

- (TreeNode *)recoverTree:(NSString *)input
{
    NSMutableArray *levelNode = [NSMutableArray array];
    NSMutableArray *inputArray = [[NSMutableArray alloc] initWithArray:[input componentsSeparatedByString:@"-"]]; // one - has been stripped in the array
    
    TreeNode *node = [[TreeNode alloc] initWithValue:[self numberFromString:[inputArray firstObject]]];
    [levelNode addObject:node];
    
    [inputArray removeObjectAtIndex:0];
    NSInteger level = 1;
    
    for(NSString *c in inputArray)
    {
        if([c isEqualToString:@""])
        {
            level++;
        }
        else
        {
            node = [[TreeNode alloc] initWithValue:[self numberFromString:c]];
            TreeNode *parent = [levelNode objectAtIndex:level - 1]; // going to previous level for parent;
            if(parent.left)
            {
                parent.right = node;
            }
            else
            {
                parent.left = node;
            }
            levelNode[level] = node;
            
            level = 1;
        }
    }
    return levelNode.count > 0 ? [levelNode firstObject] : NULL;
}

+ (void)solution
{
    P1028 *case1 = [[P1028 alloc] init];
    Tree *tree = [[Tree alloc] initWithRoot:[case1 recoverTree:@"1-2--3--4-5--6--7"]];
    [tree printLevelOrder];
}


@end

//Given a binary tree with n nodes, your task is to check if it's possible to partition the tree to two trees which have the equal sum of values after removing exactly one edge on the original tree.
//
//Example 1:
//Input:
//    5
//   / \
//  10 10
//    /  \
//   2   3
//
//Output: True
//Explanation:
//    5
//   /
//  10
//      
//Sum: 15
//
//   10
//  /  \
// 2    3
//
//Sum: 15
//Example 2:
//Input:
//    1
//   / \
//  2  10
//    /  \
//   2   20
//
//Output: False
//Explanation: You can't split the tree into two trees with equal sum after removing exactly one edg

#import "P663.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P663

- (NSInteger)sumOfSubtree:(TreeNode *)node
{
    if(node == NULL)
    {
        return 0;
    }
    
    return [self sumOfSubtree:node.left] + [self sumOfSubtree:node.right] + node.data.integerValue;
}

- (BOOL)isEqualPartition:(TreeNode *)node
{
    if(node == NULL)
    {
        return YES;
    }
    
    NSInteger totalSum = [self sumOfSubtree:node];
    
    StackUsingArray *s = [[StackUsingArray alloc] init];
    TreeNode *temp = node;
    
    while(![s isEmpty] || temp)
    {
        while(temp != NULL)
        {
            [s push:temp];
            temp = temp.left;
        }
        
        temp = [s top];
        [s pop];
        
        NSInteger subTreeSum = [self sumOfSubtree:temp];
        if(totalSum - subTreeSum == subTreeSum)
        {
            return YES;
        }
       
        
        temp = temp.right;
    }
    return NO;
}

+ (Tree *)getTree
{
//    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@10 right:@10];
//
//    root.right.left = [Tree createSubTreeWithRoot:@2 left:NULL right:NULL];
//    root.right.right = [Tree createSubTreeWithRoot:@3 left:NULL right:NULL];
    
    
    TreeNode *root = [Tree createSubTreeWithRoot:@1 left:@2 right:@10];
      
      root.right.left = [Tree createSubTreeWithRoot:@2 left:NULL right:NULL];
      root.right.right = [Tree createSubTreeWithRoot:@20 left:NULL right:NULL];
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    P663 *case1 = [[P663 alloc] init];
    Tree *tree = [P663 getTree];
    [case1 isEqualPartition:tree.root] ? NSLog(@"Equal Partition") : NSLog(@"Not Equal Partition");
}

@end

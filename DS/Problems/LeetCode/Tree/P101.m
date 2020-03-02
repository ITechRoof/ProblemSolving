#import "P101.h"
#import "Tree.h"
#import "TreeNode.h"
#import "QueueUsingArray.h"

@implementation P101

+ (BOOL)isSymmetricTree:(TreeNode *)root
{
    QueueUsingArray *queue = [[QueueUsingArray alloc] init];
    
    [queue enqueue:root.left];
    [queue enqueue:root.right];

    while(![queue isEmpty])
    {
        TreeNode *first = [queue dequeue];
        TreeNode *second = [queue dequeue];
        
        if(first.data.integerValue != second.data.integerValue)
        {
            return NO;
        }
        
        if(first.left != NULL && second.right != NULL)
        {
            [queue enqueue:first.left];
            [queue enqueue:second.right];
        }
        else if(first.left != NULL || second.right != NULL)
        {
            return NO;
        }
       
        if(first.right != NULL && second.left != NULL)
        {
            [queue enqueue:first.right];
            [queue enqueue:second.left];
        }
        else if(first.right != NULL || second.left != NULL)
        {
            return NO;
        }
    }

    return YES;
}

+ (Tree *)getTree {

    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@12 left:@13 right:@13];
    //  12
    // 13 13

    root.left.left = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
    root.left.right = [Tree createSubTreeWithRoot:@18 left:@19 right:@20];
    //          12
    //      13      13
    //   15   18
    // 16 17 19 20

    root.right.left = [Tree createSubTreeWithRoot:@18 left:@20 right:@19];
    root.right.right = [Tree createSubTreeWithRoot:@15 left:@17 right:@16];

    //            12
    //      13           13
    //   15   18      18    15
    // 16 17 19 20  20  19 17 16

    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P101 getTree];
    [P101 isSymmetricTree:tree.root] ? NSLog(@"Symmetric") :   NSLog(@"Not Symmetric");
}

@end

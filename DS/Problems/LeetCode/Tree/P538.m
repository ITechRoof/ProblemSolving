#import "P538.h"
#import "Tree.h"
#import "StackUsingArray.h"

@implementation P538

- (void)convertToGreatestBST:(TreeNode *)node
{
    if(node ==  NULL)
    {
        return;
    }
    
    StackUsingArray *s = [[StackUsingArray alloc] init];
    
    TreeNode *temp = node;
    NSInteger max = 0;
    
    while(![s isEmpty] || temp != NULL)
    {
        while(temp != NULL)
        {
            [s push:temp];
            temp = temp.right;
        }
        
        temp = [s top];
        [s pop];
        
        max += temp.data.integerValue;
        temp.data = [[NSNumber alloc] initWithInteger:max];
        NSLog(@"%@", temp.data);
        
        temp = temp.left;
    }
}
+ (Tree *)getTree
{
    
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@5 left:@2 right:@13];
    //  12
    // 13 13
    //
    root.left.left = [Tree createSubTreeWithRoot:@1 left:@1 right:@1];
    root.left.right = [Tree createSubTreeWithRoot:@1 left:@1 right:@1];
    //  //          12
    //  //      13      13
    //  //   15   18
    //  // 16 17 19 20
    //
    //  root.right.left = [Tree createSubTreeWithRoot:@18 left:@20 right:@19];
    //  root.right.right = [Tree createSubTreeWithRoot:@15 left:@17 right:@16];
    
    //            12
    //      13           13
    //   15   18      18    15
    // 16 17 19 20  20  19 17 16
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)solution
{
    Tree *tree = [P538 getTree];
    P538 *case1 = [[P538 alloc] init];
    [case1 convertToGreatestBST:tree.root];
}

@end

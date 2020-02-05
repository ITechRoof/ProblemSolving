#import "P100.h"
#import "Tree.h"
#import "TreeNode.h"

@implementation P100

- (BOOL)isSameTreeWithNode1:(TreeNode *)node1 node2:(TreeNode *)node2
{
    if(node1 == NULL && node2 == NULL)
    {
      return YES;
    }
    else if(node1 == NULL || node2 == NULL)
    {
      return NO;
    }
    BOOL isLeftSame = [self isSameTreeWithNode1:node1.left node2:node2.left];
    BOOL isRightSame = [self isSameTreeWithNode1:node1.right node2:node2.right];

    return isLeftSame && isRightSame && node1.data.integerValue == node2.data.integerValue;
}

+ (Tree *)getTree1
{

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

+ (Tree *)getTree2
{
 
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
  Tree *tree1 = [P100 getTree1];
  Tree *tree2 = [P100 getTree2];
  P100 *case1 = [[P100 alloc] init];
  [case1 isSameTreeWithNode1:tree1.root node2:tree2.root] ? NSLog(@"Same") : NSLog(@"Not same");
}

@end

#import "BST.h"
#import "Tree.h"
#import "TreeNode.h"
#import "StackUsingArray.h"

@interface BST()

@property (nonatomic) TreeNode *root;

@end

@implementation BST

- (instancetype)initWithRoot:(TreeNode *)root {

    self = [super init];

    if(self) {
        self.root = root;
    }
    return self;
}

- (void)printInOrder:(TreeNode *)node {

    if(node ==  NULL) {
        return;
    }
    [self printInOrder:node.left];
    NSLog(@"%@", node.data);
    [self printInOrder:node.right];
}

- (void)recoverBST:(TreeNode *)node prevNode:(TreeNode *)prevNode {
    
    if(!node) {
        return;
    }
    
    StackUsingArray *s = [[StackUsingArray alloc] init];
    TreeNode *temp = node;
    TreeNode *prev;
    TreeNode *swapNode;
    
    while(temp || ![s isEmpty]) {
        
        while(temp) {
            [s push:temp];
            temp = temp.left;
        }
        temp = [s top];
        [s pop];
        
        if(prev) {
            if(prev.data.integerValue > temp.data.integerValue) {
                if (!swapNode) {
                    swapNode = prev;
                }else {
                    NSNumber *tempValue = swapNode.data;
                    swapNode.data = temp.data;
                    temp.data = tempValue;
                }
                
            }
        }
        
        prev = temp;
        temp = temp.right;
    }
//
//    [self recoverBST:node.left prevNode:prevNode];
//
//    if(prevNode) {
//        if(prevNode.data.integerValue >= node.data.integerValue) {
//            NSNumber *temp = prevNode.data;
//            prevNode.data = node.data;
//            node.data = temp;
//        }
//    }
//        prevNode = node;
//
//
//    [self recoverBST:node.right prevNode:prevNode];
    
}

- (BOOL)isBST:(TreeNode *)node min:(NSInteger)min max:(NSInteger)max {

    if(!node) {
        return true;
    }

    if(node.data.integerValue < min || node.data.integerValue > max) {
        return false;
    }

    return [self isBST:node.left min:min max:node.data.integerValue] && [self isBST:node.right min:node.data.integerValue max:max];
}

+ (TreeNode *)createSubTreeWithRoot:(NSNumber *)rootValue left:(NSNumber *)left right:(NSNumber *)right {

    if (!rootValue) {
        return NULL;
    }

    TreeNode *root = [[TreeNode alloc] initWithValue:rootValue];

    root.left = left  ? [[TreeNode alloc] initWithValue:left] : NULL;
    root.right = right ? [[TreeNode alloc] initWithValue:right] : NULL;

    return root;
}


+ (BST *)getTree {

    //Creating tree
    TreeNode *root = [BST createSubTreeWithRoot:@8 left:@4 right:@12];
    //   8
    // 4 12

    root.left.left = [BST createSubTreeWithRoot:@2 left:@1 right:@3];
    root.left.right = [BST createSubTreeWithRoot:@6 left:@5 right:@9];
    //          8
    //      4      12
    //   2   6
    // 1 3 5 7

    root.right.left = [BST createSubTreeWithRoot:@10 left:@7 right:@11];
    root.right.right = [BST createSubTreeWithRoot:@14 left:@13 right:@15];

    //            8
    //      4            12
    //   2    6       10    14
    // 1  3  5  7   9  11 13 15

    BST *tree = [[BST alloc] initWithRoot:root];
    return tree;
}

+ (void)treeImplementation {

    BST *tree = [BST getTree];
    [tree printInOrder:tree.root];

    [tree recoverBST:tree.root prevNode:NULL];
     [tree printInOrder:tree.root];
//    [tree isBST:tree.root min:NSIntegerMin max:NSIntegerMax] ? NSLog(@"BST") : NSLog(@"Not BST");
}


@end

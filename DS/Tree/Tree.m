#import "Tree.h"
#import "TreeNode.h"
#import "QueueUsingArray.h"
#import "StackUsingArray.h"

@interface Tree()

@property (nonatomic) TreeNode *root;

@end

@implementation Tree

- (instancetype)initWithRoot:(TreeNode *)root {
    self = [super init];
    if(self) {
        self.root = root;
    }
    return self;
}

- (void)printLevelOrder:(TreeNode *)node {
    QueueUsingArray *q = [[QueueUsingArray alloc] init];
    if(node ==  NULL) {
        return; 
    }
    [q enqueue:node];

    while(![q isEmpty]) {
        TreeNode *temp = [q dequeue];
        NSLog(@"%@", temp.data);
        if(temp.left !=  NULL) {
            [q enqueue:temp.left];
        }
        if(temp.right !=  NULL) {
            [q enqueue:temp.right];
        }
    }
}

- (void)printInOrder:(TreeNode *)node {

    if(node ==  NULL) {
        return; 
    }
    [self printInOrder:node.left];
    NSLog(@"%@", node.data);
    [self printInOrder:node.right];
}

- (void)printPostOrder:(TreeNode *)node {
    if(node ==  NULL) {
        return; 
    }
    [self printPostOrder:node.left];
    [self printPostOrder:node.right];
    NSLog(@"%@", node.data);
}

- (void)printPreOrder:(TreeNode *)node {
    if(node ==  NULL) {
        return; 
    }
    NSLog(@"%@", node.data);
    [self printPreOrder:node.left];
    [self printPreOrder:node.right];
}

- (NSInteger)heightOfTree:(TreeNode *)node {
    if(node ==  NULL) {
        return 0; 
    }
    return MAX([self heightOfTree:node.left], [self heightOfTree:node.right]) + 1;
}

- (void)densityOfTree {

    float height = [self heightOfTree:self.root];
    float size = [self sizeOfTree:self.root];

    NSLog(@"Density %f", size / height);
}

- (NSInteger)sizeOfTree:(TreeNode *)node {
    
    if(node == NULL) {
        return 0;
    }
    
    if(node.left ==  NULL && node.right == NULL) {
        return 1; 
    }
    return [self sizeOfTree:node.left] + [self sizeOfTree:node.right] + 1;
}

- (void)printSprialLevel:(TreeNode *)node {
    
    StackUsingArray *s1 = [[StackUsingArray alloc] init];
    if(node ==  NULL) {
        return;
    }
    [s1 push:node];
    
    StackUsingArray *s2 = [[StackUsingArray alloc] init];
    
    while(![s1 isEmpty] || ![s2 isEmpty]) {
        while(![s1 isEmpty]) {
            TreeNode *top1 = [s1 top];
            [s1 pop];
            NSLog(@"%@", top1.data);
            if(top1.right !=  NULL) {
                [s2 push:top1.right];
            }
            
            if(top1.left !=  NULL) {
                [s2 push:top1.left];
            }
        }
        
        while(![s2 isEmpty]) {
            TreeNode *top2 = [s2 top];
            [s2 pop];
            NSLog(@"%@", top2.data);
            
            if(top2.left !=  NULL) {
                [s1 push:top2.left];
            }
            if(top2.right !=  NULL) {
                [s1 push:top2.right];
            }
            
        }
    }
}

- (BOOL)checkIfTwoTreeEqualWithRoot1:(TreeNode *)root1 root2:(TreeNode *)root2 {

    if(root1 == NULL && root2 == NULL) {
        return true;
    }

    if(root1 == NULL || root2 == NULL) {
        return false;
    }

    return (root1.data == root2.data) && [self checkIfTwoTreeEqualWithRoot1:root1.left root2:root2.left] && [self checkIfTwoTreeEqualWithRoot1:root1.right root2:root2.right];
}

- (BOOL)checkIfSubTreeWithTreeRoot:(TreeNode *)tRoot subtreeRoot:(TreeNode *)sRoot {
    if (sRoot == NULL) {
        return true;
    }
    
    if(tRoot == NULL) {
        return false;
    }
    
    return [self checkIfTwoTreeEqualWithRoot1:tRoot root2:sRoot] || [self checkIfSubTreeWithTreeRoot:tRoot.left subtreeRoot:sRoot] || [self checkIfSubTreeWithTreeRoot:tRoot.right subtreeRoot:sRoot];
}

- (BOOL)checkSymmetricTree:(TreeNode *)root {
    return false;
}

- (BOOL)checkIfTwoTreeMirrorWithRoot1:(TreeNode *)root1 root2:(TreeNode *)root2 {
    return false;
}

- (void)

- (TreeNode *)mergeTreeWithRoot1:(TreeNode *)root1 root2:(TreeNode *)root2 {
    if(root1 == NULL && root2 == NULL) {
        return NULL;
    }

    if(root1 == NULL) {
        return root2;
    }else {
        root1.data = [[NSNumber alloc] initWithInteger:root1.data.integerValue + root2.data.integerValue];
        root1.left = [self mergeTreeWithRoot1:root1.left root2:root2.left];
        root1.right = [self mergeTreeWithRoot1:root1.right root2:root2.right];
    }
    return root1;
}

- (void)printPathToLeaf:(TreeNode *)node pathArray:(NSArray *)pathArray pathLength:(NSInteger)pathLength {
    if(node == NULL) {
        return;
    }
    NSMutableArray *pathArr = [NSMutableArray arrayWithArray:pathArray];
    [pathArr addObject:node.data];
    pathLength++;

    if(node.left == NULL && node.right == NULL) {
        for(int i = 0; i < pathLength; i++) {
            NSLog(@"%@", pathArr[i]);
        }
    }

    [self printPathToLeaf:node.left pathArray:pathArr pathLength:pathLength];
    [self printPathToLeaf:node.right pathArray:pathArr pathLength:pathLength];
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

+ (Tree *)getTree {
    
    //Creating tree
    TreeNode *root = [Tree createSubTreeWithRoot:@12 left:@13 right:@14];
    //  12
    // 13 14
    
    root.left.left = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
    root.left.right = [Tree createSubTreeWithRoot:@18 left:@19 right:@20];
    //          12
    //      13      14
    //   15   18
    // 16 17 19 20
    
    root.right.left = [Tree createSubTreeWithRoot:@21 left:@22 right:@23];
    root.right.right = [Tree createSubTreeWithRoot:@24 left:@25 right:@26];
    
    //            12
    //      13           14
    //   15   18      21    24
    // 16 17 19 20  22  23 25 26
    
    Tree *tree = [[Tree alloc] initWithRoot:root];
    return tree;
}

+ (void)treeImplementation {
    
    Tree *tree = [Tree getTree];
    
    //    [tree printLevelOrder:tree.root];
    //    [tree printSprialLevel:tree.root];
    
    //    [tree printPreOrder:tree.root];
    //    [tree printInOrder:tree.root];
    //    [tree printPostOrder:tree.root];
    //
    //    NSLog(@"Height %ld", (long)[tree heightOfTree:tree.root]);
    //    NSLog(@"Size %ld", (long)[tree sizeOfTree:tree.root]);
    //    [tree densityOfTree];
    //
    
    //    [tree printPathToLeaf:tree.root pathArray:@[] pathLength:0];
    
    
    //    //Creating tree
    //    TreeNode *root1 = [Tree createSubTreeWithRoot:@11 left:@13 right:@14];
    //    //  11
    //    // 13 14
    //
    //    root1.left.left = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
    //    root1.left.right = [Tree createSubTreeWithRoot:@18 left:@19 right:@20];
    //    //          11
    //    //      13      14
    //    //   15   18
    //    // 16 17 19 20
    //
    //    root1.right.left = [Tree createSubTreeWithRoot:@21 left:@22 right:@23];
    //    root1.right.right = [Tree createSubTreeWithRoot:@24 left:@25 right:@26];
    //
    //    //            11
    //    //      13           14
    //    //   15   18      21    24
    //    // 16 17 19 20  22  23 25 26
    //
    //    Tree *tree1 = [[Tree alloc] initWithRoot:root1];
    //
    //    BOOL isEqual = [tree checkIfTwoTreeEqualWithRoot1:tree.root root2:tree1.root];
    //    isEqual ? NSLog(@"Equal") : NSLog(@"Not Equal");
    
    
    //    //Creating tree
    //    TreeNode *root1 = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
    //    //  15
    //    // 16 17
    //
    //
    //    Tree *tree1 = [[Tree alloc] initWithRoot:root1];
    //
    //    BOOL isSubtree = [tree checkIfSubTreeWithTreeRoot:tree.root subtreeRoot:tree1.root];
    //    isSubtree ? NSLog(@"Subtree") : NSLog(@"Not Subtree");
    
        
       //Creating tree
       TreeNode *root1 = [Tree createSubTreeWithRoot:@15 left:@16 right:@17];
       //  15
       // 16 17
    
    
       Tree *tree1 = [[Tree alloc] initWithRoot:root1];
    
       TreeNode *mergeRoot = [tree mergeTreeWithRoot1:tree.root root2:tree1.root];
        Tree *mergeTree = [[Tree alloc] initWithRoot:mergeRoot];
       [mergeTree printLevelOrder:mergeTree.root];

}

@end

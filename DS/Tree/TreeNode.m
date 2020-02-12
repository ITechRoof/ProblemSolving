#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithValue:(NSNumber *)value {

    self = [super init];
    if(self) {
        self.data = value;
    }
    return self;
}

- (BOOL)isLeaf
{
    return self.left == NULL && self.right == NULL;
}

- (id)copyWithZone:(NSZone *)zone {
    TreeNode *node = [[TreeNode alloc] initWithValue:self.data];
    node.left = [self.left copy];
    node.right = [self.right copy];
    
    return node;
}

@end

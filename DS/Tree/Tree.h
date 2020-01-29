#import <Foundation/Foundation.h>
#import "TreeNode.h"

@interface Tree: NSObject <NSCopying>

@property (nonatomic) TreeNode *root;

- (instancetype)initWithRoot:(TreeNode *)root;
- (void)printLevelOrder;
+ (TreeNode *)createSubTreeWithRoot:(NSNumber *)rootValue left:(NSNumber *)left right:(NSNumber *)right;

-( id)copyWithZone:(NSZone *)zone;
+ (void)treeImplementation;

@end

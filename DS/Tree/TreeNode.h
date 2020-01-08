#import <Foundation/Foundation.h>

@interface TreeNode: NSObject

@property (nonatomic) NSNumber *data;
@property (nonatomic) TreeNode *left;
@property (nonatomic) TreeNode *right;

- (instancetype)initWithValue:(NSNumber *)value;

@end

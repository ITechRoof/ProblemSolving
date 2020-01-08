#import <Foundation/Foundation.h>

@interface TreeNode: NSObject<NSCopying>

@property (nonatomic) NSNumber *data;
@property (nonatomic) TreeNode *left;
@property (nonatomic) TreeNode *right;

- (instancetype)initWithValue:(NSNumber *)value;
- (id)copyWithZone:(NSZone *)zone;

@end

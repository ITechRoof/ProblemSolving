#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithValue:(NSNumber *)value {

    self = [super init];
    if(self) {
        self.data = value;
    }
    return self;
}

@end

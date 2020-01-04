//
//  DoubleListNode.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 02/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "DoubleListNode.h"

@implementation DoubleListNode

- (instancetype) initWithValue: (id) value {
    self = [super init];
    if (self) {
        self.data = value;
        self.prev = NULL;
        self.next = NULL;
    }
    return self;
}
@end

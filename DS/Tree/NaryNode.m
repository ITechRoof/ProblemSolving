//
//  NaryNode.m
//  DS
//
//  Created by Kiruthika on 12/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "NaryNode.h"

@implementation NaryNode

- (instancetype)initWithValue:(NSNumber *)data
{
    self = [super init];
    if(self)
    {
        self.data = data;
        self.children = [NSArray array];
    }
    return self;
}
@end

//
//  Edge.m
//  DS
//
//  Created by Kiruthika on 15/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "Edge.h"

@implementation Edge

- (instancetype)initWithStartVertex:(NSInteger)start endVertex:(NSInteger)end
{
    self = [super init];
    if(self)
    {
        self.startVertex = start;
        self.endVertex = end;
    }
    return self;
}

@end

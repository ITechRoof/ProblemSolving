//
//  Edge.h
//  DS
//
//  Created by Kiruthika on 15/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Edge : NSObject

@property (nonatomic) NSInteger startVertex;
@property (nonatomic) NSInteger endVertex;

- (instancetype)initWithStartVertex:(NSInteger)start endVertex:(NSInteger)end;

@end

NS_ASSUME_NONNULL_END

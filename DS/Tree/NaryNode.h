//
//  NaryNode.h
//  DS
//
//  Created by Kiruthika on 12/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NaryNode : NSObject

@property (nonatomic) NSNumber *data;
@property (nonatomic) NSArray<NaryNode *> *children;

- (instancetype)initWithValue:(NSNumber *)data;

@end

NS_ASSUME_NONNULL_END

//
//  QueueUsingArray.h
//  DS
//
//  Created by Kiruthika Selvavinayagam on 06/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QueueUsingArray : NSObject

- (void)enqueue:(id)value;
- (id)dequeue;
- (BOOL)isEmpty;
- (NSInteger)sizeOfQueue;

+ (void)solution;

@end

NS_ASSUME_NONNULL_END

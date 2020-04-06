//
//  PriorityQueue.h
//  DS
//
//  Created by Kiruthika on 06/04/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pair.h"
NS_ASSUME_NONNULL_BEGIN

@interface PriorityQueue : NSObject

- (Pair *)extractMax;
- (void)push:(Pair *)data;
- (BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END

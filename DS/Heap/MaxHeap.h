//
//  MaxHeap.h
//  DS
//
//  Created by Kiruthika on 05/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MaxHeap : NSObject

- (instancetype)initWithArray:(NSArray *)arr;
- (NSNumber *)extractMax;

+ (void)heapImplementation;

@end

NS_ASSUME_NONNULL_END

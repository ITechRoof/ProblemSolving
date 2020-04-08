//
//  StackUsingArray.h
//  DS
//
//  Created by Kiruthika Selvavinayagam on 02/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StackUsingArray : NSObject

- (void)push:(id)value;
- (void)pop;
- (id)top;
- (BOOL)isEmpty;
- (NSInteger)sizeOfStack;

+ (void)stackImplementation;

@end

NS_ASSUME_NONNULL_END

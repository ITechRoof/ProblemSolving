//
//  DoubleListNode.h
//  DS
//
//  Created by Kiruthika Selvavinayagam on 02/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoubleListNode: NSObject

@property (nonatomic) id data;
@property DoubleListNode *prev;
@property DoubleListNode *next;

- (instancetype) initWithValue: (id) value;

@end


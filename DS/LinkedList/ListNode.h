//
//  ListNode.h
//  DS
//
//  Created by Kiruthika Selvavinayagam on 26/12/19.
//  Copyright © 2019 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListNode : NSObject

@property (nonatomic) id data;
@property ListNode *next;

- (instancetype) initWithValue: (id) value;

@end

@interface ListIntNode : NSObject

@property (nonatomic) NSInteger data;
@property ListIntNode *next;

- (instancetype) initWithValue: (NSInteger) value;

@end

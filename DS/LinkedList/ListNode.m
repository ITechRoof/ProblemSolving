//
//  ListNode.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 26/12/19.
//  Copyright © 2019 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

@implementation ListNode

- (instancetype) initWithValue: (id) value {
  self = [super init];
  if (self) {
      self.data = value;
      self.next = NULL;
  }
  return self;
}

@end

@implementation ListIntNode

- (instancetype) initWithValue: (NSInteger) value {
  self = [super init];
  if (self) {
      self.data = value;
      self.next = NULL;
  }
  return self;
}

@end


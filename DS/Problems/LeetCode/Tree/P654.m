//
//  P654.m
//  DS
//
//  Created by Kiruthika on 29/01/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P654.h"
#import "Tree.h"
#import "TreeNode.h"

@interface P654()

@property (nonatomic) NSArray <NSNumber *>*inputArray;

@end

@implementation P654

- (NSInteger)maxIndexWithStart:(NSInteger)start endIndex:(NSInteger)end
{
    NSInteger maxIndex = start > end ? -1 : start;

    while(start <= end)
    {
      if(self.inputArray[maxIndex].integerValue < self.inputArray[start].integerValue)
      {
        maxIndex = start;
      }
      start++;
    }
    return maxIndex;
}

- (TreeNode *)constructTreeWithStart:(NSInteger)start endIndex:(NSInteger)end
{
    NSInteger rootIndex = [self maxIndexWithStart:start endIndex:end];
    if(rootIndex == -1)
    {
      return NULL;
    }
    TreeNode *root = [[TreeNode alloc] initWithValue:self.inputArray[rootIndex]];
    root.left = [self constructTreeWithStart:start endIndex:rootIndex-1];
    root.right = [self constructTreeWithStart:rootIndex+1 endIndex:end];
    return root;
}

- (Tree *)getMaximumArray:(NSArray *)inputArray
{
    self.inputArray = inputArray;

    Tree *tree = [[Tree alloc] initWithRoot:[self constructTreeWithStart:0 endIndex:inputArray.count-1]];
   
    return tree;
}

+ (void)solution
{
    NSArray *inputCase1 = @[@3,@2,@1,@6,@0,@5];

    P654 *case1 = [[P654 alloc] init];
    Tree *tree1 = [case1 getMaximumArray:inputCase1];
    [tree1 printLevelOrder];
}
@end

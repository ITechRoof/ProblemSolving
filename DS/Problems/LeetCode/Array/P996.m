//
//  P996.m
//  DS
//
//  Created by Kiruthika on 09/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P996.h"

@implementation P996

- (NSInteger)dfsHelperWithvertex:(NSNumber *)vertex  pair:(NSMapTable *)vertexPair visited:(NSMapTable *)visited
{
    NSInteger ans = 0;
    if([[visited objectForKey:vertex] isEqual:@NO])
    {
        [visited setObject:@YES forKey:vertex];
        NSArray *neighbours = [vertexPair objectForKey:vertex];
        for(NSNumber *neighborVertex in neighbours)
        {
            ans = MAX(ans, [self dfsHelperWithvertex:neighborVertex pair:vertexPair visited:[visited mutableCopy]]);
        }
    }
    
    if(![visited.objectEnumerator.allObjects containsObject:@NO])
    {
        return 1;
    }
    return ans;
}

- (NSInteger)numberOfSquarefulArray:(NSArray<NSNumber *> *)array
{
    NSMapTable *vertexCount =[[NSMapTable alloc] init];
    for(int i = 0; i < array.count; i++)
    {
        NSNumber *count = [vertexCount objectForKey:array[i]] ?: @0;
        [vertexCount setObject:[NSNumber numberWithInteger:count.integerValue + 1] forKey:array[i]];
    }
    
    NSMapTable *vertexPair =[[NSMapTable alloc] init];
    
    for(NSNumber *val1 in vertexCount.keyEnumerator.allObjects)
    {
        for(NSNumber *val2 in vertexCount.keyEnumerator.allObjects)
        {
            if(val1 != val2)
            {
                NSInteger val = pow(val1.integerValue + val2.integerValue + 0.5, 0.5);
                if (val * val == val1.integerValue + val2.integerValue)
                {
                    NSMutableArray *startArray = [[NSMutableArray alloc] initWithArray:[vertexPair objectForKey:val1] ?: @[]];
                    if(![startArray containsObject:val2])
                    {
                        [startArray addObject:val2];
                        [vertexPair setObject:startArray forKey:val1];
                    }
                    
                    
                    NSMutableArray *endArray = [[NSMutableArray alloc] initWithArray:[vertexPair objectForKey:val2] ?: @[]];
                    if(![endArray containsObject:val1])
                    {
                        [endArray addObject:val1];
                        [vertexPair setObject:endArray forKey:val2];
                    }
                    
                }
            }
            
        }
    }
    
    NSMapTable *visited = [[NSMapTable alloc] init];
    for(NSNumber *vertex in vertexCount.keyEnumerator.allObjects)
    {
        [visited setObject:@NO forKey:vertex];
    }
    
    NSInteger result = 0;
    for(NSNumber *vertex in vertexCount.keyEnumerator.allObjects)
    {
        result = result + [self dfsHelperWithvertex:vertex pair:vertexPair visited:[visited mutableCopy]];
    }
    return result;
}

+ (void)solution
{
    P996 *case1 = [[P996 alloc] init];
    NSLog(@"%ld", (long)[case1 numberOfSquarefulArray:@[@1, @17, @8]]);
    
    P996 *case2 = [[P996 alloc] init];
    NSLog(@"%ld", (long)[case2 numberOfSquarefulArray:@[@2, @2, @2]]);
}
@end

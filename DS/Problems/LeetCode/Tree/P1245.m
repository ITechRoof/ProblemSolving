//
//  P1245.m
//  DS
//
//  Created by Kiruthika on 15/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P1245.h"
#import "Edge.h"

@implementation P1245

- (void)dfsHelper:(NSMapTable *)adjList visited:(NSMutableArray<NSNumber *> ** )visited startVertex:(NSNumber *)start farthestVertex:(NSNumber **)farthest count:(NSInteger)count maxCount:(NSInteger *)maxCount
{
    [*visited replaceObjectAtIndex:start.integerValue - 1 withObject:[NSNumber numberWithBool:YES]];
    count++;
    
    NSArray<NSNumber *> *neighBors = [adjList objectForKey:start];
    for (NSNumber *vertex in neighBors) {
        if([*visited objectAtIndex:vertex.integerValue - 1] != [NSNumber numberWithBool:YES])
        {
            if(count > *maxCount)
            {
                *maxCount = count;
                *farthest = vertex;
            }
            [self dfsHelper:adjList visited:visited startVertex:vertex farthestVertex:farthest count:count maxCount:maxCount];
        }
    }
}

- (NSInteger)treeDiameterForNode:(NSInteger)node edges:(NSArray *)edges
{
    NSMapTable *adjacencyList =[[NSMapTable alloc] init];
    
    for (Edge *edge in edges) {
        NSNumber *start = [NSNumber numberWithInteger:edge.startVertex];
        NSNumber *end = [NSNumber numberWithInteger:edge.endVertex];
        
        NSMutableArray *startArray = [[NSMutableArray alloc] initWithArray:[adjacencyList objectForKey:start] ?: @[]];
        [startArray addObject:end];
        [adjacencyList setObject:startArray forKey:start];
        
        NSMutableArray *endArray = [[NSMutableArray alloc] initWithArray:[adjacencyList objectForKey:end] ?: @[]];
        [endArray addObject:start];
        [adjacencyList setObject:endArray forKey:end];
    }
    
    NSMutableArray *visited = [[NSMutableArray alloc] init];
    for(int i = 0; i < node; i++)
    {
        [visited addObject:[NSNumber numberWithBool:NO]];
    }
    NSNumber *farthest;
    NSInteger count = 0, maxCount = 0;

   [self dfsHelper:adjacencyList visited:&visited startVertex:@1 farthestVertex:&farthest count:count maxCount:&maxCount];
    
    NSNumber *otherFarthest;
    visited = [[NSMutableArray alloc] init];
    for(int i = 0; i < node; i++)
    {
        [visited addObject:[NSNumber numberWithBool:NO]];
    }
    [self dfsHelper:adjacencyList visited:&visited startVertex:farthest farthestVertex:&otherFarthest count:count maxCount:&maxCount];

    return maxCount;
}

+ (void)solution
{
    P1245 *case1 = [[P1245 alloc] init];
    
    NSArray *edges = @[[[Edge alloc] initWithStartVertex:1 endVertex:2],
                       [[Edge alloc] initWithStartVertex:2 endVertex:4],
                       [[Edge alloc] initWithStartVertex:2 endVertex:5],
                       [[Edge alloc] initWithStartVertex:1 endVertex:3],
                       [[Edge alloc] initWithStartVertex:4 endVertex:6],
                       [[Edge alloc] initWithStartVertex:4 endVertex:7],
                       [[Edge alloc] initWithStartVertex:5 endVertex:8],
                       [[Edge alloc] initWithStartVertex:5 endVertex:9]];
    
    NSLog(@"%ld", (long)[case1 treeDiameterForNode:9 edges:edges]);
}

@end

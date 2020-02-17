//For an undirected graph with tree characteristics, we can choose any node as the root. The result graph is then a rooted tree. Among all possible rooted trees, those with minimum height are called minimum height trees (MHTs). Given such a graph, write a function to find all the MHTs and return a list of their root labels.
//
//Format
//The graph contains n nodes which are labeled from 0 to n - 1. You will be given the number n and a list of undirected edges (each edge is a pair of labels).
//
//You can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
//
//Example 1 :
//
//Input: n = 4, edges = [[1, 0], [1, 2], [1, 3]]
//
//        0
//        |
//        1
//       / \
//      2   3
//
//Output: [1]
//Example 2 :
//
//Input: n = 6, edges = [[0, 3], [1, 3], [2, 3], [4, 3], [5, 4]]
//
//     0  1  2
//      \ | /
//        3
//        |
//        4
//        |
//        5
//
//Output: [3, 4]
//Note:
//
//According to the definition of tree on Wikipedia: “a tree is an undirected graph in which any two vertices are connected by exactly one path. In other words, any connected graph without simple cycles is a tree.”
//The height of a rooted tree is the number of edges on the longest downward path between the root and a leaf.

#import "P310.h"
#import "Edge.h"

@implementation P310

- (NSArray *)minimumHeightTreeForNode:(NSInteger)nodeCount edges:(NSArray <Edge*> *)edges
{
    NSMapTable *vertexArray =[[NSMapTable alloc] init];
    
    for (Edge *edge in edges) {
        NSNumber *start = [NSNumber numberWithInteger:edge.startVertex];
        NSNumber *end = [NSNumber numberWithInteger:edge.endVertex];
        
        NSMutableArray *startArray = [[NSMutableArray alloc] initWithArray:[vertexArray objectForKey:start] ?: @[]];
        [startArray addObject:end];
        [vertexArray setObject:startArray forKey:start];
        
        NSMutableArray *endArray = [[NSMutableArray alloc] initWithArray:[vertexArray objectForKey:end] ?: @[]];
        [endArray addObject:start];
        [vertexArray setObject:endArray forKey:end];
    }
    
    
    NSMutableArray *leaves = [[NSMutableArray alloc] init];
    for (NSNumber *key in [vertexArray keyEnumerator] ) {
        NSArray *neighbor = [vertexArray objectForKey:key];
        if(neighbor.count == 1)
        {
            [leaves addObject:key];
        }
    }
    
    while(nodeCount > 2)
    {
        NSMutableArray *newLeaves = [[NSMutableArray alloc] init];
        
        for (NSNumber *leaf in leaves) {
            NSArray *neighbor = [vertexArray objectForKey:leaf];
            //Removing leaf
            [vertexArray removeObjectForKey:leaf];
            nodeCount--;
            //removing leaf from neighbours
            NSMutableArray *neighborArray = [[NSMutableArray alloc] initWithArray:[vertexArray objectForKey:neighbor.firstObject] ?: @[]];
            [neighborArray removeObject:leaf];
            [vertexArray setObject:neighborArray forKey:neighbor.firstObject];
            
            if(neighborArray.count == 1)
            {
                [newLeaves addObject:neighbor.firstObject];
            }
        }
        leaves = newLeaves;
    }
    
    return leaves;
}

+ (void)solution
{
    P310 *case1 = [[P310 alloc] init];
    
    NSArray *minimumHeightRoot = [case1 minimumHeightTreeForNode:4 edges:@[[[Edge alloc] initWithStartVertex:1 endVertex:0], [[Edge alloc] initWithStartVertex:1 endVertex:2], [[Edge alloc] initWithStartVertex:1 endVertex:3]]];
    NSLog(@"%@", minimumHeightRoot);
    
    NSArray *minimumHeightRoot1 = [case1 minimumHeightTreeForNode:6 edges:@[[[Edge alloc] initWithStartVertex:0 endVertex:3], [[Edge alloc] initWithStartVertex:1 endVertex:3], [[Edge alloc] initWithStartVertex:2 endVertex:3], [[Edge alloc] initWithStartVertex:4 endVertex:3], [[Edge alloc] initWithStartVertex:5 endVertex:4]]];
    NSLog(@"%@", minimumHeightRoot1);
}

@end

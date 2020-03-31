//
//  P1169.m
//  DS
//
//  Created by Kiruthika on 31/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//
//https://leetcode.com/problems/invalid-transactions/
//A transaction is possibly invalid if:
//
//the amount exceeds $1000, or;
//if it occurs within (and including) 60 minutes of another transaction with the same name in a different city.
//Each transaction string transactions[i] consists of comma separated values representing the name, time (in minutes), amount, and city of the transaction.
//
//Given a list of transactions, return a list of transactions that are possibly invalid.  You may return the answer in any order.
//
//
//
//Example 1:
//
//Input: transactions = ["alice,20,800,mtv","alice,50,100,beijing"]
//Output: ["alice,20,800,mtv","alice,50,100,beijing"]
//Explanation: The first transaction is invalid because the second transaction occurs within a difference of 60 minutes, have the same name and is in a different city. Similarly the second one is invalid too.
//Example 2:
//
//Input: transactions = ["alice,20,800,mtv","alice,50,1200,mtv"]
//Output: ["alice,50,1200,mtv"]
//Example 3:
//
//Input: transactions = ["alice,20,800,mtv","bob,50,1200,mtv"]
//Output: ["bob,50,1200,mtv"]
//
//
//Constraints:
//
//transactions.length <= 1000
//Each transactions[i] takes the form "{name},{time},{amount},{city}"
//Each {name} and {city} consist of lowercase English letters, and have lengths between 1 and 10.
//Each {time} consist of digits, and represent an integer between 0 and 1000.
//Each {amount} consist of digits, and represent an integer between 0 and 2000.

#import "P1169.h"

@implementation P1169
- (NSArray *)invalidTransactions:(NSArray *)transactions
{
    NSMutableArray *res = [NSMutableArray array];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < transactions.count; i++) {
        NSArray *comp = [transactions[i] componentsSeparatedByString:@","];
        NSNumber *currentAmount = (NSNumber *)comp[2];

        if(currentAmount.integerValue > 1000)
        {
            [res addObject:transactions[i]];
            continue;
        }
        NSString *earlierTrans = [dict objectForKey:comp[0]];
        if(earlierTrans)
        {
            NSArray *earlierComp = [earlierTrans componentsSeparatedByString:@","];

            NSNumber *currentTime = (NSNumber *)comp[1];
            if (currentTime.integerValue - ((NSNumber *)earlierComp[1]).integerValue <= 60) {
                [res addObject:earlierTrans];
                [res addObject:transactions[i]];
                [dict removeObjectForKey:comp[0]];
            }
        }
        else
        {
            [dict setObject:transactions[i] forKey:comp[0]];
        }
    }
    return res;
}

+ (void)solution
{
    P1169 *case1 = [[P1169 alloc] init];
    NSLog(@"%@", [case1 invalidTransactions:@[@"alice,20,800,mtv",@"alice,50,100,beijing"]]);
    NSLog(@"%@", [case1 invalidTransactions:@[@"alice,20,800,mtv",@"alice,50,1200,mtv"]]);
    NSLog(@"%@", [case1 invalidTransactions:@[@"alice,20,800,mtv",@"bob,50,1200,mtv"]]);
}
@end

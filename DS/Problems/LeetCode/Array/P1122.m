//
//  P1122.m
//  DS
//
//  Created by Kiruthika on 24/02/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

#import "P1122.h"

@implementation P1122

- (NSArray *)relativeSort:(NSArray *)input refArray:(NSArray <NSNumber *>*)refArray
{
    NSMutableArray <NSNumber *>*result = [NSMutableArray arrayWithArray:input];
    if(refArray.count > 0)
    {
        int lastndex = 0;
        for(int i = 0; i < refArray.count; i++)
        {
            NSNumber *key = refArray[i];
            for(int j = lastndex; j < result.count; j++)
            {
                if(result[j].integerValue != key.integerValue)
                {
                    for(int k = j+1; k < result.count; k++)
                    {
                        if(result[k].integerValue == key.integerValue)
                        {
                            NSNumber *temp = result[k];
                            result[k] = result[j];
                            result[j] = temp;
                            lastndex = j + 1;
                            break;
                        }
                    }
                }
            }
        }
    }
    return result;
}

+ (void)solution
{
    P1122 *case1 = [[P1122 alloc] init];
    NSLog(@"%@", [case1 relativeSort:@[@2,@3,@1,@3,@2,@4,@6,@7,@9,@2,@19] refArray:@[@2,@1,@4,@3,@9,@6]]);
}
@end

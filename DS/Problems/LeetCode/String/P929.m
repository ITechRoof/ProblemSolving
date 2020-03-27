//
//  P929.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/unique-email-addresses/
//Every email consists of a local name and a domain name, separated by the @ sign.
//
//For example, in alice@leetcode.com, alice is the local name, and leetcode.com is the domain name.
//
//Besides lowercase letters, these emails may contain '.'s or '+'s.
//
//If you add periods ('.') between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name.  For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.  (Note that this rule does not apply for domain names.)
//
//If you add a plus ('+') in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered, for example m.y+name@email.com will be forwarded to my@email.com.  (Again, this rule does not apply for domain names.)
//
//It is possible to use both of these rules at the same time.
//
//Given a list of emails, we send one email to each address in the list.  How many different addresses actually receive mails?
//
//
//
//Example 1:
//
//Input: ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
//Output: 2
//Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails

#import "P929.h"

@implementation P929

- (NSInteger)numUniqueEmails:(NSArray *)arr
{
    NSMutableSet *set = [NSMutableSet set];
    for (NSString *e in arr) {
        NSArray *comp = [e componentsSeparatedByString:@"@"];
        NSString *local = comp.firstObject;
        NSString *domain = comp.lastObject;
        
        local = [local componentsSeparatedByString:@"+"].firstObject;
        local = [local stringByReplacingOccurrencesOfString:@"." withString:@""];
        
        [set addObject:[[local stringByAppendingString:@"@"] stringByAppendingString:domain]];
    }
    return set.count;
}

+ (void)solution
{
    P929 *case1 = [[P929 alloc] init];
    NSLog(@"%ld", (long)[case1 numUniqueEmails:@[@"test.email+alex@leetcode.com",@"test.e.mail+bob.cathy@leetcode.com",@"testemail+david@lee.tcode.com"]]);
}

@end

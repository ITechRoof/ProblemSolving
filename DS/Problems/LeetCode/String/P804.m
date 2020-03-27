//
//  P804.m
//  DS
//
//  Created by Kiruthika on 27/03/20.
//  Copyright © 2020 Kiruthika Selvavinayagam. All rights reserved.
//

//https://leetcode.com/problems/unique-morse-code-words/
//International Morse Code defines a standard encoding where each letter is mapped to a series of dots and dashes, as follows: "a" maps to ".-", "b" maps to "-...", "c" maps to "-.-.", and so on.
//
//For convenience, the full table for the 26 letters of the English alphabet is given below:
//
//[".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
//Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cba" can be written as "-.-..--...", (which is the concatenation "-.-." + "-..." + ".-"). We'll call such a concatenation, the transformation of a word.
//
//Return the number of different transformations among all words we have.
//
//Example:
//Input: words = ["gin", "zen", "gig", "msg"]
//Output: 2
//Explanation:
//The transformation of each word is:
//"gin" -> "--...-."
//"zen" -> "--...-."
//"gig" -> "--...--."
//"msg" -> "--...--."
//
//There are 2 different transformations, "--...-." and "--...--.".
//Note:
//
//The length of words will be at most 100.
//Each words[i] will have length in range [1, 12].
//words[i] will only consist of lowercase letters.

#import "P804.h"

@implementation P804
- (NSInteger)uniqueMorseRepresentations:(NSArray *)arr
{
    NSMutableSet *set = [NSMutableSet set];
    NSArray *map = @[@".-",@"-...",@"-.-.",@"-..",@".",@"..-.",@"--.",@"....",@"..",@".---",@"-.-",@".-..",@"--",@"-.",@"---",@".--.",@"--.-",@".-.",@"...",@"-",@"..-",@"...-",@".--",@"-..-",@"-.--",@"--.."];
    for (NSString *word in arr) {
        NSString *current = @"";
        for (NSInteger i = 0; i < word.length; i++) {
            current = [current stringByAppendingString:map[[word characterAtIndex:i] - 'a']];
        }
        
        [set addObject:current];
    }
    return set.count;
}

+ (void)solution
{
    P804 *case1 = [[P804 alloc] init];
    NSLog(@"%ld", (long)[case1 uniqueMorseRepresentations:@[@"gin", @"zen", @"gig", @"msg"]]);
}
@end

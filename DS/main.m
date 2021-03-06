//
//  main.m
//  DS
//
//  Created by Kiruthika Selvavinayagam on 26/12/19.
//  Copyright © 2019 Kiruthika Selvavinayagam. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LinkedList.h"
#import "DoubleLinkedList.h"

#import "StackUsingArray.h"
#import "Stack.h"

#import "QueueUsingArray.h"
#import "Queue.h"

#import "MinHeap.h"
#import "MaxHeap.h"

#import "Tree.h"
#import "BST.h"

#import "AddTwoList.h"
#import "SumOfTwoNo.h"
#import "SumOfTwoNoInSortedArray.h"

#import "P3.h"
#import "P5.h"
#import "P6.h"
#import "P8.h"
#import "P13.h"
#import "P14.h"
#import "P17.h"
#import "P20.h"
#import "P22.h"
#import "P28.h"
#import "P38.h"
#import "P43.h"
#import "P49.h"
#import "P58.h"
#import "P67.h"
#import "P71.h"
#import "P81.h"
#import "P91.h"
#import "P93.h"
#import "P94.h"
#import "P98.h"
#import "P100.h"
#import "P101.h"
#import "P102.h"
#import "P104.h"
#import "P107.h"
#import "P108.h"
#import "P110.h"
#import "P111.h"
#import "P112.h"
#import "P114.h"
#import "P117.h"
#import "P125.h"
#import "P144.h"
#import "P151.h"
#import "P153.h"
#import "P165.h"
#import "P167.h"
#import "P173.h"
#import "P189.h"
#import "P199.h"
#import "P215.h"
#import "P222.h"
#import "P226.h"
#import "P227.h"
#import "P230.h"
#import "P235.h"
#import "P257.h"
#import "P310.h"
#import "P330.h"
#import "P344.h"
#import "P345.h"
#import "P349.h"
#import "P360.h"
#import "P366.h"
#import "P383.h"
#import "P384.h"
#import "P385.h"
#import "P387.h"
#import "P394.h"
#import "P404.h"
#import "P415.h"
#import "P429.h"
#import "P434.h"
#import "P437.h"
#import "P438.h"
#import "P441.h"
#import "P442.h"
#import "P443.h"
#import "P448.h"
#import "P457.h"
#import "P459.h"
#import "P468.h"
#import "P501.h"
#import "P508.h"
#import "P513.h"
#import "P515.h"
#import "P520.h"
#import "P521.h"
#import "P522.h"
#import "P525.h"
#import "P526.h"
#import "P537.h"
#import "P538.h"
#import "P539.h"
#import "P541.h"
#import "P543.h"
#import "P545.h"
#import "P549.h"
#import "P551.h"
#import "P553.h"
#import "P556.h"
#import "P557.h"
#import "P558.h"
#import "P559.h"
#import "P561.h"
#import "P563.h"
#import "P565.h"
#import "P567.h"
#import "P572.h"
#import "P583.h"
#import "P589.h"
#import "P590.h"
#import "P606.h"
#import "P608.h"
#import "P609.h"
#import "P617.h"
#import "P623.h"
#import "P629.h"
#import "P637.h"
#import "P647.h"
#import "P653.h"
#import "P654.h"
#import "P657.h"
#import "P662.h"
#import "P663.h"
#import "P655.h"
#import "P665.h"
#import "P669.h"
#import "P671.h"
#import "P678.h"
#import "P680.h"
#import "P684.h"
#import "P686.h"
#import "P687.h"
#import "P696.h"
#import "P697.h"
#import "P700.h"
#import "P701.h"
#import "P709.h"
#import "P722.h"
#import "P767.h"
#import "P783.h"
#import "P788.h"
#import "P791.h"
#import "P804.h"
#import "P805.h"
#import "P809.h"
#import "P814.h"
#import "P816.h"
#import "P819.h"
#import "P824.h"
#import "P831.h"
#import "P842.h"
#import "P848.h"
#import "P852.h"
#import "P856.h"
#import "P859.h"
#import "P865.h"
#import "P869.h"
#import "P872.h"
#import "P889.h"
#import "P890.h"
#import "P893.h"
#import "P894.h"
#import "P896.h"
#import "P897.h"
#import "P905.h"
#import "P912.h"
#import "P915.h"
#import "P916.h"
#import "P917.h"
#import "P919.h"
#import "P925.h"
#import "P929.h"
#import "P932.h"
#import "P937.h"
#import "P938.h"
#import "P941.h"
#import "P942.h"
#import "P951.h"
#import "P958.h"
#import "P961.h"
#import "P965.h"
#import "P966.h"
#import "P968.h"
#import "P977.h"
#import "P979.h"
#import "P984.h"
#import "P987.h"
#import "P989.h"
#import "P993.h"
#import "P996.h"
#import "P998.h"
#import "P1003.h"
#import "P1008.h"
#import "P1016.h"
#import "P1021.h"
#import "P1022.h"
#import "P1023.h"
#import "P1026.h"
#import "P1028.h"
#import "P1047.h"
#import "P1048.h"
#import "P1071.h"
#import "P1081.h"
#import "P1095.h"
#import "P1104.h"
#import "P1108.h"
#import "P1110.h"
#import "P1119.h"
#import "P1122.h"
#import "P1123.h"
#import "P1130.h"
#import "P1138.h"
#import "P1146.h"
#import "P1156.h"
#import "P1169.h"
#import "P1170.h"
#import "P1177.h"
#import "P1189.h"
#import "P1209.h"
#import "P1213.h"
#import "P1221.h"
#import "P1233.h"
#import "P1234.h"
#import "P1243.h"
#import "P1245.h"
#import "P1247.h"
#import "P1249.h"
#import "P1250.h"
#import "P1261.h"
#import "P1268.h"
#import "P1295.h"
#import "P1297.h"
#import "P1302.h"
#import "P1305.h"
#import "P1309.h"
#import "P1311.h"
#import "P1312.h"
#import "P1315.h"
#import "P1324.h"
#import "P1325.h"
#import "P1328.h"
#import "P1332.h"
#import "P1339.h"
#import "P1347.h"
#import "P1358.h"
#import "P1370.h"
#import "P1371.h"
#import "P1374.h"
#import "P1379.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        NSLog(@"DS");
        
//        [LinkedList listImplementation];
//        [DoubleLinkedList doubleListImplementation];
//
//        [StackUsingArray stackImplementation];
//        [Stack stackImplementation];
//
//        [QueueUsingArray solution];
//        [Queue solution];
        
//        [MinHeap heapImplementation];
//        [MaxHeap heapImplementation];
//
//        [Tree treeImplementation];
//        [BST treeImplementation];
//
//        [AddTwoList solution];
//        [SumOfTwoNo solution];
//        [SumOfTwoNoInSortedArray solution];
//
//        [P3 solution];
//        [P5 solution];
//        [P6 solution];
//        [P8 solution];
//        [P13 solution];
//        [P14 solution];
//        [P17 solution];
//        [P20 solution];
//        [P22 solution];
//        [P28 solution];
//        [P38 solution];
//        [P43 solution];
//        [P49 solution];
//        [P58 solution];
//        [P67 solution];
//        [P71 solution];
//        [P81 solution];
//        [P91 solution];
//        [P93 solution];
//        [P94 solution];
//        [P98 solution];
//        [P100 solution];
//        [P101 solution];
//        [P102 solution];
//        [P104 solution];
//        [P107 solution];
//        [P108 solution];
//        [P110 solution];
//        [P111 solution];
//        [P112 solution];
//        [P114 solution];
        [P117 solution];
//        [P125 solution];
//        [P144 solution];
//        [P151 solution];
//        [P153 solution];
//        [P165 solution];
//        [P167 solution];
//        [P173 solution];
//        [P189 solution];
//        [P199 solution];
//        [P215 solution];
//        [P222 solution];
//        [P226 solution];
//        [P227 solution];
//        [P230 solution];
//        [P235 solution];
//        [P257 solution];
//        [P310 solution];
//        [P330 solution];
//        [P344 solution];
//        [P345 solution];
//        [P349 solution];
//        [P360 solution];
//        [P366 solution];
//        [P383 solution];
//        [P384 solution];
//        [P385 solution];
//        [P387 solution];
//        [P394 solution];
//        [P404 solution];
//        [P415 solution];
//        [P429 solution];
//        [P434 solution];
//        [P437 solution];
//        [P438 solution];
//        [P441 solution];
//        [P442 solution];
//        [P443 solution];
//        [P448 solution];
//        [P457 solution];
//        [P459 solution];
//        [P468 solution];
//        [P501 solution];
//        [P508 solution];
//        [P513 solution];
//        [P515 solution];
//        [P520 solution];
//        [P521 solution];
//        [P522 solution];
//        [P525 solution];
//        [P526 solution];
//        [P537 solution];
//        [P538 solution];
//        [P539 solution];
//        [P541 solution];
//        [P543 solution];
//        [P545 solution];
//        [P549 solution];
//        [P551 solution];
//        [P553 solution];
//        [P556 solution];
//        [P557 solution];
//        [P558 solution];
//        [P559 solution];
//        [P561 solution];
//        [P563 solution];
//        [P565 solution];
//        [P567 solution];
//        [P572 solution];
//        [P583 solution];
//        [P589 solution];
//        [P590 solution];
//        [P606 solution];
//        [P608 solution];
//        [P609 solution];
//        [P617 solution];
//        [P623 solution];
//        [P629 solution];
//        [P637 solution];
//        [P647 solution];
//        [P653 solution];
//        [P654 solution];
//        [P657 solution];
//        [P662 solution];
//        [P663 solution];
//        [P655 solution];
//        [P665 solution];
//        [P669 solution];
//        [P671 solution];
//        [P678 solution];
//        [P680 solution];
//        [P684 solution];
//        [P686 solution];
//        [P687 solution];
//        [P696 solution];
//        [P697 solution];
//        [P700 solution];
//        [P701 solution];
//        [P709 solution];
//        [P722 solution];
//        [P767 solution];
//        [P783 solution];
//        [P788 solution];
//        [P791 solution];
//        [P804 solution];
//        [P805 solution];
//        [P809 solution];
//        [P814 solution];
//        [P816 solution];
//        [P819 solution];
//        [P824 solution];
//        [P831 solution];
//        [P842 solution];
//        [P848 solution];
//        [P852 solution];
//        [P856 solution];
//        [P859 solution];
//        [P865 solution];
//        [P869 solution];
//        [P872 solution];
//        [P889 solution];
//        [P890 solution];
//        [P893 solution];
//        [P894 solution];
//        [P896 solution];
//        [P897 solution];
//        [P905 solution];
//        [P912 solution];
//        [P915 solution];
//        [P916 solution];
//        [P917 solution];
//        [P919 solution];
//        [P925 solution];
//        [P929 solution];
//        [P932 solution];
//        [P937 solution];
//        [P938 solution];
//        [P941 solution];
//        [P942 solution];
//        [P951 solution];
//        [P958 solution];
//        [P961 solution];
//        [P965 solution];
//        [P966 solution];
//        [P968 solution];
//        [P977 solution];
//        [P979 solution];
//        [P984 solution];
//        [P987 solution];
//        [P989 solution];
//        [P993 solution];
//        [P996 solution];
//        [P998 solution];
//        [P1003 solution];
//        [P1008 solution];
//        [P1016 solution];
//        [P1021 solution];
//        [P1022 solution];
//        [P1023 solution];
//        [P1026 solution];
//        [P1028 solution];
//        [P1047 solution];
//        [P1048 solution];
//        [P1071 solution];
//        [P1081 solution];
//        [P1095 solution];
//        [P1104 solution];
//        [P1108 solution];
//        [P1110 solution];
//        [P1119 solution];
//        [P1122 solution];
//        [P1123 solution];
//        [P1130 solution];
//        [P1138 solution];
//        [P1146 solution];
//        [P1156 solution];
//        [P1169 solution];
//        [P1170 solution];
//        [P1177 solution];
//        [P1189 solution];
//        [P1209 solution];
//        [P1213 solution];
//        [P1221 solution];
//        [P1233 solution];
//        [P1234 solution];
//        [P1243 solution];
//        [P1245 solution];
//        [P1247 solution];
//        [P1249 solution];
//        [P1250 solution];
//        [P1261 solution];
//        [P1268 solution];
//        [P1295 solution];
//        [P1297 solution];
//        [P1302 solution];
//        [P1305 solution];
//        [P1309 solution];
//        [P1311 solution];
//        [P1312 solution];
//        [P1315 solution];
//        [P1324 solution];
//        [P1325 solution];
//        [P1328 solution];
//        [P1332 solution];
//        [P1339 solution];
//        [P1347 solution];
//        [P1358 solution];
//        [P1370 solution];
//        [P1371 solution];
//        [P1374 solution];
//        [P1379 solution];
    }
    return 0;
}

//
//  main.m
//  ArraySorting
//
//  Created by JIAN WANG on 5/12/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *array = @[
                           @"eeeeeAAbfdf",
                           @"Everything",
                           @"news to me",
                           @"timepiece",
                           @"egg",
                           @"eggs",
                           @"paper",
                           @"e",
                           @"facebook",
                           @"painting",
                           @"231 thurlow st",
                           @"99 bottles"
                           ];
        
        ;
        
        NSComparisonResult (^alpha)(NSString *, NSString *) = ^(id obj1, id obj2) {
            
            return [obj1 caseInsensitiveCompare:obj2];
            
        };
        
        NSComparisonResult (^length)(NSString *, NSString *) = ^(id obj1, id obj2) {
            if ([obj1 length] > [obj2 length]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            
            if ([obj1 length] < [obj2 length]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            return (NSComparisonResult)NSOrderedSame;
        };
        
        NSComparisonResult (^lastCharacter)(NSString *, NSString *) = ^(id obj1, id obj2) {
            
            return [[obj1 substringFromIndex:[obj1 length]-1] caseInsensitiveCompare:[obj2 substringFromIndex:[obj2 length]-1]];
            
        };
        
        int (^countOfe)(NSString *) = ^(id obj){
            int total = 0;
            
            for (int i = 0; i < [obj length]; i++) {
                NSRange range;
                range.location = i;
                range.length = 1;
                
                if ([[[obj substringWithRange:range] lowercaseString] isEqualTo:@"e"]) {
                    total += 1;
                }
            }
            
            return total;
        };
        
        NSLog(@"%d", countOfe(@"eeeee"));
        
        NSComparisonResult (^countOfCharacterE)(NSString *, NSString *) = ^(id obj1, id obj2) {
            if (countOfe(obj1) > countOfe(obj2)) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            
            if (countOfe(obj1) < countOfe(obj2)) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            return (NSComparisonResult)NSOrderedSame;
        };
        
        NSArray *alphaArray = [array sortedArrayUsingComparator:alpha];
        NSArray *lengthArray = [array sortedArrayUsingComparator:length];
        NSArray *lastCharaterArray = [array sortedArrayUsingComparator:lastCharacter];
        NSArray *countCharacterArray = [array sortedArrayUsingComparator:countOfCharacterE];
        
        NSLog(@"%@", alphaArray);
        NSLog(@"%@", lengthArray);
        NSLog(@"%@", lastCharaterArray);
        NSLog(@"%@", countCharacterArray);

    }
    return 0;
}

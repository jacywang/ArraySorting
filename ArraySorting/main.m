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
        
        NSArray *alphaArray = [array sortedArrayUsingComparator:alpha];
        NSArray *lengthArray = [array sortedArrayUsingComparator:length];
        
        NSLog(@"%@", alphaArray);
        NSLog(@"%@", lengthArray);

        
        /*
         if ([obj1 lowercaseString] > [obj2 lowercaseString]) {
         return (NSComparisonResult)NSOrderedDescending;
         }
         
         if ([obj1 lowercaseString] < [obj2 lowercaseString]) {
         return (NSComparisonResult)NSOrderedAscending;
         }
         
         return (NSComparisonResult)NSOrderedSame;
         */
    }
    return 0;
}

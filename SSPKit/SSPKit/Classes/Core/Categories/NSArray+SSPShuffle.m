//
//  NSArray+SSPShuffle.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 19/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "NSArray+SSPShuffle.h"
#import "NSMutableArray+SSPShuffle.h"

@implementation NSArray (SSPShuffle)

- (NSArray *)ssp_shuffledArray {
    NSMutableArray *tmp = [self mutableCopy];
    [tmp ssp_shuffle];
    return [tmp copy];
}

- (id)ssp_randomObject {
    NSUInteger count = [self count];
    if (count > 0) {
        return [self objectAtIndex:arc4random() % count];
    }
    return nil;
}

@end

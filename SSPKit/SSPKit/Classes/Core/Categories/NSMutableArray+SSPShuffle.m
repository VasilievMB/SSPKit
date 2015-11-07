//
//  NSMutableArray+SSPShuffle.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 19/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "NSMutableArray+SSPShuffle.h"

@implementation NSMutableArray (SSPShuffle)

- (void)ssp_shuffle {
    for (NSInteger i = [self count] - 1; i > 0; i--) {
        [self exchangeObjectAtIndex:arc4random_uniform((u_int32_t)i + 1) withObjectAtIndex:i];
    }
}

@end

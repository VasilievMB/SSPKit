//
//  NSString+SSPHash.m
//  CarelessDrawing
//
//  Created by Vasilyev M.B. on 12/02/14.
//  Copyright (c) 2014 SSP. All rights reserved.
//

#import "NSString+SSPHash.h"

@implementation NSString (SSPHash)

// http://www.cse.yorku.ca/~oz/hash.html
static UInt32 SSPNSStringCustomHash(const char *str) {
    UInt32 hash = 5381;
    int c;
    
    while ((c = *str++)) {
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
    }
    
    return hash;
}

- (UInt32)ssp_hash {
    return SSPNSStringCustomHash([self UTF8String]);
}

@end

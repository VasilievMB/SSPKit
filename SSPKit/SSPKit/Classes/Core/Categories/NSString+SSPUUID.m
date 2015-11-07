//
//  NSString+SSPUUID.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 28/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "NSString+SSPUUID.h"

@implementation NSString (SSPUUID)

+ (NSString *)ssp_UUID {
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *newUUID = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return newUUID;
}

@end

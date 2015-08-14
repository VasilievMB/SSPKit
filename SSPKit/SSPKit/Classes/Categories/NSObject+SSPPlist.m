//
//  NSObject+SSPPlist.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "NSObject+SSPPlist.h"
#import "NSObject+SSPDictionary.h"

@implementation NSObject (SSPPlist)

+ (NSArray *)ssp_objectsWithContentsOfFile:(NSString *)path {
    NSArray *plist = [NSArray arrayWithContentsOfFile:path];
    return [self ssp_objectsWithDictionaries:plist];
}

+ (NSArray *)ssp_objectsWithPlistNamed:(NSString *)fileName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    return [self ssp_objectsWithContentsOfFile:filePath];
}

@end

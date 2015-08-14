//
//  NSObject+SSPDictionary.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "NSObject+SSPDictionary.h"

@implementation NSObject (SSPDictionary)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self) {
        [self ssp_populateFromDictionary:dictionary];
    }
    return self;
}

- (void)ssp_populateFromDictionary:(NSDictionary *)dictionary {
    [self setValuesForKeysWithDictionary:dictionary];
}

+ (NSArray *)ssp_objectsWithDictionaries:(NSArray *)dictionaries {
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[dictionaries count]];
    for (NSDictionary *dict in dictionaries) {
        NSObject *object = [[self alloc] initWithDictionary:dict];
        [objects addObject:object];
    }
    return [objects copy];
}

@end

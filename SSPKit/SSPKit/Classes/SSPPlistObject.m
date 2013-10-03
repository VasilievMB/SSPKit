//
//  PlistObject.m
//  SSPKit
//
//  Created by Vasiljev M.B. on 4/12/13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import "SSPPlistObject.h"

@implementation NSObject (PlistObject)

+ (NSArray *)loadFromPlistNamed:(NSString *)plistName {
    NSArray *dicts = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistName
                                                                                      ofType:@"plist"]];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:[dicts count]];
    for (NSDictionary *dict in dicts) {
        id object = [[[self class] alloc] init];
        [object setValuesForKeysWithDictionary:dict];
        [array addObject:object];
    }
    
    return [array copy];
}

@end


@implementation SSPPlistObject

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self) {
        NSArray *fields = [[self class] fields];
        if (fields != nil) {
            dictionary = [dictionary dictionaryWithValuesForKeys:fields];
        }
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

+ (NSArray *)fields {
    return nil;
}

+ (NSString *)key {
    return [self plistName];
}

- (id)key {
    return @(self.ID);
}

+ (NSMutableDictionary *)arrays {
    static NSMutableDictionary *arrays;
    if (arrays == nil) {
        arrays = [NSMutableDictionary dictionary];
    }
    return arrays;
}

+ (NSMutableDictionary *)dictionaries {
    static NSMutableDictionary *dictionaries;
    if (dictionaries == nil) {
        dictionaries = [NSMutableDictionary dictionary];
    }
    return dictionaries;
}

+ (NSArray *)array {
    NSString *key = [self key];
    NSArray *array = [[self arrays] objectForKey:key];
    if (array == nil) {
        array = [self loadFromPlist];
        [[self arrays] setObject:array forKey:key];
    }
    return array;
}

+ (NSDictionary *)dictionary {
    NSString *key = [self key];
    NSDictionary *dictionary = [[self dictionaries] objectForKey:key];
    if (dictionary == nil) {
        NSArray *array = [self array];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
        for (SSPPlistObject *object in array) {
            [dict setObject:object forKey:[object key]];
        }
        dictionary = [dict copy];
    }
    return dictionary;
}

+ (NSString *)plistName {
    return NSStringFromClass(self);
}

+ (NSArray *)loadFromPlist {
    return [self loadFromPlistNamed:[self plistName]];
}

+ (NSArray *)loadFromPlistNamed:(NSString *)plistName {
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName
                                                     ofType:@"plist"];
    NSAssert1(path != nil, @"Plist %@ not found", plistName);
    
    NSArray *dicts = [NSArray arrayWithContentsOfFile:path];
    
    NSUInteger count = [dicts count];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:count];
    for (NSUInteger i = 0; i < count; ++i) {
        SSPPlistObject *object = [[[self class] alloc] initWithDictionary:[dicts objectAtIndex:i]];
        [array addObject:object];
    }
    return [array copy];
}

+ (id)selectWithID:(NSUInteger)ID {
    return [[self dictionary] objectForKey:@(ID)];
}

+ (id)selectWithIDs:(NSArray *)IDs{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[IDs count]];
    for (NSNumber *ID in IDs ) {
        [result addObject:[self selectWithID:[ID integerValue]]];
    }
    return [result copy];
}

@end

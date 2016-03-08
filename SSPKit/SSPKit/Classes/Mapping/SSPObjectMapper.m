//
//  SSPObjectMapper.m
//  SSPKit
//
//  Created by Mikhail on 06/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import "SSPObjectMapper.h"

@implementation SSPObjectMapper {
    NSMutableDictionary *_mappings;
}

- (instancetype)initWithClass:(Class)objectClass {
    self = [super init];
    if (self) {
        _objectClass = objectClass;
        _mappings = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSArray *)mappings {
    return [_mappings allValues];
}

- (void)addMapping:(SSPPropertyMapping *)mapping {
    NSParameterAssert(mapping != nil);
    _mappings[mapping.propertyName] = mapping;
}

- (void)removeMapping:(SSPPropertyMapping *)mapping {
    [_mappings removeObjectForKey:mapping.propertyName];
}

- (nullable SSPPropertyMapping *)mapProperty:(nonnull SEL)selector toKeyPath:(nonnull NSString *)keyPath {
    return [self mapProperty:selector toKeyPath:keyPath withValueTransformer:nil];
}

- (nullable SSPPropertyMapping *)mapProperty:(nonnull SEL)selector toKeyPath:(nonnull NSString *)keyPath withValueTransformer:(nullable NSValueTransformer *)valueTransformer {
    SSPPropertyMapping *mapping = [[SSPPropertyMapping alloc] initWithPropertyName:NSStringFromSelector(selector)
                                                                           keyPath:keyPath
                                                                  valueTransformer:valueTransformer];
    NSAssert(mapping != nil, @"Could not create mapping");
    [self addMapping:mapping];
    return mapping;
}


- (nullable id)objectFromDictionary:(nonnull NSDictionary *)dictionary {
    id object = [[self.objectClass alloc] init];
    
    NSArray *mappings = self.mappings;
    for (SSPPropertyMapping *mapping in mappings) {
        id value = [dictionary valueForKeyPath:mapping.keyPath];
        if (value == [NSNull null]) {
            value = nil;
        }
        if (mapping.valueTransformer != nil) {
            value = [mapping.valueTransformer transformedValue:value];
        }
        [object setValue:value forKey:mapping.propertyName];
    }
    
    return object;
}

- (nonnull NSArray *)objectsFromArray:(nonnull NSArray *)array {
    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:array.count];
    
    for (NSDictionary *dict in array) {
        id object = [self objectFromDictionary:dict];
        [objects addObject:object];
    }
    
    return [objects copy];
}

- (nonnull NSDictionary *)dictionaryFromObject:(nonnull id)object {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:self.mappings.count];
    
    NSArray *mappings = self.mappings;
    for (SSPPropertyMapping *mapping in mappings) {
        id value = [object valueForKey:mapping.propertyName];
        if (mapping.valueTransformer != nil) {
            value = [mapping.valueTransformer reverseTransformedValue:value];
        }
        if (value == nil) {
            value = [NSNull null];
        }
        [dictionary setValue:value forKeyPath:mapping.keyPath];
    }

    
    return [dictionary copy];
}

- (nonnull NSDictionary *)arrayFromObjects:(nonnull NSArray *)objects {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:objects.count];
    
    for (id object in objects) {
        NSDictionary *dictionary = [self dictionaryFromObject:object];
        [array addObject:dictionary];
    }
    
    return [array copy];
}


@end

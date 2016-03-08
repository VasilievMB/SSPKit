//
//  SSPObjectMapperValueTransformer.m
//  SSPKit
//
//  Created by Mikhail on 08/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import "SSPObjectMapperValueTransformer.h"

@implementation SSPObjectMapperValueTransformer

- (instancetype)initWithObjectMapper:(nonnull SSPObjectMapper *)objectMapper {
    self = [super init];
    if (self) {
        _objectMapper = objectMapper;
    }
    return self;
}

+ (nullable instancetype)transformerWithObjectMapper:(nonnull SSPObjectMapper *)objectMapper {
    return [[self alloc] initWithObjectMapper:objectMapper];
}

+ (Class)transformedValueClass {
    return [NSObject class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (nullable id)transformedValue:(nullable id)value {
    return [self.objectMapper objectFromDictionary:value];
}

- (nullable id)reverseTransformedValue:(nullable id)value {
    return [self.objectMapper dictionaryFromObject:value];
}


@end

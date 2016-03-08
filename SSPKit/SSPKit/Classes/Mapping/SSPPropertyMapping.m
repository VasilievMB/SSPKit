//
//  SSPPropertyMapping.m
//  SSPKit
//
//  Created by Mikhail on 06/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import "SSPPropertyMapping.h"

@implementation SSPPropertyMapping

- (nullable instancetype)initWithPropertyName:(nonnull NSString *)propertyName
                                      keyPath:(nonnull NSString *)keyPath
                             valueTransformer:(nullable NSValueTransformer *)valueTransformer {
    self = [super init];
    if (self) {
        _propertyName = propertyName;
        _keyPath = keyPath;
        _valueTransformer = valueTransformer;
    }
    return self;
}

@end

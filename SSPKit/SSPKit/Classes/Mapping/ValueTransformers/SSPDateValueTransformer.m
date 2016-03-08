//
//  SSPDateValueTransformer.m
//  SSPKit
//
//  Created by Mikhail on 07/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import "SSPDateValueTransformer.h"

NSString * const SSPDateValueTransformerName = @"SSPDateValueTransformerName";

@implementation SSPDateValueTransformer

+ (void)load {
    @autoreleasepool {
        SSPDateValueTransformer *transformer = [[self alloc] init];
        [self setValueTransformer:transformer forName:SSPDateValueTransformerName];
    }
}

+ (Class)transformedValueClass {
    return [NSDate class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    }
    return self;
}

- (nullable id)transformedValue:(nullable id)value {
    return [self.dateFormatter dateFromString:value];
}

- (nullable id)reverseTransformedValue:(nullable id)value {
    return [self.dateFormatter stringFromDate:value];
}

@end

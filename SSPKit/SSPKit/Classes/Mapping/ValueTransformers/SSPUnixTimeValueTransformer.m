//
//  SSPUnixTimeValueTransformer.m
//  SSPKit
//
//  Created by Mikhail on 08/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import "SSPUnixTimeValueTransformer.h"

NSString * const SSPUnixTimeValueTransformerName = @"SSPUnixTimeValueTransformerName";

@implementation SSPUnixTimeValueTransformer

+ (void)load {
    @autoreleasepool {
        SSPUnixTimeValueTransformer *transformer = [[self alloc] init];
        [self setValueTransformer:transformer forName:SSPUnixTimeValueTransformerName];
    }
}

+ (Class)transformedValueClass {
    return [NSDate class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (nullable id)transformedValue:(nullable id)value {
    return [NSDate dateWithTimeIntervalSince1970:[value doubleValue]];
}

- (nullable id)reverseTransformedValue:(nullable id)value {
    return @([value timeIntervalSince1970]);
}

@end

//
//  SSPURLValueTransformer.m
//  SSPKit
//
//  Created by Mikhail on 07/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import "SSPURLValueTransformer.h"

NSString * const SSPURLValueTransformerName = @"SSPURLValueTransformerName";

@implementation SSPURLValueTransformer

+ (void)load {
    @autoreleasepool {
        SSPURLValueTransformer *transformer = [[self alloc] init];
        [self setValueTransformer:transformer forName:SSPURLValueTransformerName];
    }
}

+ (Class)transformedValueClass {
    return [NSURL class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (nullable id)transformedValue:(nullable id)value {
    return [NSURL URLWithString:value];
}

- (nullable id)reverseTransformedValue:(nullable id)value {
    return [value absoluteString];
}

@end

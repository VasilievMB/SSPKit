//
//  SSPValueTransformer.m
//  SSPKit
//
//  Created by Mikhail on 07/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import "SSPValueTransformer.h"

@implementation SSPValueTransformer

+ (nullable instancetype)transformerWithForwardBlock:(nonnull SSPValueTransformerBlock)forwardBlock
                                        reverseBlock:(nullable SSPValueTransformerBlock)reverseBlock {
    SSPValueTransformer *transformer = [[self alloc] init];
    transformer.forwardBlock = forwardBlock;
    transformer.reverseBlock = reverseBlock;
    return transformer;
}

+ (nullable instancetype)transformerWithForwardBlock:(nonnull SSPValueTransformerBlock)forwardBlock {
    return [self transformerWithForwardBlock:forwardBlock reverseBlock:nil];
}

+ (Class)transformedValueClass {
    return [NSObject class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (nullable id)transformedValue:(nullable id)value {
    return self.forwardBlock(value);
}

- (nullable id)reverseTransformedValue:(nullable id)value {
    if (self.reverseBlock == nil) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"No block for reverse transform"
                                     userInfo:nil];
    } else {
        return self.reverseBlock(value);
    }
}

@end

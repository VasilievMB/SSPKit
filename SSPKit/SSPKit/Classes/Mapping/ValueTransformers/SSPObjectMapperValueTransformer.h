//
//  SSPObjectMapperValueTransformer.h
//  SSPKit
//
//  Created by Mikhail on 08/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSPObjectMapper.h"

@interface SSPObjectMapperValueTransformer : NSValueTransformer

@property (strong, nonatomic, readonly, nonnull) SSPObjectMapper *objectMapper;

- (nullable instancetype)initWithObjectMapper:(nonnull SSPObjectMapper *)objectMapper;

+ (nullable instancetype)transformerWithObjectMapper:(nonnull SSPObjectMapper *)objectMapper;

@end

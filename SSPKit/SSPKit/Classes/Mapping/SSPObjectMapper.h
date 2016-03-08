//
//  SSPObjectMapper.h
//  SSPKit
//
//  Created by Mikhail on 06/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSPPropertyMapping.h"

@interface SSPObjectMapper : NSObject

@property (nonatomic, readonly, nonnull) Class objectClass;
@property (strong, nonatomic, readonly, nonnull) NSArray *mappings;

- (nullable instancetype)initWithClass:(nonnull Class)objectClass;

- (void)addMapping:(nonnull SSPPropertyMapping *)mapping;
- (void)removeMapping:(nonnull SSPPropertyMapping *)mapping;

- (nullable SSPPropertyMapping *)mapProperty:(nonnull SEL)selector toKeyPath:(nonnull NSString *)keyPath;
- (nullable SSPPropertyMapping *)mapProperty:(nonnull SEL)selector toKeyPath:(nonnull NSString *)keyPath withValueTransformer:(nullable NSValueTransformer *)valueTransformer;

- (nullable id)objectFromDictionary:(nonnull NSDictionary *)dictionary;
- (nonnull NSArray *)objectsFromArray:(nonnull NSArray *)array;

- (nonnull NSDictionary *)dictionaryFromObject:(nonnull id)object;
- (nonnull NSDictionary *)arrayFromObjects:(nonnull NSArray *)objects;

@end

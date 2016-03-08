//
//  SSPPropertyMapping.h
//  SSPKit
//
//  Created by Mikhail on 06/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSPPropertyMapping : NSObject

@property (copy, nonatomic, readonly, nonnull) NSString *propertyName;
@property (copy, nonatomic, readonly, nonnull) NSString *keyPath;
@property (strong, nonatomic, readonly, nullable) NSValueTransformer *valueTransformer;

- (nullable instancetype)initWithPropertyName:(nonnull NSString *)propertyName
                                      keyPath:(nonnull NSString *)keyPath
                             valueTransformer:(nullable NSValueTransformer *)valueTransformer;

@end

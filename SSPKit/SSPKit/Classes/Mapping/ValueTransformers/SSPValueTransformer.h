//
//  SSPValueTransformer.h
//  SSPKit
//
//  Created by Mikhail on 07/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id _Nullable (^SSPValueTransformerBlock)(id _Nullable value);

@interface SSPValueTransformer : NSValueTransformer

@property (copy, nonatomic, nonnull) SSPValueTransformerBlock forwardBlock;
@property (copy, nonatomic, nonnull) SSPValueTransformerBlock reverseBlock;

+ (nullable instancetype)transformerWithForwardBlock:(nonnull SSPValueTransformerBlock)forwardBlock
                                        reverseBlock:(nullable SSPValueTransformerBlock)reverseBlock;
+ (nullable instancetype)transformerWithForwardBlock:(nonnull SSPValueTransformerBlock)forwardBlock;


@end

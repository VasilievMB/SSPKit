//
//  SSPDateValueTransformer.h
//  SSPKit
//
//  Created by Mikhail on 07/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const SSPDateValueTransformerName;

@interface SSPDateValueTransformer : NSValueTransformer

@property (strong, nonatomic, readonly, nonnull) NSDateFormatter *dateFormatter;

@end

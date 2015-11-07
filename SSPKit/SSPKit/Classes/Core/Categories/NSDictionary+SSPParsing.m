//
//  NSDictionary+SSPParsing.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "NSDictionary+SSPParsing.h"


@implementation NSDateFormatter (SSPParsing)

static NSString * _ssp_defaultParstingDateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZZ";

+ (NSString *)ssp_defaultParstingDateFormat {
    return _ssp_defaultParstingDateFormat;
}

+ (void)ssp_setDefaultParstingDateFormat:(NSString *)format {
    _ssp_defaultParstingDateFormat = format;
}

@end


@implementation NSDictionary (SSPParsing)

- (id)ssp_objectEscapingNullForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return obj;
}

- (id)ssp_objectOfClass:(Class)cls forKey:(id)key {
    id obj = [self objectForKey:key];
    if ([obj isKindOfClass:cls]) {
        return obj;
    } else {
        NSAssert1(false, @"Incorrect class for object for key %@", key);
    }
    return nil;
}

- (NSString *)ssp_stringForKey:(id)key {
    return [self ssp_objectOfClass:[NSString class] forKey:key];
}

- (NSArray *)ssp_arrayForKey:(id)key {
    return [self ssp_objectOfClass:[NSArray class] forKey:key];
}

- (NSNumber *)ssp_numberForKey:(id)key {
    return [self ssp_objectOfClass:[NSNumber class] forKey:key];
}

- (NSDictionary *)ssp_dictionaryForKey:(id)key {
    return [self ssp_objectOfClass:[NSDictionary class] forKey:key];
}

- (NSDate *)ssp_dateWithUnixTimestampForKey:(id)key {
    id obj = [self ssp_objectEscapingNullForKey:key];
    if (obj != nil) {
        return [NSDate dateWithTimeIntervalSince1970:[obj doubleValue]];
    } else {
        return nil;
    }
}

- (NSDate *)ssp_dateForKey:(id)key withFormat:(NSString *)format {
    NSString *timestamp = [self ssp_objectEscapingNullForKey:key];
    if (timestamp) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat = format;
        return [df dateFromString:timestamp];
    }
    return nil;
}

- (NSDate *)ssp_dateForKey:(id)key {
    return [self ssp_dateForKey:key
                     withFormat:[NSDateFormatter ssp_defaultParstingDateFormat]];
}

@end

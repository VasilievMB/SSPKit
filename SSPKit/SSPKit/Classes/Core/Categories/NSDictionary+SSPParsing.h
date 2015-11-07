//
//  NSDictionary+SSPParsing.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter(SSPParsing)

+ (NSString *)ssp_defaultParstingDateFormat;
+ (void)ssp_setDefaultParstingDateFormat:(NSString *)format;

@end

@interface NSDictionary (SSPParsing)

- (id)ssp_objectEscapingNullForKey:(id)aKey;
- (id)ssp_objectOfClass:(Class)cls forKey:(id)key;

- (NSString *)ssp_stringForKey:(id)key;
- (NSArray *)ssp_arrayForKey:(id)key;
- (NSNumber *)ssp_numberForKey:(id)key;
- (NSDictionary *)ssp_dictionaryForKey:(id)key;

- (NSDate *)ssp_dateWithUnixTimestampForKey:(id)key;
- (NSDate *)ssp_dateForKey:(id)key withFormat:(NSString *)format;
- (NSDate *)ssp_dateForKey:(id)key;

@end

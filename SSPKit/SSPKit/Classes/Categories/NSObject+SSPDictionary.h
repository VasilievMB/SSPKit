//
//  NSObject+SSPDictionary.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SSPDictionary)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)ssp_populateFromDictionary:(NSDictionary *)dictionary;
+ (NSArray *)ssp_objectsWithDictionaries:(NSArray *)dictionaries;

@end

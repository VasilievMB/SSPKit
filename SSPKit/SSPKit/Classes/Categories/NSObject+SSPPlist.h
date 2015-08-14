//
//  NSObject+SSPPlist.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SSPPlist)

+ (NSArray *)ssp_objectsWithContentsOfFile:(NSString *)path;
+ (NSArray *)ssp_objectsWithPlistNamed:(NSString *)fileName;

@end

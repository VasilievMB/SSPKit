//
//  PlistObject.h
//  LoveDrawingAnimals
//
//  Created by Vasiljev M.B. on 4/12/13.
//
//

//#import "DBObject.h"
#import <Foundation/Foundation.h>

@interface NSObject (PlistObject)

+ (NSArray *)loadFromPlistNamed:(NSString *)plistName;

@end


@interface SSPPlistObject : NSObject

@property (nonatomic) NSUInteger ID;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (id)selectWithID:(NSUInteger)ID;

+ (NSArray *)fields;
+ (NSString *)key;

- (id)key;

+ (NSMutableDictionary *)arrays;
+ (NSMutableDictionary *)dictionaries;
+ (NSArray *)array;
+ (NSDictionary *)dictionary;
+ (NSString *)plistName;
+ (NSArray *)loadFromPlist;
+ (NSArray *)loadFromPlistNamed:(NSString *)plistName;

@end

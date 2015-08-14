//
//  SSPParsingTest.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSDictionary+SSPParsing.h"

@interface SSPParsingTest : XCTestCase

@property (strong, nonatomic) NSDictionary *dictionary;

@end

@implementation SSPParsingTest

- (void)setUp {
    [super setUp];
    self.dictionary = @{
                        @"null" : [NSNull null],
                        @"string" : @"string",
                        @"number" : @1,
                        @"timestamp" : @0,
                        @"date" : @"2015-08-14T14:55:30",
                        @"date_def" : @"2015-08-14T14:55:30+0600"
                        };
}

- (void)tearDown {
    [super tearDown];
}

- (void)testParsing {
    XCTAssertNil([self.dictionary ssp_objectEscapingNullForKey:@"null"]);
    XCTAssertNotNil([self.dictionary ssp_objectEscapingNullForKey:@"string"]);
    
    XCTAssertThrows([self.dictionary ssp_numberForKey:@"string"]);
    XCTAssertNoThrow([self.dictionary ssp_stringForKey:@"string"]);

    XCTAssertEqual([self.dictionary ssp_numberForKey:@"number"], @1);
    
    XCTAssertEqual([self.dictionary ssp_dateWithUnixTimestampForKey:@"timestamp"],
                   [NSDate dateWithTimeIntervalSince1970:0.0]);
    XCTAssertNotNil([self.dictionary ssp_dateForKey:@"date" withFormat:@"yyyy-MM-dd'T'HH:mm:ss"]);
    XCTAssertNotNil([self.dictionary ssp_dateForKey:@"date_def"]);
}

@end

//
//  SSPMappingTest.m
//  SSPKit
//
//  Created by Mikhail on 07/03/16.
//  Copyright © 2016 Softinform. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SSPObjectMapper.h"
#import "SSPDateValueTransformer.h"
#import "SSPUnixTimeValueTransformer.h"
#import "SSPURLValueTransformer.h"
#import "SSPObjectMapperValueTransformer.h"

@interface SSPMappingTestSubModel : NSObject

@property (copy, nonatomic) NSString *text;

@end

@implementation SSPMappingTestSubModel

@end


@interface SSPMappingTestModel : NSObject

@property (copy, nonatomic) NSNumber *number;
@property (copy, nonatomic) NSString *text;
@property (copy, nonatomic) NSString *subtext;
@property (copy, nonatomic) NSDate *date;
@property (copy, nonatomic) NSDate *timestamp;
@property (copy, nonatomic) NSURL *URL;
@property (strong, nonatomic) SSPMappingTestSubModel *submodel;

@end

@implementation SSPMappingTestModel

@end


@interface SSPMappingTest : XCTestCase

@end

@implementation SSPMappingTest

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMapping {
    NSDictionary *JSONDict = @{
                               @"num" : @1,
                               @"text" : @"Some text",
                               @"sub" : @{
                                       @"text" : @"Some sub text"
                                       },
                               @"date" : @"2016-03-03T12:02:50+0000",
                               @"timestamp" : @1457006570,
                               @"url" : @"https://github.com/VasilievMB/SSPKit",
                               @"submodel" : @{
                                       @"text" : @"Submodel text"
                                       }
                               };
    
    SSPObjectMapper *mapper = [[SSPObjectMapper alloc] initWithClass:[SSPMappingTestModel class]];
    
    [mapper mapProperty:@selector(number) toKeyPath:@"num"];
    [mapper mapProperty:@selector(text) toKeyPath:@"text"];
    [mapper mapProperty:@selector(subtext) toKeyPath:@"sub.text"];
    [mapper mapProperty:@selector(date) toKeyPath:@"date" withValueTransformer:[NSValueTransformer valueTransformerForName:SSPDateValueTransformerName]];
    [mapper mapProperty:@selector(timestamp) toKeyPath:@"timestamp" withValueTransformer:[NSValueTransformer valueTransformerForName:SSPUnixTimeValueTransformerName]];
    [mapper mapProperty:@selector(URL) toKeyPath:@"url" withValueTransformer:[NSValueTransformer valueTransformerForName:SSPURLValueTransformerName]];
    SSPObjectMapper *subMapper = [[SSPObjectMapper alloc] initWithClass:[SSPMappingTestSubModel class]];
    [subMapper mapProperty:@selector(text) toKeyPath:@"text"];
    [mapper mapProperty:@selector(submodel) toKeyPath:@"submodel" withValueTransformer:[SSPObjectMapperValueTransformer transformerWithObjectMapper:subMapper]];
    
    SSPMappingTestModel *model = [mapper objectFromDictionary:JSONDict];
    
    XCTAssertNotNil(model);
    XCTAssertEqualObjects(model.number, @1);
    XCTAssertEqualObjects(model.text, @"Some text");
    XCTAssertEqualObjects(model.subtext, @"Some sub text");
    XCTAssertNotNil(model.date);
    XCTAssertEqualObjects(model.date, model.timestamp);
    XCTAssertEqualObjects(model.URL.absoluteString, @"https://github.com/VasilievMB/SSPKit");
    XCTAssertNotNil(model.submodel);
    XCTAssertEqualObjects(model.submodel.text, @"Submodel text");
}

@end

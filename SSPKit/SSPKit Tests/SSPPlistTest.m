//
//  SSPPlistTest.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSObject+SSPPlist.h"


@interface TestObject : NSObject

@property (nonatomic) NSInteger number;
@property (copy, nonatomic) NSString *text;

@end

@implementation TestObject

@end


@interface SSPPlistTest : XCTestCase

@end

@implementation SSPPlistTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestObjects" ofType:@"plist"];
    XCTAssertNotNil(path);
    
    NSArray *objects = [TestObject ssp_objectsWithContentsOfFile:path];
    XCTAssertEqual([objects count], 2);
    
    TestObject *obj0 = objects[0];
    TestObject *obj1 = objects[1];
    
    XCTAssertEqual(obj0.number, 0);
    XCTAssertEqual(obj1.number, 1);
    
    XCTAssert([obj0.text isEqualToString:@"text0"]);
    XCTAssert([obj1.text isEqualToString:@"text1"]);
}

@end

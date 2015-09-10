//
//  UIColor+SSPHex.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    UInt8 red;
    UInt8 green;
    UInt8 blue;
    UInt8 alpha;
} SSPRGBAColor;

@interface UIColor (SSPHex)

+ (instancetype)ssp_colorWithHex:(UInt32)hex;
+ (instancetype)ssp_colorWithHexString:(NSString *)hexString;
+ (instancetype)ssp_colorWith8BitRed:(UInt8)red green:(UInt8)green blue:(UInt8)blue alpha:(UInt8)alpha;

- (SSPRGBAColor)ssp_SSPRGBAColor;
- (UInt32)ssp_RGBA;
- (NSString *)ssp_hexString;

@end

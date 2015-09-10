//
//  UIColor+SSPHex.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "UIColor+SSPHex.h"

@implementation UIColor (SSPHex)

+ (instancetype)ssp_colorWithHexString:(NSString *)hexString {
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    UInt32 hex;
    if ([scanner scanHexInt:&hex]) {
        return [self ssp_colorWithHex:hex];
    } else {
        return nil;
    }
}

+ (instancetype)ssp_colorWithHex:(UInt32)hex {
    SSPRGBAColor *c = (SSPRGBAColor *)&hex;
    return [self ssp_colorWith8BitRed:c->red
                                green:c->green
                                 blue:c->blue
                                alpha:c->alpha];
}

+ (instancetype)ssp_colorWith8BitRed:(UInt8)red green:(UInt8)green blue:(UInt8)blue alpha:(UInt8)alpha {
    return [self colorWithRed:(CGFloat)red / UINT8_MAX
                        green:(CGFloat)green / UINT8_MAX
                         blue:(CGFloat)blue / UINT8_MAX
                        alpha:(CGFloat)alpha / UINT8_MAX];
}

- (SSPRGBAColor)ssp_SSPRGBAColor {
    SSPRGBAColor c;
    if (self == [UIColor whiteColor]) {
        c = (SSPRGBAColor){UINT8_MAX, UINT8_MAX, UINT8_MAX, UINT8_MAX};
        
    } else {
        CGFloat red, blue, green, alpha;
        [self getRed:&red green:&green blue:&blue alpha:&alpha];
        c.red   = red   / UINT8_MAX;
        c.green = green / UINT8_MAX;
        c.blue  = blue  / UINT8_MAX;
        c.alpha = alpha / UINT8_MAX;
    }
    return c;
}

- (UInt32)ssp_RGBA {
    SSPRGBAColor c = [self ssp_SSPRGBAColor];
    UInt32 *hex = (UInt32 *)&c;
    return *hex;
}

- (NSString *)ssp_hexString {
    SSPRGBAColor c = [self ssp_SSPRGBAColor];
    return [NSString stringWithFormat:@"%02x%02x%02x%02x", c.red, c.green, c.blue, c.alpha];
}

@end

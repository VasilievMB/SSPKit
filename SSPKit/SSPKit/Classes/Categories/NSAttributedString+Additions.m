//
//  NSAttributedString+Additions.m
//  SSPKit
//
//  Created by Turov Y.V. on 01.08.13.
//  Copyright (c) 2013 SoftInform. All rights reserved.
//

#import "NSAttributedString+Additions.h"

#import <CoreText/CoreText.h>

@implementation NSAttributedString (Additions)

- (NSAttributedString *)stringByAppendingDisclosureString:(NSAttributedString *)string constrainedToSize:(CGSize)size appended:(BOOL *)appended {
    if (string == nil) {
        if (appended) {
            *appended = NO;
        }
        return self;
    }
    
    NSRange fullRange = {0, self.length};
    NSRange fitRange;
    [self sizeConstrainedToSize:size fitRange:&fitRange];
    
    if (NSEqualRanges(fullRange, fitRange)) {
        if (appended) {
            *appended = NO;
        }
        return self;
    }
    
    NSMutableAttributedString *fullDisclosureString = [[NSMutableAttributedString alloc] initWithString:@"… "
                                                                                             attributes:[self attributesAtIndex:0 effectiveRange:nil]];
    [fullDisclosureString appendAttributedString:string];
    
    CGSize maxSize = CGSizeMake(size.width, MAXFLOAT);
    NSMutableAttributedString *substring = [[self attributedSubstringFromRange:fitRange] mutableCopy];
    NSMutableAttributedString *stringWithAppendedString = nil;
    
    for (NSUInteger i = [substring length] - 1; i > 0; --i) {
        [substring deleteCharactersInRange:NSMakeRange(i, 1)];
        
        stringWithAppendedString = [substring mutableCopy];
        [stringWithAppendedString appendAttributedString:fullDisclosureString];
        if ([stringWithAppendedString sizeConstrainedToSize:maxSize].height <= size.height) {
            break;
        }
    }
    
    if (appended) {
        *appended = YES;
    }
    return stringWithAppendedString;
}

// Taken from OHAttributedLabel
- (CGSize)sizeConstrainedToSize:(CGSize)maxSize {
	return [self sizeConstrainedToSize:maxSize fitRange:NULL];
}

// Taken from OHAttributedLabel
- (CGSize)sizeConstrainedToSize:(CGSize)maxSize fitRange:(NSRange *)fitRange {
	CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self);
    CGSize sz = CGSizeMake(0.f, 0.f);
    if (framesetter)
    {
        CFRange fitCFRange = CFRangeMake(0,0);
        sz = CTFramesetterSuggestFrameSizeWithConstraints(framesetter,CFRangeMake(0,0),NULL,maxSize,&fitCFRange);
        sz = CGSizeMake( floorf(sz.width+1) , floorf(sz.height+1)); // take 1pt of margin for security
        CFRelease(framesetter);
        
        if (fitRange)
        {
            *fitRange = NSMakeRange((NSUInteger)fitCFRange.location, (NSUInteger)fitCFRange.length);
        }
    }
    return sz;
}

@end

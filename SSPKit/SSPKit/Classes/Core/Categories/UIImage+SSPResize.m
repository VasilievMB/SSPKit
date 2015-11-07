//
//  UIImage+SSPResize.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 20/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "UIImage+SSPResize.h"
#import "UIImage+SSPRenderInContext.h"
#import "SSPGeometry.h"

@implementation UIImage (SSPResize)

- (UIImage *)ssp_imageWithSize:(CGSize)size {
    return [[self class] ssp_imageWithSize:size opaque:NO scale:self.scale draw:^(CGContextRef ctx) {
        CGRect rect = CGRectZero;
        rect.size = size;
        [self drawInRect:rect];
    }];
}

- (UIImage *)ssp_imageFittingSize:(CGSize)size {
    return [self ssp_imageWithSize:CGSizeAspectFitSize(self.size, size)];
}

- (UIImage *)ssp_imageFillingSize:(CGSize)size {
    CGRect imageRect = CGRectMakeWithSize(self.size);
    CGRect canvasRect = CGRectMakeWithSize(size);
    imageRect = CGRectAspectFillRect(imageRect, canvasRect);
    return [[self class] ssp_imageWithSize:canvasRect.size opaque:NO scale:self.scale draw:^(CGContextRef ctx) {
        [self drawInRect:imageRect];
    }];
}

- (UIImage *)ssp_imageWithCropRect:(CGRect)rect {
    return [[self class] ssp_imageWithSize:rect.size opaque:NO scale:self.scale draw:^(CGContextRef ctx) {
        [self drawAtPoint:CGPointMake(-rect.origin.x, -rect.origin.y)];
    }];
}

@end

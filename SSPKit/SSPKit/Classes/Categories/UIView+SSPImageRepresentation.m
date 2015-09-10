//
//  UIView+SSPImageRepresentation.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 19/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "UIView+SSPImageRepresentation.h"
#import "UIImage+SSPRenderInContext.h"

@implementation UIView (SSPImageRepresentation)

- (UIImage *)ssp_imageRepresentation {
    return [UIImage ssp_imageWithSize:self.bounds.size opaque:self.opaque scale:0.0 draw:^(CGContextRef ctx) {
        [self.layer renderInContext:ctx];
    }];
}

- (UIImage *)ssp_imageRepresentationWithSize:(CGSize)size {
    return [UIImage ssp_imageWithSize:size opaque:self.opaque scale:0.0 draw:^(CGContextRef ctx) {
        CGContextSaveGState(ctx);
        CGSize viewSize = self.bounds.size;
        CGContextScaleCTM(ctx, size.width / viewSize.width, size.height / viewSize.height);
        [self.layer renderInContext:ctx];
        CGContextRestoreGState(ctx);
    }];
}

@end

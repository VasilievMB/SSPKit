//
//  UIImage+SSPRenderInContext.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 20/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "UIImage+SSPRenderInContext.h"

@implementation UIImage (SSPRenderInContext)

+ (UIImage *)ssp_imageWithSize:(CGSize)size
                        opaque:(BOOL)opaque
                         scale:(CGFloat)scale
                          draw:(void (^)(CGContextRef ctx))draw {
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
    
    draw(UIGraphicsGetCurrentContext());
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

@end

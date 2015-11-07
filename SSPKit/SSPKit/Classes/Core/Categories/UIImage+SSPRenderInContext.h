//
//  UIImage+SSPRenderInContext.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 20/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SSPRenderInContext)

+ (UIImage *)ssp_imageWithSize:(CGSize)size
                        opaque:(BOOL)opaque
                         scale:(CGFloat)scale
                          draw:(void (^)(CGContextRef ctx))draw;

@end

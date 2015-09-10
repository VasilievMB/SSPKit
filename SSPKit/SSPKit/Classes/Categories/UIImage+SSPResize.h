//
//  UIImage+SSPResize.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 20/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SSPResize)

- (UIImage *)ssp_imageWithSize:(CGSize)size;
- (UIImage *)ssp_imageFittingSize:(CGSize)size;
- (UIImage *)ssp_imageFillingSize:(CGSize)size;
- (UIImage *)ssp_imageWithCropRect:(CGRect)rect;

@end

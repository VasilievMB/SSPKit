//
//  UIView+SSPImageRepresentation.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 19/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SSPImageRepresentation)

- (UIImage *)ssp_imageRepresentation;
- (UIImage *)ssp_imageRepresentationWithSize:(CGSize)size;

@end

//
//  UIImage+Resizing.h
//  SSPKit
//
//  Created by Vasiljev M.B. on 2/19/13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resizing)

+ (UIImage *)resizableImageNamed:(NSString *)imageName capInsets:(UIEdgeInsets)insets;
- (UIImage *)goodResizableImageWithCapInsets:(UIEdgeInsets)insets;

@end

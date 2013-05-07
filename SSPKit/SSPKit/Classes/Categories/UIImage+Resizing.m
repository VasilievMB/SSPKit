//
//  UIImage+Resizing.m
//  MoPals
//
//  Created by Vasiljev M.B. on 2/19/13.
//  Copyright (c) 2013 Dirsha A.A. All rights reserved.
//

#import "UIImage+Resizing.h"

@implementation UIImage (Resizing)

+ (UIImage *)resizableImageNamed:(NSString *)imageName capInsets:(UIEdgeInsets)insets {
    return [[UIImage imageNamed:imageName] goodResizableImageWithCapInsets:insets];
}

- (UIImage *)goodResizableImageWithCapInsets:(UIEdgeInsets)insets {
    if ([self respondsToSelector:@selector(resizableImageWithCapInsets:resizingMode:)]) {
        return [self resizableImageWithCapInsets:insets
                                     resizingMode:UIImageResizingModeStretch];
    } else {
        return [self resizableImageWithCapInsets:insets];
    }
}

@end

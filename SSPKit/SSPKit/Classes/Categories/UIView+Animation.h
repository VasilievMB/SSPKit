//
//  UIView+Animation.h
//  CarelessDrawing
//
//  Created by Petrichenko R. V. on 21.01.14.
//  Copyright (c) 2014 SSP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SSPVisibilityAnimation)

- (void)ssp_showAnimated:(BOOL)animated;
- (void)ssp_showAnimated:(BOOL)animated completion:(void (^)(void))completion;
- (void)ssp_hideAnimated:(BOOL)animated;
- (void)ssp_hideAnimated:(BOOL)animated completion:(void (^)(void))completion;

- (void)ssp_setAlphaForVisibility:(BOOL)visibility;
- (void)ssp_setVisible:(BOOL)visibility;
- (void)ssp_setVisible:(BOOL)visibility animated:(BOOL)animated completion:(void (^)(void))completion;
- (void)ssp_setVisible:(BOOL)visibility animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(void))completion;

@end

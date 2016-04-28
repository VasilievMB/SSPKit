//
//  UIView+Animation.m
//  CarelessDrawing
//
//  Created by Petrichenko R. V. on 21.01.14.
//  Copyright (c) 2014 SSP. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (SSPVisibilityAnimation)

- (void)ssp_showAnimated:(BOOL)animated{
    [self ssp_showAnimated:animated completion:nil];
}

- (void)ssp_hideAnimated:(BOOL)animated{
    [self ssp_hideAnimated:animated completion:nil];
}

- (void)ssp_showAnimated:(BOOL)animated completion:(void (^)(void))completion{
    [self ssp_setVisible:YES animated:animated completion:completion];
}

- (void)ssp_hideAnimated:(BOOL)animated completion:(void (^)(void))completion{
    [self ssp_setVisible:NO animated:animated completion:completion];
}

- (void)ssp_setVisible:(BOOL)visibility animated:(BOOL)animated completion:(void (^)(void))completion {
    [self ssp_setVisible:visibility
                animated:animated
                duration:[[self class] ssp_defaultVisibilityAnimationDuration]
              completion:completion];
}

+ (NSTimeInterval)ssp_defaultVisibilityAnimationDuration {
    return 0.2;
}

- (void)ssp_setVisible:(BOOL)visibility animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(void))completion {
    if (visibility == [self ssp_visible]) {
        if (completion) {
            completion();
        }
        return;
    }
    if (animated) {
        __weak typeof(self) weakSelf = self;
        if (visibility) {
            self.alpha = 0.;
        }
        [self ssp_setVisible:YES];
        [UIView animateWithDuration:duration animations:^{
            [weakSelf ssp_setAlphaForVisibility:visibility];
        } completion:^(BOOL finished) {
            [weakSelf ssp_setVisible:visibility];
            if (completion) {
                completion();
            }
        }];
    } else {
        [self ssp_setVisible:visibility];
        if (completion) {
            completion();
        }
    }
}

- (void)ssp_setAlphaForVisibility:(BOOL)visibility {
    self.alpha = visibility ? 1 : 0;
}

- (void)ssp_setVisible:(BOOL)visibility {
    self.hidden = !visibility;
}

- (BOOL)ssp_visible {
    return !self.hidden;
}

@end

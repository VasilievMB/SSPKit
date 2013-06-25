//
//  UIView+Placeholder.m
//  SSPKit
//
//  Created by Vasiljev M.B. on 2/12/13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import "UIView+SSPKit.h"

@implementation UIView (SSPKit)

+ (id)view {
    return [self viewWithNibNamed:NSStringFromClass(self)];
}

+ (id)viewWithNibNamed:(NSString *)nibName {
    return [self viewWithNibNamed:nibName owner:nil];
}

+ (id)viewWithOwner:(id)owner {
    return [self viewWithNibNamed:NSStringFromClass(self) owner:owner];
}

+ (id)viewWithNibNamed:(NSString *)nibName owner:(id)owner {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:nibName
                                                   owner:owner
                                                 options:nil];
    for (UIView *view in views) {
        if ([view isKindOfClass:self]) {
            return view;
        }
    }
    return nil;
}


- (void)replaceSubview:(UIView *)subview withView:(UIView *)replacingView {
    replacingView.frame = subview.frame;
    replacingView.autoresizingMask = subview.autoresizingMask;
    [self insertSubview:replacingView aboveSubview:subview];
    [subview removeFromSuperview];
}

+ (id)loadViewWithPlaceholderView:(UIView *)placeholderView {
    UIView *view = [self view];
    [placeholderView.superview replaceSubview:placeholderView withView:view];
    return view;
}

@end

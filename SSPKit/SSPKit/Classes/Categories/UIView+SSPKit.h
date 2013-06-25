//
//  UIView+Placeholder.h
//  SSPKit
//
//  Created by Vasiljev M.B. on 2/12/13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SSPKit)

+ (id)view;
+ (id)viewWithNibNamed:(NSString *)nibName;
+ (id)viewWithOwner:(id)owner;
+ (id)viewWithNibNamed:(NSString *)nibName owner:(id)owner;
+ (id)loadViewWithPlaceholderView:(UIView *)placeholderView;
- (void)replaceSubview:(UIView *)subview withView:(UIView *)replacingView;

@end

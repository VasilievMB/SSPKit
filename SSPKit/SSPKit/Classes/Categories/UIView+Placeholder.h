//
//  UIView+Placeholder.h
//  Converter
//
//  Created by Vasiljev M.B. on 2/12/13.
//
//

#import <UIKit/UIKit.h>

// TODO: rename category

@interface UIView (Placeholder)

+ (id)view;
+ (id)viewWithNibNamed:(NSString *)nibName;
+ (id)viewWithOwner:(id)owner;
+ (id)viewWithNibNamed:(NSString *)nibName owner:(id)owner;
+ (id)loadViewWithPlaceholderView:(UIView *)placeholderView;
- (void)replaceSubview:(UIView *)subview withView:(UIView *)replacingView;

@end

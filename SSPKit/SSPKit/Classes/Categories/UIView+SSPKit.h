//
//  UIView+Placeholder.h
//  SSPKit
//
//  Created by Vasiljev M.B. on 2/12/13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SSPKit)

+ (id)ssp_loadFromNib;
+ (id)ssp_loadFromNibNamed:(NSString *)nibName;
+ (id)ssp_loadFromNibWithOwner:(id)owner;
+ (id)ssp_loadFromNibNamed:(NSString *)nibName owner:(id)owner;
+ (NSString *)ssp_nibName;

@end

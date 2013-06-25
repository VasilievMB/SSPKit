//
//  UITableViewCell+SSPKit.h
//  SSPKit
//
//  Created by Turov Y.V. on 25.06.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (SSPKit)

+ (id)cellWithNibName:(NSString *)nibName;
+ (id)cell;
+ (CGFloat)defaultHeight;
+ (NSString *)reuseIdentifier;

@end

//
//  UITableViewCell+SSPKit.h
//  SSPKit
//
//  Created by Turov Y.V. on 25.06.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (SSPKit)

+ (NSString *)ssp_reuseIdentifier;
+ (UINib *)ssp_nib;
+ (void)ssp_registerNibInTableView:(UITableView *)tableView;
+ (void)ssp_registerClassInTableView:(UITableView *)tableView;

@end

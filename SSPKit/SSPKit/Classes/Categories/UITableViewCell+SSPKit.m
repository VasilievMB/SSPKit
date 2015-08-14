//
//  UITableViewCell+SSPKit.m
//  SSPKit
//
//  Created by Turov Y.V. on 25.06.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import "UITableViewCell+SSPKit.h"
#import "UIView+SSPKit.h"

@implementation UITableViewCell (SSPKit)

+ (NSString *)ssp_reuseIdentifier {
    return NSStringFromClass(self);
}

+ (UINib *)ssp_nib {
    return [UINib nibWithNibName:[self ssp_nibName] bundle:nil];
}

+ (void)ssp_registerNibInTableView:(UITableView *)tableView {
    [tableView registerNib:[self ssp_nib] forCellReuseIdentifier:[self ssp_reuseIdentifier]];
}

+ (void)ssp_registerClassInTableView:(UITableView *)tableView {
    [tableView registerClass:self forCellReuseIdentifier:[self ssp_reuseIdentifier]];
}

@end

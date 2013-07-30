//
//  UITableView+SSPKit.m
//  SSPKit
//
//  Created by Turov Y.V. on 30.07.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import "UITableView+SSPKit.h"

@implementation UITableView (SSPKit)

- (void)registerNibCellClass:(Class)aClass {
    [self registerNib:[aClass nib] forCellReuseIdentifier:[aClass reuseIdentifier]];
}

@end

//
//  UIView+Placeholder.m
//  SSPKit
//
//  Created by Vasiljev M.B. on 2/12/13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import "UIView+SSPKit.h"

@implementation UIView (SSPKit)

+ (id)ssp_loadFromNib {
    return [self ssp_loadFromNibNamed:[self ssp_nibName]];
}

+ (id)ssp_loadFromNibNamed:(NSString *)nibName {
    return [self ssp_loadFromNibNamed:nibName owner:nil];
}

+ (id)ssp_loadFromNibWithOwner:(id)owner {
    return [self ssp_loadFromNibNamed:NSStringFromClass(self) owner:owner];
}

+ (id)ssp_loadFromNibNamed:(NSString *)nibName owner:(id)owner {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:nibName
                                                   owner:owner
                                                 options:nil];
    for (id obj in views) {
        if ([obj isKindOfClass:self]) {
            return obj;
        }
    }
    return nil;
}

+ (NSString *)ssp_nibName {
    return NSStringFromClass(self);
}

@end

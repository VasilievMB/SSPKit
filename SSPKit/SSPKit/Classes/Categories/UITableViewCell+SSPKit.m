//
//  UITableViewCell+SSPKit.m
//  SSPKit
//
//  Created by Turov Y.V. on 25.06.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import "UITableViewCell+SSPKit.h"

@implementation UITableViewCell (SSPKit)

+ (id)cellWithNibName:(NSString *)nibName {
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName
                                                 owner:nil
                                               options:nil];
    return [nib lastObject];
}

+ (id)cell {
    return [self cellWithNibName:NSStringFromClass([self class])];
}

+ (CGFloat)defaultHeight  {
    return 40.0f;
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

@end

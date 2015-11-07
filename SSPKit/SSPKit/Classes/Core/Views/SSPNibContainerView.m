//
//  SSPNibContainerView.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 13/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "SSPNibContainerView.h"
#import "UIView+SSPKit.h"

@implementation SSPNibContainerView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSAssert(self.contentViewNibName != nil, @"You must specify 'contentViewNibName'");
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:self.contentViewNibName
                                                 owner:self.fileOwner
                                               options:nil];

    UIView *view = nil;
    for (id obj in nib) {
        if ([obj isKindOfClass:[UIView class]]) {
            view = obj;
        }
    }
    
    NSAssert1(view != nil, @"Could not load view from nib '%@'", self.contentViewNibName);
    
    [self addSubview:view];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}

@end

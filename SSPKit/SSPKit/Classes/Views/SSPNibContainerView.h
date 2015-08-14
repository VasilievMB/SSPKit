//
//  SSPNibContainerView.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 13/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSPNibContainerView : UIView

@property (weak, nonatomic) IBOutlet id fileOwner;
@property (strong, nonatomic) NSString *contentViewNibName;
@property (strong, nonatomic, readonly) UIView *contentView;

@end

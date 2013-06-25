//
//  BasePopupViewController.h
//  SSPKit
//
//  Created by Dirsha A.A. on 15.05.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSPBasePopupViewController : UIViewController

@property (nonatomic, strong) UIViewController *contentVC;
@property (nonatomic, readonly) BOOL popupVisible;

@property (nonatomic, copy) void(^onPopupDidDismissCallback)(void);
@property (nonatomic, copy) void(^onPopupWillDismissCallback)(void);

- (void)presentPopupInViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)dismissPopupAnimated:(BOOL)animated;

- (UINavigationController *)contentNavigationController;
- (UIViewController *)currentViewController;

- (UIView *)contentPlaceholderView;

@end

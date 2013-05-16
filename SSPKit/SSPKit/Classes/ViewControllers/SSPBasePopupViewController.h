//
//  BasePopupViewController.h
//  PuzzleGame
//
//  Created by Dirsha A.A. on 15.05.13.
//
//

#import <UIKit/UIKit.h>

@interface SSPBasePopupViewController : UIViewController

@property (nonatomic, strong) UIViewController *contentVC;
@property (nonatomic, readonly) BOOL popupVisible;

- (void)presentPopupInViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)dismissPopupAnimated:(BOOL)animated;

- (UINavigationController *)contentNavigationController;
- (UIViewController *)currentViewController;

- (UIView *)contentPlaceholderView;

@end

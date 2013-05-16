//
//  BasePopupViewController.m
//  PuzzleGame
//
//  Created by Dirsha A.A. on 15.05.13.
//
//

#import "SSPBasePopupViewController.h"
#import "AbstractMethod.h"
#import "PopupContentController.h"

@interface SSPBasePopupViewController ()

@property (nonatomic) BOOL popupVisible;

@end

@implementation SSPBasePopupViewController

+ (NSTimeInterval)animationDuration {
    return 0.3;
}

- (UIView *)contentPlaceholderView ABSTRACT_METHOD;

- (id)init
{
    self = [super init];
    if (self) {
        self.popupVisible = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (UINavigationController *)contentNavigationController {
    return [self.contentVC isKindOfClass:[UINavigationController class]] ? (UINavigationController *)self.contentVC : nil;
}

- (UIViewController *)currentViewController {
    return [self contentNavigationController] ? [self contentNavigationController].topViewController : self.contentVC;
}

- (void)setContentVC:(UIViewController *)contentVC {
    if (_contentVC) {
        [_contentVC.view removeFromSuperview];
    }
    
    _contentVC = contentVC;
}

- (void)presentPopupInViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.popupVisible = YES;
    
    [viewController.view addSubview:self.view];
    
    if (!_contentVC.view.superview) {
        [[self contentPlaceholderView] addSubview:_contentVC.view];
    }
    
    void (^showBlock)(void) = ^ {
        self.view.alpha = 1.f;
    };
    
    if (animated) {
        self.view.alpha = 0.f;
        
        [UIView animateWithDuration:[[self class] animationDuration] animations:showBlock];
    } else {
        showBlock();
    }
}

- (void)dismissPopupAnimated:(BOOL)animated {
    if (self.onPopupWillDismissCallback) {
        self.onPopupWillDismissCallback();
    }
    BOOL implementPopupContentController = [[self currentViewController] conformsToProtocol:@protocol(PopupContentController)];
    if (implementPopupContentController && [[self contentNavigationController] respondsToSelector:@selector(popupViewController:willDiswissAnimated:)]) {
        [((id <PopupContentController>)[self currentViewController]) popupViewController:self willDiswissAnimated:animated];
    }
    
    self.popupVisible = NO;
    
    void (^hideBlock)(BOOL finished) = ^(BOOL finished) {
        [self.view removeFromSuperview];
        self.view.alpha = 1.f;
        
        if (implementPopupContentController && [[self contentNavigationController] respondsToSelector:@selector(popupViewController:didDiswissAnimated::)]) {
            [((id <PopupContentController>)[self currentViewController]) popupViewController:self didDiswissAnimated:animated];
        }
        
        if (self.onPopupDidDismissCallback) {
            self.onPopupDidDismissCallback();
        }
    };
    
    if (animated) {
        [UIView animateWithDuration:[[self class] animationDuration] animations:^{
            self.view.alpha = 0.f;
        } completion:hideBlock];
    } else {
        hideBlock(YES);
    }
}

@end

//
//  PopupContentController.h
//  PuzzleGame
//
//  Created by Dirsha A.A. on 16.05.13.
//
//

#import <Foundation/Foundation.h>

@class BasePopupViewController;

@protocol PopupContentController <NSObject>

@optional
- (void)popupViewController:(BasePopupViewController *)popupViewController willDiswissAnimated:(BOOL)animated;
- (void)popupViewController:(BasePopupViewController *)popupViewController didDiswissAnimated:(BOOL)animated;

@end

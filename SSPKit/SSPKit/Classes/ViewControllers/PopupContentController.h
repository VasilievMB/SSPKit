//
//  PopupContentController.h
//  SSPKit
//
//  Created by Dirsha A.A. on 16.05.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SSPBasePopupViewController;

@protocol PopupContentController <NSObject>

@optional
- (void)popupViewController:(SSPBasePopupViewController *)popupViewController willDiswissAnimated:(BOOL)animated;
- (void)popupViewController:(SSPBasePopupViewController *)popupViewController didDiswissAnimated:(BOOL)animated;

@end

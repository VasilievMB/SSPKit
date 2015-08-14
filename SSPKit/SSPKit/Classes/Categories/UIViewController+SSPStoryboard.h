//
//  UIViewController+SSPStoryboard.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 13/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SSPStoryboard)

+ (instancetype)ssp_instantiateFromStoryboardNamed:(NSString *)storyboardName;
+ (instancetype)ssp_instantiateFromMainStoryboard;
+ (NSString *)ssp_mainStoryboardName; // Default is "Main"
+ (void)ssp_setMainStoryboardName:(NSString *)name;
+ (NSString *)ssp_storyboardIdentifier;

@end

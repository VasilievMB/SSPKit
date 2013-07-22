//
//  UIViewController+Storyboard.h
//  SSPKit
//
//  Created by Turov Y.V. on 22.07.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Storyboard)

+ (id)VCFromStoryboard:(UIStoryboard *)storyboard;
+ (id)VCFromStoryboardNamed:(NSString *)storyboardName;
+ (id)initialVCFromStoryboardNamed:(NSString *)storyboardName;

@end

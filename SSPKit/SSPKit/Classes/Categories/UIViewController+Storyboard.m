//
//  UIViewController+Storyboard.m
//  SSPKit
//
//  Created by Turov Y.V. on 22.07.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (id)VCFromStoryboard:(UIStoryboard *)storyboard {
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];
}

+ (id)VCFromStoryboardNamed:(NSString *)storyboardName {
    return [self VCFromStoryboard:[UIStoryboard storyboardWithName:storyboardName bundle:nil]];
}

+ (id)initialVCFromStoryboardNamed:(NSString *)storyboardName {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateInitialViewController];
}

@end

//
//  UIViewController+SSPStoryboard.m
//  SSPKit
//
//  Created by Vasilyev M.B. on 13/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#import "UIViewController+SSPStoryboard.h"

@implementation UIViewController (SSPStoryboard)

+ (instancetype)ssp_instantiateFromStoryboardNamed:(NSString *)storyboardName {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:[self ssp_storyboardIdentifier]];
}

+ (instancetype)ssp_instantiateFromMainStoryboard {
    return [self ssp_instantiateFromStoryboardNamed:[self ssp_mainStoryboardName]];
}

static NSString * ssp_mainStoryboardName = @"Main";

+ (NSString *)ssp_mainStoryboardName {
    return ssp_mainStoryboardName;
}

+ (void)ssp_setMainStoryboardName:(NSString *)name {
    ssp_mainStoryboardName = name;
}

+ (NSString *)ssp_storyboardIdentifier {
    return NSStringFromClass(self);
}

@end

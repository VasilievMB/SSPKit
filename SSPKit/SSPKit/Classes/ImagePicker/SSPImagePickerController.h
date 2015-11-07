//
//  SSPImagePickerController.h
//  SSPKit
//
//  Created by Mikhail on 07/11/15.
//  Copyright © 2015 Softinform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSPImagePickerController : UIImagePickerController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (copy, nonatomic) void (^completionHandler)(UIImagePickerController *picker, NSDictionary *info);

- (instancetype)initWithCompletionHandler:(void (^)(UIImagePickerController *picker, NSDictionary *info))completionHandler;
+ (instancetype)imagePickerControllerWithCompletionHandler:(void (^)(UIImagePickerController *picker, NSDictionary *info))completionHandler;

+ (void)pickImageWithPresentingViewController:(UIViewController *)presentingViewController
                                   sourceType:(UIImagePickerControllerSourceType)type
                                   completion:(void (^) (UIImagePickerController *picker, NSDictionary *info))completion
                                      failure:(void (^) ())failure;
+ (UIImagePickerController *)presentImagePickerControllerInViewController:(UIViewController *)presentingViewController
                                                           withSourceType:(UIImagePickerControllerSourceType)type
                                                               completion:(void (^) (UIImagePickerController *picker, NSDictionary *info))completion;

+ (void)requestCameraPermissionsWithPresentingViewController:(UIViewController *)presentingViewController
                                                     success:(void (^) ())success
                                                     failure:(void (^) ())failure;
+ (BOOL)onCameraPermissionsDeniedWithPresentingViewController:(UIViewController *)presentingViewController;

@end

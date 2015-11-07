//
//  SSPImagePickerController.m
//  SSPKit
//
//  Created by Mikhail on 07/11/15.
//  Copyright © 2015 Softinform. All rights reserved.
//

#import "SSPImagePickerController.h"
#import <AVFoundation/AVFoundation.h>

@interface SSPImagePickerController ()

@end

@implementation SSPImagePickerController

- (instancetype)initWithCompletionHandler:(void (^)(UIImagePickerController *picker, NSDictionary *info))completionHandler {
    self = [super init];
    if (self) {
        self.completionHandler = completionHandler;
        self.delegate = self;
    }
    return self;
}

+ (instancetype)imagePickerControllerWithCompletionHandler:(void (^)(UIImagePickerController *picker, NSDictionary *info))completionHandler {
    SSPImagePickerController *controller = [[[self class] alloc] initWithCompletionHandler:completionHandler];
    return controller;
}

+ (void)pickImageWithPresentingViewController:(UIViewController *)presentingViewController
                                   sourceType:(UIImagePickerControllerSourceType)type
                                   completion:(void (^) (UIImagePickerController *picker, NSDictionary *info))completion
                                      failure:(void (^) ())failure {
    if (type == UIImagePickerControllerSourceTypeCamera) {
        [self requestCameraPermissionsWithPresentingViewController:presentingViewController
                                                           success:^{
                                                               [self presentImagePickerControllerInViewController:presentingViewController
                                                                                                   withSourceType:type
                                                                                                       completion:completion];
                                                           }
                                                           failure:failure];
    } else {
        [self presentImagePickerControllerInViewController:presentingViewController
                                            withSourceType:type
                                                completion:completion];
    }
}

+ (UIImagePickerController *)presentImagePickerControllerInViewController:(UIViewController *)presentingViewController
                                                           withSourceType:(UIImagePickerControllerSourceType)type
                                                               completion:(void (^) (UIImagePickerController *picker, NSDictionary *info))completion {
    SSPImagePickerController *picker = [self imagePickerControllerWithCompletionHandler:completion];
    picker.sourceType = type;
    [presentingViewController presentViewController:picker animated:YES completion:nil];
    return picker;
}


#pragma mark - UIImagePickerController delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    SSPImagePickerController *pickerController = (SSPImagePickerController *)picker;
    if (pickerController.completionHandler) {
        pickerController.completionHandler(picker, info);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Permissions

+ (void)requestCameraPermissionsWithPresentingViewController:(UIViewController *)presentingViewController
                                                     success:(void (^) ())success
                                                     failure:(void (^) ())failure {
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusAuthorized) {
        if (success) {
            success();
        }
    } else if(authStatus == AVAuthorizationStatusDenied ||
              authStatus == AVAuthorizationStatusRestricted) {
        BOOL handled = [self onCameraPermissionsDeniedWithPresentingViewController:presentingViewController];
        if (!handled && failure) {
            failure();
        }
    } else if(authStatus == AVAuthorizationStatusNotDetermined){
        [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
            if(granted){
                if (success) {
                    success();
                }
            } else if (failure) {
                failure();
            }
        }];
    } else {
        NSAssert1(NO, @"Unknown authorization status: %ld", (long)authStatus);
    }
}

+ (BOOL)onCameraPermissionsDeniedWithPresentingViewController:(UIViewController *)presentingViewController {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 80000
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:NSLocalizedString(@"You have disabled Camera access", nil)
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Open Settings", @"Camera access denied: open the settings app to change privacy settings")
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                                                      }]
     ];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                                        style:UIAlertActionStyleDefault
                                                      handler:NULL]
     ];
    [presentingViewController presentViewController:alertController animated:YES completion:nil];
#endif
    
    return NO;
}

@end

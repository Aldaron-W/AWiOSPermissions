//
//  AWCameraPermission.m
//  AWiOSPermissions
//
//  Created by Aldaron on 16/6/29.
//  Copyright © 2016年 Aldaron. All rights reserved.
//

#import "AWCameraPermission.h"
#import "AWiOSPermissionsCore+Error.h"

@import AVFoundation;

@implementation AWCameraPermission

- (void)authorize:(AuthorizationHandler)completion{
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus permission = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (permission) {
            case AVAuthorizationStatusAuthorized: {
                if (completion) {
                    completion(true, nil, nil);
                }
            } break;
            case AVAuthorizationStatusDenied:
            case AVAuthorizationStatusRestricted: {
                if (completion) {
                    completion(false, nil, [self previouslyDeniedError]);
                }
            } break;
            case AVAuthorizationStatusNotDetermined: {
                self.completion = completion;
                [self actuallyAuthorize];
            } break;
        }
    } else {
        // Prior to iOS 8 all apps were authorized.
        if (completion) {
            completion(true, nil, nil);
        }
    }
    return;
}

- (AWAuthorizationStatus)authorizationStatus{
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus permission = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        switch (permission) {
            case AVAuthorizationStatusAuthorized:
                return AWPermissionAuthorized;
            case AVAuthorizationStatusDenied:
            case AVAuthorizationStatusRestricted:
                return AWPermissionSystemDenied;
            case AVAuthorizationStatusNotDetermined:
                return AWPermissionNotDetermined;
        }
    } else {
        // Prior to iOS 8 all apps were authorized.
        return AWPermissionAuthorized;
    }
    return AWPermissionError;
}

- (AWPermissionType)permissionType{
    return AWPermissionCamera;
}

- (void)actuallyAuthorize{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo
                             completionHandler:^(BOOL granted) {
                                 if (self.completion) {
                                     dispatch_async(dispatch_get_main_queue(), ^{
                                         if (granted) {
                                             self.completion(true, nil, nil);
                                         } else {
                                             self.completion(false, nil, nil);
                                         }
                                     });
                                 }
                             }];
}

@end

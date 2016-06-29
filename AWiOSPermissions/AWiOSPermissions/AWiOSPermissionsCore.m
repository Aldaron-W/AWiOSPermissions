//
//  AWiOSPermissionsCore.m
//  AWiOSPermissions
//
//  Created by Aldaron on 16/6/28.
//  Copyright © 2016年 Aldaron. All rights reserved.
//

#import "AWiOSPermissionsCore.h"

@implementation AWiOSPermissionsCore

- (void)authorize:(AuthorizationHandler)completion{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return;
}

- (AWAuthorizationStatus)authorizationStatus{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return AWPermissionError;
}

- (AWPermissionType)permissionType{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return AWPermissionTypeError;
}

@end

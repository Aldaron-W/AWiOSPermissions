//
//  AWiOSPermissionsCore+Error.m
//  AWiOSPermissions
//
//  Created by Aldaron on 16/6/30.
//  Copyright © 2016年 Aldaron. All rights reserved.
//

#import "AWiOSPermissionsCore+Error.h"

@implementation AWiOSPermissionsCore (Error)

- (NSError *)userDeniedError{
    return [NSError errorWithDomain:@"UserDenied" code:AWPermissionUserDenied userInfo:nil];
}

- (NSError *)previouslyDeniedError{
    return [NSError errorWithDomain:@"SystemDenied" code:AWPermissionSystemDenied userInfo:nil];
}

- (NSError *)systemDeniedError:(NSError *)error{
    return [NSError errorWithDomain:@"SystemDenied"
                               code:AWPermissionSystemDenied
                           userInfo:[error userInfo]];
}

@end

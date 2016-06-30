//
//  AWiOSPermissionsCore+Error.h
//  AWiOSPermissions
//
//  Created by Aldaron on 16/6/30.
//  Copyright © 2016年 Aldaron. All rights reserved.
//

#import "AWiOSPermissionsCore.h"

@interface AWiOSPermissionsCore (Error)

- (NSError *)userDeniedError;
- (NSError *)previouslyDeniedError;
- (NSError *)systemDeniedError:(NSError *)error;

@end

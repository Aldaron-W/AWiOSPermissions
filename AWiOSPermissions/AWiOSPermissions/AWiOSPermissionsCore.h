//
//  AWiOSPermissionsCore.h
//  AWiOSPermissions
//
//  Created by Aldaron on 16/6/28.
//  Copyright © 2016年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AWAuthorizationStatus) {
    AWPermissionError = -1,             /**< 子类未实现authorizationStatus函数 */
    AWPermissionNotDetermined = 0,      /**< 用户未选择 */
    AWPermissionUserDenied,             /**< 用户拒绝 */
    AWPermissionSystemDenied,           /**< 系统拒绝 */
    AWPermissionAuthorized              /**< 用户同意 */
};

typedef NS_ENUM(NSInteger, AWPermissionType) {
    AWPermissionTypeError = -1,         /**< 子类未实现permissionType函数 */
    AWPermissionCalendar = 0,
    AWPermissionCamera,
    AWPermissionContacts,
    AWPermissionFacebook,
    AWPermissionHealth,
    AWPermissionLocation,
    AWPermissionMicrophone,
    AWPermissionNotification,
    AWPermissionPhotos,
    AWPermissionReminders,
    AWPermissionTwitter,
};

typedef void (^AuthorizationHandler)(BOOL granted, NSString *__nullable content, NSError *__nullable error);

@interface AWiOSPermissionsCore : NSObject

@property (nonatomic, strong) __nullable AuthorizationHandler completion;
@property (nonatomic, readonly) AWAuthorizationStatus authorizationStatus;
@property (nonatomic, readonly) AWPermissionType permissionType;

- (void)authorize:(nonnull AuthorizationHandler)completion;

@end

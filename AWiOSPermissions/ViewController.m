//
//  ViewController.m
//  AWiOSPermissions
//
//  Created by Aldaron on 16/6/28.
//  Copyright © 2016年 Aldaron. All rights reserved.
//

#import "ViewController.h"
#import "AWCameraPermission.h"

@interface ViewController ()

@property (nonatomic, strong) AWCameraPermission *cameraPermissionAuth;
@property (weak, nonatomic) IBOutlet UILabel *cameraPermissionStatueLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _cameraPermissionStatueLabel.text = [NSString stringWithFormat:@"%ld", (long)[self.cameraPermissionAuth authorizationStatus]] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authCameraPermission:(id)sender {
    [self.cameraPermissionAuth authorize:^(BOOL granted, NSString * _Nullable content, NSError * _Nullable error) {
        ;
    }];
}

#pragma mark - Getter

- (AWCameraPermission *)cameraPermissionAuth{
    if (!_cameraPermissionAuth) {
        _cameraPermissionAuth = [AWCameraPermission new];
    }
    return _cameraPermissionAuth;
}

@end

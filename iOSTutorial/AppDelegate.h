//
//  AppDelegate.h
//  iOSTutorial
//
//  Created by Omar Guzmán on 2/24/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "LoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController * navigationController;
@property (nonatomic, strong) MainViewController * mainViewController;
@property (nonatomic, strong) LoginViewController * loginViewController;

@end


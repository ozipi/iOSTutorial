//
//  LoginViewController.h
//  iOSTutorial
//
//  Created by Omar Guzmán on 2/24/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JGProgressHUD.h>

#import "RESTManager.h"

@interface LoginViewController : UIViewController
// properties
@property (nonatomic, strong) IBOutlet UITextField * txtUser;
@property (nonatomic, strong) IBOutlet UITextField * txtPass;
@property (nonatomic, strong) JGProgressHUD * progressHud;
// actions
-(IBAction)doLogin:(id)sender;
@end

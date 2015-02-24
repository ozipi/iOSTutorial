//
//  LoginViewController.m
//  iOSTutorial
//
//  Created by Omar Guzmán on 2/24/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize txtPass, txtUser;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Acceso"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doLogin:(id)sender
{
    NSMutableDictionary * dictData = [[NSMutableDictionary alloc] initWithDictionary:@{@"admin_user": @{@"email":txtUser.text, @"password":txtPass.text}}];
    [RESTManager sendData:dictData toService:@"login" withMethod:@"POST" isTesting:NO withAccessToken:nil toCallBack:^(id result) {
        NSLog(@"login status: %@", result);
        if([[result objectForKey:@"success"] intValue] == 1)
        {
            NSLog(@"Login Success...");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"userDidLogin" object:nil];
        }
        else
        {
            NSLog(@"Login Error...");
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  AppDelegate.m
//  iOSTutorial
//
//  Created by Omar Guzmán on 2/24/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary * dictUser = [defaults objectForKey:@"userInfo"];
    NSLog([dictUser objectForKey:@"access_token"]);
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.mainViewController = [[MainViewController alloc] init];
    self.loginViewController = [[LoginViewController alloc] init];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:([[dictUser objectForKey:@"isUserLogged"] boolValue])?self.mainViewController:self.loginViewController];
    //self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.loginViewController];
    [self.window setRootViewController:self.navigationController];
    [self.window makeKeyAndVisible];
    // add Notification to change window when login success.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogin:) name:@"userDidLogin" object:nil];
    return YES;
}

-(void)userDidLogin:(NSNotification*)notification
{
    NSLog(@"User did Login, change View...");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"userDidLogin" object:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.mainViewController];
    [self.window setRootViewController:self.navigationController];
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

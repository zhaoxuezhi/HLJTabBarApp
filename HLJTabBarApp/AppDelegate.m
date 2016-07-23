//
//  AppDelegate.m
//  HLJTabBarApp
//
//  Created by zhaoxuezhi on 16/7/23.
//  Copyright © 2016年 zhaoxuezhi. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self buildTabBarControllerWithTabs:4];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)buildTabBarControllerWithTabs:(NSUInteger)numberOfTabs
{
    HLJTabBarViewController * tabBarController = [[HLJTabBarViewController alloc] init];
    
    NSMutableArray* controllers = [NSMutableArray arrayWithObject:[[UINavigationController alloc] initWithRootViewController:[[FirstViewController alloc] init]]];
    
    if (numberOfTabs > 1) {
        [controllers addObject:[[UINavigationController alloc] initWithRootViewController:[[SecondViewController alloc] init]]];
        if (numberOfTabs > 2) {
            [controllers addObject:[[UINavigationController alloc] initWithRootViewController:[[ThirdViewController alloc] init]]];
            if (numberOfTabs > 3) {
                [controllers addObject:[[UINavigationController alloc] initWithRootViewController:[[FourthViewController alloc] init]]];
                if (numberOfTabs > 4) {
                    [controllers addObject:[[UINavigationController alloc] initWithRootViewController:[[FifthViewController alloc] init]]];
                    if (numberOfTabs > 5) {
                        for (int i = 0; i < numberOfTabs - 5; i++) {
                            [controllers addObject:[[UINavigationController alloc] initWithRootViewController:[[FifthViewController alloc] init]]];
                        }
                    }
                }
            }
        }
    }
    
    tabBarController.viewControllers = controllers;
    self.appRootVC = tabBarController;
    self.window.rootViewController = tabBarController;
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

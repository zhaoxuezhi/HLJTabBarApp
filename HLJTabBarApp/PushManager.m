//
//  PushManager.m
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "PushManager.h"


@implementation PushManager

+(void)pushVC:(UIViewController *)vc
{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    HLJTabBarViewController *barVC = app.appRootVC;
    [(UINavigationController *)barVC.selectedNavController pushViewController:vc animated:YES];
}

@end

//
//  HLJTab+ViewController.m
//  HLJNewClient
//
//  Created by xiezi on 16/7/1.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "HLJTab+ViewController.h"
#import <objc/runtime.h>

@implementation HLJTab (ViewController)

static char tabBarControllerKey;

- (UIViewController *)viewController
{
    return (UIViewController *)objc_getAssociatedObject(self, &tabBarControllerKey);
}

- (void)setViewController:(UIViewController *)viewController
{
    objc_setAssociatedObject(self, &tabBarControllerKey, viewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

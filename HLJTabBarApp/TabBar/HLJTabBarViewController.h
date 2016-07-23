//
//  HLJTabBarViewController.h
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLJTab.h"
#import "HLJTabBar.h"

@protocol HLJTabBarControllerDelegate;

@interface HLJTabBarViewController : UIViewController<HJTabBarDelegate>

@property (nonatomic, readonly, strong) HLJTabBar* tabBar;
@property (nonatomic, strong) NSArray* viewControllers;

@property (nonatomic, weak) UINavigationController* selectedNavController;
@property (nonatomic) NSUInteger selectedIndex;

@property(nonatomic, weak) id<HLJTabBarControllerDelegate> delegate;

- (void)hidesBottomBar:(BOOL)hidden animation:(BOOL)animated;

@end



@protocol  HLJTabBarControllerDelegate <NSObject>
@optional

- (BOOL)tabBarShouldSelectViewController;
- (void)tabBarDidSelectViewController;

@end
//
//  HLJTabBar.h
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HLJTab;
@protocol HJTabBarDelegate;

@interface HLJTabBar : UIView

@property (nonatomic, weak) id<HJTabBarDelegate> delegate;

@property (nonatomic, strong) NSArray<HLJTab *> *items;
@property (nonatomic, weak) HLJTab *selectedItem;

// 设置这个tabBar背景图片
@property(nonatomic, strong) UIImage *backgroundImage;

@end


@protocol HJTabBarDelegate<NSObject>
@optional

- (void)tabBar:(HLJTabBar *)tabBar didSelectItem:(HLJTab *)item;

@end
//
//  HLJTabBarViewController.m
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "HLJTabBarViewController.h"
#import "HLJTab+ViewController.h"
#import "UIImage+Color.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a] //颜色

@interface HLJTabBarViewController ()

@property (nonatomic, readwrite, strong) HLJTabBar* tabBar;

@end

@implementation HLJTabBarViewController

-  (void)loadTabBarView
{
    self.tabBar = [[HLJTabBar alloc] init];
    self.tabBar.delegate = self;
        
    CGRect frame = self.tabBar.frame;
    frame.origin.y = self.view.bounds.size.height - frame.size.height;
    frame.size.width = self.view.bounds.size.width;
    self.tabBar.frame = frame;
    self.tabBar.backgroundImage = [UIImage imageWithColor:RGBA(189, 157, 98, 1)];
    [self.view addSubview:self.tabBar];
}

- (void) setViewControllers:(NSArray *)viewControllers {
    _viewControllers = viewControllers;
    
    [self loadControllerViews];
}

- (void) setUpTabBarItems {
    if ([_viewControllers count]>0) {
        
        NSArray *imageArray = @[@"home.png",@"classification.png",@"order.png",@"me.png"];
        NSArray *selectImageArray = @[@"home_sel.png",@"classification_sel.png",@"order_sel.png",@"me_sel.png"];
        
        NSMutableArray* items = [[NSMutableArray alloc] initWithCapacity:[_viewControllers count]];
        
        for(int i = 0; i < _viewControllers.count; i++) {
            
            HLJTab *tab = [HLJTab tabWithImage:[UIImage imageNamed:imageArray[i]]
                                 selectedImage:[UIImage imageNamed:selectImageArray[i]]
                       selectedBackgroundImage:[UIImage imageWithColor:[UIColor blackColor]]
                                         title:nil
                           ];
            tab.viewController = _viewControllers[i];
            
            __block HLJTab* tabItem = tab;
            [tab setTouchDownBlock:^{
                if ([self.tabBar.delegate respondsToSelector:@selector(tabBar:didSelectItem:)])
                    [self.tabBar.delegate performSelector:@selector(tabBar:didSelectItem:) withObject:self withObject:tabItem];
            }];
            [items addObject:tab];
        }
        
        self.tabBar.items = items;
    }
}

- (void)loadControllerViews {
    if ([_viewControllers count]>0) {
        for (id object in _viewControllers) {
            UIViewController* controller = (UIViewController*) object;
            [controller view];
            if ([controller isKindOfClass:[UINavigationController class]]) {
                UINavigationController* navController = (UINavigationController*) controller;
                [navController.topViewController view];
            }
        }
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];

    [self loadTabBarView];
    
    [self setUpTabBarItems];

    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITabBarDelegate methods

- (void)tabBar:(HLJTabBar *)tabBar didSelectItem:(HLJTab *)item
{
    UINavigationController* selectedController = nil;
    
    self.delegate = nil;
    UIViewController *vc = nil;
    
    for (UINavigationController* nav in _viewControllers) {
     
        if(item.viewController == nav) {
            selectedController = nav;

            // 根据nav 找到具体的 vc
            if(selectedController && selectedController.viewControllers.count > 0) {
                vc = selectedController.viewControllers[0];
                self.delegate = vc;
            }
            
            if ([self.delegate respondsToSelector:@selector(tabBarShouldSelectViewController)]) {
                if (![self.delegate tabBarShouldSelectViewController]) {
                    selectedController = nil;
                }
            }
            self.selectedNavController = selectedController;
            
            break;
        }
    }
    
    
    if(!selectedController) {
        return;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarDidSelectViewController)]) {
        [self.delegate tabBarDidSelectViewController];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    self.selectedNavController = [_viewControllers objectAtIndex:selectedIndex];
}

- (NSUInteger)selectedIndex {
    return [_viewControllers indexOfObject:_selectedNavController];
}

- (void)setSelectedNavController:(UINavigationController *)selectedNavController
{
    if (selectedNavController != _selectedNavController && [_viewControllers containsObject:selectedNavController]) {
    
        [_selectedNavController.view removeFromSuperview];
        
        CGRect frame = self.view.bounds;
        frame.size.height -= self.tabBar.frame.size.height;
        selectedNavController.view.frame = frame;
        
        [self.view insertSubview:selectedNavController.view belowSubview:self.tabBar];
        
        _selectedNavController = selectedNavController;
        
        
        for(HLJTab *tab in self.tabBar.items) {
            if(tab.viewController == _selectedNavController) {
                self.tabBar.selectedItem = tab;
                break;
            }
        }
    }
}

- (void)hidesBottomBar:(BOOL)hidden animation:(BOOL)animated
{
    CGFloat time = animated ? 0.2 : 0;
    __block CGRect rect = _tabBar.frame;

    CGRect frame = self.view.bounds;
    if(!hidden) {
        frame.size.height -= self.tabBar.frame.size.height;
    }

    if(hidden) {
        [UIView animateWithDuration:time
                         animations:^{
                             rect.origin.y = self.view.frame.size.height;
                             _tabBar.frame = rect;
                             _selectedNavController.view.frame = frame;
                         }];
    } else {
        [UIView animateWithDuration:time
                         animations:^{
                             rect.origin.y = self.view.frame.size.height - rect.size.height;
                             _tabBar.frame = rect;
                             _selectedNavController.view.frame = frame;
                         }];
    }
}


@end

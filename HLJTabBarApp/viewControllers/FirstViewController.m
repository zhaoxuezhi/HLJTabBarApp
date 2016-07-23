//
//  FirstViewController.m
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"
#import "PushManager.h"

@interface FirstViewController ()<HLJTabBarControllerDelegate>

@end

@implementation FirstViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"";
        self.tabBarItem.image = [UIImage imageNamed:@"home.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_sel.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Push" style:UIBarButtonItemStyleDone target:self action:@selector(pushVC)];
    
}

- (void)pushVC
{
    SecondViewController *vc = [[SecondViewController alloc] init];
    [PushManager pushVC:vc];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarDidSelectViewController
{
    NSLog(@"-------------  tabBarDidSelectViewController ------------");
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

//
//  ThirdViewController.m
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "ThirdViewController.h"
#import "HLJTabBarViewController.h"

@interface ThirdViewController ()<HLJTabBarControllerDelegate>

@end

@implementation ThirdViewController
- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"";
        self.tabBarItem.image = [UIImage imageNamed:@"order.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"order_sel.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];

}


- (BOOL)tabBarShouldSelectViewController
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

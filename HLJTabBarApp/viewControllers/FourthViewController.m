//
//  FourthViewController.m
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "FourthViewController.h"
#import "HLJTabBarViewController.h"

@interface FourthViewController ()<HLJTabBarControllerDelegate>

@end

@implementation FourthViewController
- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"";
        self.tabBarItem.image = [UIImage imageNamed:@"me.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"me_sel.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(back)];

}

- (void)back
{
    if(self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
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

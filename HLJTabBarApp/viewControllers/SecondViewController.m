//
//  SecondViewController.m
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "PushManager.h"


@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate,HLJTabBarControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SecondViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"";
        self.tabBarItem.image = [UIImage imageNamed:@"classification.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"classification_sel.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell %ld",indexPath.row+1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row %4) {
        case 0:
        {
            FirstViewController *vc = [[FirstViewController alloc] init];
            [PushManager pushVC:vc];
        }
            break;
        case 1:
        {
            SecondViewController *vc = [[SecondViewController alloc] init];
            [PushManager pushVC:vc];
        }
            break;
        case 2:
        {
            ThirdViewController *vc = [[ThirdViewController alloc] init];
            [PushManager pushVC:vc];
        }
            break;
        case 3:
        {
            FourthViewController *vc = [[FourthViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            
            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            HLJTabBarViewController *barVC = app.appRootVC;
            
            [barVC presentViewController:nav animated:YES completion:^{
                
            }];
            
        }

            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor blueColor];
    
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
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

//
//  CRTabBarViewController.m
//  CRCusTomTabBar
//
//  Created by Seven on 2018/1/23.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import "CRTabBarViewController.h"
#import "CRNavigationViewController.h"
#import "CRHomeViewController.h"
#import "CRMineViewController.h"
#import "CRPubViewController.h"
#import "CRTabBar.h"

@interface CRTabBarViewController ()<CRTabBarDelegate>

@end

@implementation CRTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupVc];
    
    CRTabBar *tabbar = [[CRTabBar alloc]init];
    tabbar.delegate_c = self;
    [self setValue:tabbar forKey:@"tabBar"];
}

- (void)setupVc {
    CRHomeViewController *homeViewController = [[CRHomeViewController alloc]init];
    UITabBarItem *homeTBI= [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tab_bar_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_bar_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    homeViewController.tabBarItem = homeTBI;
    
    CRNavigationViewController *home_navigation_Contoller = [[CRNavigationViewController alloc]initWithRootViewController:homeViewController];
    [self addChildViewController:home_navigation_Contoller];
    
    
    CRMineViewController *mineViewController = [[CRMineViewController alloc]init];
    UITabBarItem *mineTBI= [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tab_bar_my_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_bar_my_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineViewController.tabBarItem = mineTBI;
    
    CRNavigationViewController *mine_navigation_Contoller = [[CRNavigationViewController alloc]initWithRootViewController:mineViewController];
    [self addChildViewController:mine_navigation_Contoller];
}

- (void)centerBtnClick:(UIButton *)button{
    CRPubViewController *pubViewController = [[CRPubViewController alloc]init];
    CRNavigationViewController *pub_nav_Controller = [[CRNavigationViewController alloc]initWithRootViewController:pubViewController];
    [self presentViewController:pub_nav_Controller animated:YES completion:nil];
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

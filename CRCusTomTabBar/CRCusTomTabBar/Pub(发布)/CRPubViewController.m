//
//  CRPubViewController.m
//  CRCusTomTabBar
//
//  Created by Seven on 2018/1/23.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import "CRPubViewController.h"

@interface CRPubViewController ()

@end

@implementation CRPubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"X" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    self.view.backgroundColor = [UIColor orangeColor];

}

- (void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
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

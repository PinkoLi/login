//
//  TestOneViewController.m
//  login
//
//  Created by 茶茶漾 on 16/8/5.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "TestOneViewController.h"

@interface TestOneViewController ()

@end

@implementation TestOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        [_back setTitle:@"back" forState:UIControlStateNormal];
    }
    else{
       
        [_back setTitle:@"返回" forState:UIControlStateNormal];
}
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

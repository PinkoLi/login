//
//  PPTOneViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/14.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTOneViewController.h"

@interface PPTOneViewController ()

@end

@implementation PPTOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
      NSUserDefaults *time = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@",[thisArr objectForKey:@"thisArr"]);
    
    _yiyuan.text=[thisArr objectForKey:@"yiyuan"];
    _time.text=[time objectForKey:@"time"];
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

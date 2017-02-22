//
//  PPTEighteenViewController.h
//  login
//
//  Created by 茶茶漾 on 16/10/11.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPTEighteenViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (strong, nonatomic)NSMutableArray*allArr;

@property (strong, nonatomic)NSMutableArray*chooseArr;
@property (strong, nonatomic)NSMutableArray*yangbenArr;
@property (weak, nonatomic) IBOutlet UILabel *num1;
@property (weak, nonatomic) IBOutlet UILabel *num2;
@property (weak, nonatomic) IBOutlet UILabel *shuomingLb;

@property (weak, nonatomic) IBOutlet UILabel *nLb;

@property (strong, nonatomic)NSMutableArray*jingMaiArr;
@property (strong, nonatomic)NSMutableArray*qiPaoArr;
@property (strong, nonatomic)NSMutableArray*ningXueArr;
@property (strong, nonatomic)NSMutableArray*yangBenArr;
@property (strong, nonatomic)NSMutableArray*wuXiaoArr;
@property (strong, nonatomic)NSMutableArray*xinXiArr;
@property (strong, nonatomic)NSMutableArray*pianshaoArr;
@property (strong, nonatomic)NSMutableArray*shijianArr;


@end

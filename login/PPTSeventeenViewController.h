//
//  PPTSeventeenViewController.h
//  login
//
//  Created by 茶茶漾 on 16/10/11.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPTSeventeenViewController : UIViewController
@property (strong, nonatomic)NSMutableArray*chooseArr;
@property (strong, nonatomic)NSMutableArray*yangbenArr;
@property (weak, nonatomic) IBOutlet UILabel *num1;
@property (weak, nonatomic) IBOutlet UILabel *nLb;

@property (strong, nonatomic)NSMutableArray*shiwuArr;
@property (strong, nonatomic)NSMutableArray*ershiArr;
@property (strong, nonatomic)NSMutableArray*sanshiArr;
@property(copy,nonatomic)NSString*shiwu;
@property(copy,nonatomic)NSString*ershi;
@property(copy,nonatomic)NSString*sanshi;
@property (weak, nonatomic) IBOutlet UILabel *shuomingLb;
@end

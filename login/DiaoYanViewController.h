//
//  DiaoYanViewController.h
//  login
//
//  Created by 茶茶漾 on 16/8/4.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiaoYanViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *fangshi;
@property (weak, nonatomic) IBOutlet UILabel *pinlv;
@property (strong, nonatomic)NSMutableArray*keshi;
@property (strong, nonatomic)NSMutableArray*keshi2;
@property (strong, nonatomic)NSMutableArray*keshi3;

@property (strong, nonatomic)NSMutableArray*dongmaiArr;
@property (strong, nonatomic)NSMutableArray*dongmaiArr2;
@property (strong, nonatomic)NSMutableArray*dongmaiArr3;
@property (strong, nonatomic)NSMutableArray*dongmaiArr4;
@property (strong, nonatomic)NSMutableArray*zhusheArr;
@property (strong, nonatomic)NSMutableArray*zhusheArr2;
@property (strong, nonatomic)NSMutableArray*zhusheArr3;
@property (strong, nonatomic)NSMutableArray*zhusheArr4;
@property (strong, nonatomic)NSMutableArray*ksArr;






@property (strong, nonatomic)NSMutableArray*typeArr;
@property (strong, nonatomic)NSMutableArray*typeArr2;
@property (strong, nonatomic)NSMutableArray*typeArr3;
@property (strong, nonatomic)NSMutableArray*typeArr4;
@property (strong, nonatomic)NSMutableArray*fangshiArr;
@property (strong, nonatomic)NSMutableArray*pinlvArr;
@property (strong, nonatomic)NSMutableArray*pinlvArr2;
@property (strong, nonatomic)NSMutableArray*pinlvArr3;
@property (strong, nonatomic)NSMutableArray*pinlvArr4;

@property (weak, nonatomic) IBOutlet UILabel *zhusheLb;
@property (weak, nonatomic) IBOutlet UILabel *dongmaiLb;
@end

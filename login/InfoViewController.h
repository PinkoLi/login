//
//  InfoViewController.h
//  login
//
//  Created by 茶茶漾 on 16/7/29.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController<UITextFieldDelegate,UINavigationBarDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *generateBtn;
@property (weak, nonatomic) IBOutlet UIImageView *erweima;
- (IBAction)clear:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UILabel *shiyanLb;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
- (IBAction)shuaxin:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;

@property (weak, nonatomic) IBOutlet UIButton *zhuxiao;
@property (weak, nonatomic) IBOutlet UIButton *shuaxin;
@property (weak, nonatomic) IBOutlet UILabel *host;
@property (weak, nonatomic)NSString*name;
@property (weak, nonatomic)NSString*zhuangtai;
@property (weak, nonatomic)NSString*keshiStr;
@property (weak, nonatomic)NSString*diaoyanrenyuan;
@property (weak, nonatomic)NSString*a;
@property (weak, nonatomic)NSString*startStr;
@property (weak, nonatomic)NSString*endStr;
@property (weak, nonatomic)NSString*qitaStr;
@property (weak, nonatomic)NSString*numberStr;
@property (weak, nonatomic)NSString*numberStr2;
@property (strong, nonatomic)NSString*chooseStr;
@property (strong, nonatomic)NSString*bianhao;
@property (strong, nonatomic)NSString*bianhao2;
@property (strong, nonatomic) IBOutlet UILabel *fen;
- (IBAction)post:(id)sender;
- (IBAction)baogao:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic)   NSTimer *timeNow;
@property (weak, nonatomic) IBOutlet UILabel *keshi;
@property (weak, nonatomic) IBOutlet UILabel *start;
@property (weak, nonatomic) IBOutlet UILabel *end;
@property (weak, nonatomic) IBOutlet UILabel *qita;
@property (weak, nonatomic) IBOutlet UILabel *numberLb;
@property (strong, nonatomic)NSMutableArray*qitaArr;
@property (strong, nonatomic)NSMutableArray*chooseArray1;
@property (strong, nonatomic)NSMutableArray*thisArr;
@property (strong, nonatomic)NSMutableArray*thisArr2;

@property (strong, nonatomic)NSMutableArray*allArr;
- (IBAction)postWenJuan:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *keshiDiaoyan;
@property (weak, nonatomic) IBOutlet UILabel *hostLb;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (weak, nonatomic) IBOutlet UILabel *qitaLb;
@property (weak, nonatomic) IBOutlet UILabel *wanchengLb;
@property (weak, nonatomic) IBOutlet UILabel *keshiDiaoyanLb;
@property (weak, nonatomic) IBOutlet UILabel *hushiDiaoyanLb;
@property (weak, nonatomic) IBOutlet UILabel *shiyanshiLb;
@property (weak, nonatomic) IBOutlet UILabel *hushiErweimaLb;
@property (weak, nonatomic) IBOutlet UILabel *chooseKeshi;
@property (weak, nonatomic) IBOutlet UILabel *fuzhuNumberLb;

@property (strong, nonatomic)NSMutableArray*photoArr;
@end

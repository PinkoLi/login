//
//  Application ViewController.h
//  login
//
//  Created by 茶茶漾 on 16/6/30.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Application_ViewController : UIViewController
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *name;
- (IBAction)dele:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *keshi;

- (IBAction)into:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *host;
@property (weak, nonatomic) IBOutlet UITextField *start;

@property (weak, nonatomic) IBOutlet UITextField *end;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sel2;
- (IBAction)sele:(id)sender;
- (IBAction)hostPaiXu:(id)sender;
- (IBAction)timePaiXu:(id)sender;
- (IBAction)typePaiXu:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *xiezhuLb;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;

@property (weak, nonatomic) IBOutlet UIButton *zhuxiao;
@property (weak, nonatomic) IBOutlet UIButton *shuaxin;

//@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;
@property (strong, nonatomic)  UISegmentedControl *seg;
@property (weak, nonatomic) IBOutlet UILabel *diaoyan;
@property (weak, nonatomic) IBOutlet UILabel *shenqing;
@property (weak, nonatomic) IBOutlet UILabel *keshiText;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIButton *diaoyan2;
@property (weak, nonatomic) IBOutlet UIButton *wenjuan;
- (IBAction)diaoyan3:(id)sender;
- (IBAction)wenjuan2:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *shengqing;
@property (weak, nonatomic) IBOutlet UITableView *table3;
- (IBAction)xzPost:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *xztext;
@property(nonatomic,copy)NSString*keshiStr2;
- (IBAction)zhuxiaoAct:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *typeText;


@end

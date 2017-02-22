//
//  SecondViewController.h
//  login
//
//  Created by 茶茶漾 on 16/6/29.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    
    NSArray* list;            //下拉列表数据
    BOOL showList;             //是否弹出下拉列表
    UITableView* listView;    //下拉列表
    CGRect oldFrame, newFrame;   //整个控件（包括下拉前和下拉后）的矩形
    UIColor *lineColor, *listBgColor;//下拉框的边框色、背景色
    CGFloat lineWidth;               //下拉框边框粗细
    UITextBorderStyle borderStyle;   //文本框边框style
}
@property (weak, nonatomic) IBOutlet UILabel *versionLb;
- (IBAction)changeYuYan:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *passWord;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UILabel *switchLb;

- (IBAction)mainSwtich:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *mainSwtich;

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)forget:(id)sender;

- (IBAction)login:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *reme;
- (IBAction)reme:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *foge;
@property (weak, nonatomic) IBOutlet UIButton *l_timeButton;
@property (weak, nonatomic) IBOutlet UIButton *reme2;
@property (weak, nonatomic) IBOutlet UIButton *foge2;
- (IBAction)remember2:(id)sender;
- (IBAction)forget2:(id)sender;


- (IBAction)foge:(id)sender;
-(void)drawView;
-(void)setShowList:(BOOL)b;
@end

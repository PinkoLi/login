//
//  WenJuanViewController.h
//  login
//
//  Created by 茶茶漾 on 16/8/31.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WenJuanViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (copy, nonatomic)NSString*keshiLb;
@property (copy, nonatomic)NSString*keshiBianhao;
@property (copy, nonatomic)NSString*tihuanStr;
@property (weak, nonatomic) IBOutlet UILabel *chooseKeshi;
- (IBAction)next:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *redayBtn;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UIView *infoView;

@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;
@property (weak, nonatomic) IBOutlet UILabel *lb4;

@property (weak, nonatomic) IBOutlet UILabel *lb1;

@property(strong ,nonatomic )NSMutableArray*optionArray;
@property(strong ,nonatomic )NSMutableArray*optionArray2;
@property(strong ,nonatomic )NSMutableArray*allArray;

@property(strong ,nonatomic )NSMutableArray*opts;
@property(strong ,nonatomic )NSMutableArray*opts2;

@property(strong ,nonatomic )NSArray*titleArr2;
@property(strong ,nonatomic )NSMutableArray*answer;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (strong, nonatomic) UIButton*btn;

@property (strong, nonatomic)UIImageView*imageView;
@property(strong ,nonatomic )NSMutableArray*allArr;
@property(strong ,nonatomic )NSMutableArray*allArr2;

@property(strong ,nonatomic )NSMutableDictionary*options;
@property(strong ,nonatomic )NSMutableDictionary*texts;


@property(nonatomic,strong)NSMutableArray *AllShuJu;
@property (weak, nonatomic) IBOutlet UIView *step1;
@property (weak, nonatomic) IBOutlet UIView *step2;
@end

//
//  ThreeViewController.h
//  login
//
//  Created by 茶茶漾 on 16/10/2.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *keshi;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;

@property (weak, nonatomic) IBOutlet UILabel *lb4;
- (IBAction)takePhoto1:(id)sender;
- (IBAction)takePhoto2:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
- (IBAction)seg:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn2;


@property (weak, nonatomic) IBOutlet UIView *view3;
- (IBAction)nextBtn:(id)sender;

@property(strong ,nonatomic )NSMutableArray*chooseArray1;
@property(strong ,nonatomic )NSMutableArray*chooseArray2;
@property(strong ,nonatomic )NSMutableArray*chooseArray3;

@property(strong ,nonatomic )NSMutableArray*oneArray;
@property(strong ,nonatomic )NSMutableArray*twoArray;
@property(strong ,nonatomic )NSMutableArray*threeArray;
@property(strong ,nonatomic )NSString*chooseStr;
@property(strong ,nonatomic )NSString*chooseStr2;
@property(strong ,nonatomic )NSString*str;
@property (strong, nonatomic) IBOutlet UITextField *text1;
@property (strong, nonatomic) IBOutlet UITextField *text2;
@property (strong, nonatomic) IBOutlet UITextField *text3;
@property (strong, nonatomic) IBOutlet UITextField *text4;
@property (strong, nonatomic) IBOutlet UITextField *text5;
@property (weak, nonatomic) IBOutlet UITextField *text6;


@end

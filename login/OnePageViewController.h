//
//  OnePageViewController.h
//  login
//
//  Created by 茶茶漾 on 16/10/2.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnePageViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textLb2;
@property (weak, nonatomic) IBOutlet UITextField *textLb3;
- (IBAction)takePhoto:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *img1;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
- (IBAction)nextBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property(strong ,nonatomic )NSMutableArray*chooseArray1;
@property(strong ,nonatomic )NSMutableArray*chooseArray2;
@property(strong ,nonatomic )NSMutableArray*chooseArray3;
@property(strong ,nonatomic )NSMutableArray*chooseArray4;
@property(strong ,nonatomic )NSMutableArray*chooseArray5;
@property(strong ,nonatomic )NSMutableArray*chooseArray6;
@property(strong ,nonatomic )NSMutableArray*chooseArray7;

@property(strong ,nonatomic )NSMutableArray*threeArray2;
@property (weak, nonatomic) IBOutlet UILabel *keshi;
- (IBAction)seg:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@end

//
//  TwoViewController.h
//  login
//
//  Created by 茶茶漾 on 16/10/2.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UIButton *next;
- (IBAction)nextBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;

@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;

@property (weak, nonatomic) IBOutlet UIView *view3;

@property(strong ,nonatomic )NSMutableArray*chooseArray1;
@property(strong ,nonatomic )NSMutableArray*oneArray;
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property(strong ,nonatomic )NSString*chooseStr;
@property (weak, nonatomic) IBOutlet UILabel *keshi;
- (IBAction)takePhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
- (IBAction)seg:(id)sender;

@end

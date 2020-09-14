//
//  TwentySixViewController.h
//  login
//
//  Created by 茶茶漾 on 16/10/4.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwentySixViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>
- (IBAction)seg:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;
@property (weak, nonatomic) IBOutlet UILabel *keshi;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@property (strong, nonatomic) IBOutlet UIButton *photoBtn2;
@property (weak, nonatomic) IBOutlet UILabel *uilb;
@property (strong, nonatomic) IBOutlet UITextField *text1;

- (IBAction)takePhoto:(id)sender;
- (IBAction)takePhoto2:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *img1;

@property (strong, nonatomic) IBOutlet UIImageView *img2;

- (IBAction)nextBtn:(id)sender;
@property(strong ,nonatomic )NSString*str;


@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view1;


@property (weak, nonatomic) IBOutlet UIView *view3;

@property(strong ,nonatomic )NSMutableArray*chooseArray1;

@property(strong ,nonatomic )NSMutableArray*oneArray;

@property(strong ,nonatomic )NSMutableArray*chooseArray2;

@property(strong ,nonatomic )NSMutableArray*twoArray;

@end

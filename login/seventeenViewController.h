//
//  seventeenViewController.h
//  login
//
//  Created by 茶茶漾 on 16/10/4.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface seventeenViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *keshi;

@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;

- (IBAction)takePhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
- (IBAction)seg:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;


- (IBAction)nextBtn:(id)sender;







@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view1;


@property (weak, nonatomic) IBOutlet UIView *view3;

@property(strong ,nonatomic )NSMutableArray*chooseArray1;


@end

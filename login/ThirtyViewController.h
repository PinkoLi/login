//
//  ThirtyViewController.h
//  login
//
//  Created by 茶茶漾 on 16/10/6.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirtyViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *keshi;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;

- (IBAction)seg:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;



- (IBAction)nextBtn:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view1;


@property (weak, nonatomic) IBOutlet UIView *view3;

@property(strong ,nonatomic )NSMutableArray*chooseArray1;
@property(strong ,nonatomic )NSMutableArray*chooseArray2;
@property(strong ,nonatomic )NSMutableArray*oneArray;
@property(strong ,nonatomic )NSMutableArray*twoArray;
@end

//
//  ViewController.h
//  login
//
//  Created by 茶茶漾 on 16/6/29.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)getPassWrod:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)reme:(id)sender;
- (IBAction)foge:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *reme;
@property (weak, nonatomic) IBOutlet UIButton *foge;
@property (weak, nonatomic) IBOutlet UIButton *l_timeButton;
@end


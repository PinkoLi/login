//
//  ChangePwViewController.h
//  login
//
//  Created by 芙兰茶 on 2017/7/13.
//  Copyright © 2017年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePwViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *tf1;
@property (strong, nonatomic) IBOutlet UITextField *tf2;
- (IBAction)go:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *authcodeText;
@property (strong, nonatomic) IBOutlet UIButton *authcodeBtn;
- (IBAction)authcodeAct:(id)sender;

@end

//
//  QuestionViewController.h
//  login
//
//  Created by 茶茶漾 on 16/7/1.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMComBoxView.h"
#import "LMContainsLMComboxScrollView.h"
@interface QuestionViewController : UIViewController<UITextFieldDelegate,LMComBoxViewDelegate>

@property (weak, nonatomic)NSString*bianhao;
@property (weak, nonatomic)NSString*bianhao2;
@property (weak, nonatomic)NSString*keshi;
@property (weak, nonatomic)NSString*gansuType;
@property (weak, nonatomic)NSString*fangshi;
@property (weak, nonatomic)NSString*pinglv;
@property (weak, nonatomic)NSString*host;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic)   NSTimer *timeNow;





@end

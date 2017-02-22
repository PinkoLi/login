//
//  RightTableViewCell.h
//  login
//
//  Created by 茶茶漾 on 16/7/11.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *hos;
@property (weak, nonatomic) IBOutlet UILabel *keshi;

@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *final;

@property (weak, nonatomic) IBOutlet UILabel *jieguo;
@property (weak, nonatomic) IBOutlet UIButton *pass;
@property (weak, nonatomic) IBOutlet UIButton *nopass;
@end

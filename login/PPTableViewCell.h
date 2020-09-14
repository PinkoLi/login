//
//  PPTableViewCell.h
//  login
//
//  Created by 茶茶漾 on 16/7/29.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bianhao;

@property (weak, nonatomic) IBOutlet UILabel *host;
@property (weak, nonatomic) IBOutlet UILabel *keshi;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *typeText;
@end

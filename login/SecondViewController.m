//
//  SecondViewController.m
//  login
//
//  Created by 茶茶漾 on 16/6/29.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "SecondViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "LXF_OpenUDID.h"
#import "ChangePwViewController.h"
@interface SecondViewController ()
@property (strong, nonatomic) MBProgressHUD *hud;
@property (strong, nonatomic)NSString*pw;
@property (strong, nonatomic)NSString*name;
@property(strong,nonnull)NSDictionary*parameters;
@property(nonatomic,strong)ChangePwViewController*changePwVC;


@end

@implementation SecondViewController

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    
    
//    NSUserDefaults*version=[NSUserDefaults standardUserDefaults];
//    NSLog(@"%@",[version objectForKey:@"version"]);
    
    
//    
//    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    
//    
//    
//    [sessionManager GET:@"https://netkq.webbsn.com/BD/getvison.php" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"%lld", downloadProgress.totalUnitCount);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        
//        NSLog(@"%@",[responseObject objectForKey:@"version"]);
//        
//        
//        _versionLb.text=[@"版本号:" stringByAppendingString:@"1.170705"];
//        [_versionLb setTextColor:UIColorFromRGB(0x848484)];
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];

    
    _versionLb.text=[@"版本号:" stringByAppendingString:@"202000915"];
    [_versionLb setTextColor:UIColorFromRGB(0x848484)];
    
   
    
    
    
    // Do any additional setup after loading the view.
    [_changeBtn setAdjustsImageWhenHighlighted:NO];
//    [_l_timeButton.layer setMasksToBounds:YES];
//    [_l_timeButton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
//    [_l_timeButton.layer setBorderWidth:1.0]; //边框宽度
   // [_l_timeButton setBackgroundColor:UIColorFromRGB(0xd0d0d0)];
    [_l_timeButton setBackgroundColor:UIColorFromRGB(0xec6606)];

    
    
//    [_loginBtn.layer setMasksToBounds:YES];
//    [_loginBtn.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
//    [_loginBtn.layer setBorderWidth:1.0]; //边框宽度
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if (![user objectForKey:@"pw"]&&[user objectForKey:@"english"]) {
        _foge2.hidden=NO;
        
    }
    else if ([user objectForKey:@"pw"]&&[user objectForKey:@"english"]){
        _reme2.hidden=NO;
        _email.text=[user objectForKey:@"email"];
        _password.text=[user objectForKey:@"pw"];
        _password.secureTextEntry = YES;
        
    
    }
    else if (![user objectForKey:@"pw"]&&![user objectForKey:@"english"]){
    
        _reme.hidden=NO;
       
    
    }
    else if ([user objectForKey:@"pw"]&&![user objectForKey:@"english"]){
        _foge.hidden=NO;
        _email.text=[user objectForKey:@"email"];
        _password.text=[user objectForKey:@"pw"];
        _password.secureTextEntry = YES;
       
        
    }


    
    
    if ([user objectForKey:@"english"]) {
        _userName.text=@"UserName";
        _passWord.text=@"PassWord";
        _switchLb.text=@"Switch to English";
        [_l_timeButton setTitle:@"Obtain password" forState:UIControlStateNormal];
        [_loginBtn setTitle:@"Log in" forState:UIControlStateNormal];
        
        [_changeBtn setImage:[UIImage imageNamed:@"ying.png"] forState:UIControlStateNormal];
        
        _email.placeholder=@"Company e-mail";
        _password.placeholder=@"Enter password";

    }
    else{
        _userName.text=@"登录邮箱";
        _passWord.text=@"登录密码";
        _switchLb.text=@"切换英文";
        
        
        
        
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"1"]){
           
            //第一次启动
            
            NSLog(@"第一次启动");
            
           [_l_timeButton setTitle:@"忘记/修改密码" forState:UIControlStateNormal];
            
        }else{
            //不是第一次启动了
            NSLog(@"不是第一次启动");
            
            [_l_timeButton setTitle:@"忘记/修改密码" forState:UIControlStateNormal];
        }

        
        
       
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _changeBtn.selected=YES;
        [_changeBtn setImage:[UIImage imageNamed:@"zhong.png"] forState:UIControlStateNormal];
        
        _email.placeholder=@"请输入公司邮箱";
        _password.placeholder=@"请输入您的密码";
    }

    
    //showList=NO; //默认不显示下拉框
    
//    list=[[NSArray alloc]initWithObjects:@"529491165@qq.com",@"liehao.li@bansonevents.com",nil];
//    lineColor=[UIColor lightGrayColor];//默认列表边框线为灰色
//    listBgColor=[UIColor whiteColor];//默认列表框背景色为白色
//    lineWidth=1;
//    
//    [_email addTarget:self action:@selector(dropdown) forControlEvents:UIControlEventAllTouchEvents];
//    listView=[[UITableView alloc]initWithFrame:
//              CGRectMake(424,266,173, (35*list.count)+1)];
//    listView.dataSource=self;
//    listView.delegate=self;
//    listView.backgroundColor=listBgColor;
//    listView.separatorColor=lineColor;
//     listView.hidden=YES;
//    // listView.hidden=YES;//一开始listView是隐藏的，此后根据showList的值显示或隐藏
//    
//    [self.view addSubview:listView];
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)drawView{



    

}
-(void)dropdown{
    //[_email resignFirstResponder];
    
        listView.hidden=NO;
        
    //}
}

#pragma mark listViewdataSource method and delegate method
-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
    return list.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid=@"listviewid";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:cellid];
    }
    //文本标签
    cell.textLabel.text=(NSString*)[list objectAtIndex:indexPath.row];
    cell.textLabel.font=_email.font;
    
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}
//当选择下拉列表中的一行时，设置文本框中的值，隐藏下拉列表
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"select");
    _email.text = (NSString *)[list objectAtIndex:indexPath.row];
    //NSLog(@"1");
    //NSLog(@"textField.text=%@",textField.text);
    listView.hidden=YES;
    _password.text=@"";
}
-(BOOL)showList{//setShowList:No为隐藏，setShowList:Yes为显示
    return showList;
}
-(void)setShowList:(BOOL)b{
    showList=b;
    NSLog(@"showlist is set ");
    if(showList){
        listView=[[UITableView alloc]initWithFrame:
                  CGRectMake(420,266,173, (28*list.count)+1)];
    }else {
       listView.hidden=YES;
        NSLog(@"2222222");
        
    }
    listView.hidden=!b;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)forget:(id)sender {
    
    
   
    [self performSegueWithIdentifier:@"push" sender:self];

    
    
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//
//    if (![self  isValidateEmail:_email.text]) {
//        UIColor *color = [UIColor cyanColor];
//
//        _hud = [[MBProgressHUD alloc] initWithView:self.view];
//        _hud.mode = MBProgressHUDModeText;
//        if ([user objectForKey:@"english"]) {
//
//            _hud.labelText = @"Your email format is wrong";
//
//        }else{
//        _hud.labelText = @"您的邮箱格式有误";
//        }
//        _hud.labelFont = [UIFont systemFontOfSize:17];
//        _hud.labelColor = color; //设置文本颜色；默认为白色
//        _hud.detailsLabelText = @"^_^";
//        _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
//        _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
//        [self.view addSubview:_hud];
//
//        [_hud showAnimated:YES
//       whileExecutingBlock:^{
//           [self taskOfText];
//       } completionBlock:^{
//           NSLog(@"showHUDByText 执行完成");
//       }];
//
//        return;
//
//    }
//
//    else{
//
//        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您确定要发送重置验证码到您的邮箱?" delegate:self cancelButtonTitle:@"是" otherButtonTitles:@"否",nil];
//        [alertView show];
//        alertView.tag=1;
//
//
//
//
//
//
//    }

    
   
    
    

    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag==1) {
        if (buttonIndex==0) {
            AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager sharedManager];
            //开启监听，记得开启，不然不走block
            [manger startMonitoring];
            //2.监听改变
            [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
                /*
                 AFNetworkReachabilityStatusUnknown = -1,
                 AFNetworkReachabilityStatusNotReachable = 0,
                 AFNetworkReachabilityStatusReachableViaWWAN = 1,
                 AFNetworkReachabilityStatusReachableViaWiFi = 2,
                 */
                switch (status) {
                    case AFNetworkReachabilityStatusUnknown:
                        NSLog(@"未知");
                        break;
                    case AFNetworkReachabilityStatusNotReachable:
                        NSLog(@"没有网络");
                    {
                        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                        UIColor *color = [UIColor cyanColor];
                        
                        _hud = [[MBProgressHUD alloc] initWithView:self.view];
                        _hud.mode = MBProgressHUDModeText;
                        if ([user objectForKey:@"english"]) {
                            
                            _hud.labelText = @"live without the Internet";
                            
                        }else{
                            _hud.labelText = @"没有网络";
                        }
                        
                        _hud.labelFont = [UIFont systemFontOfSize:17];
                        _hud.labelColor = color; //设置文本颜色；默认为白色
                        // _hud.detailsLabelText = @"^_^";
                        _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
                        _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
                        [self.view addSubview:_hud];
                        
                        [_hud showAnimated:YES
                       whileExecutingBlock:^{
                           [self taskOfText];
                       } completionBlock:^{
                           NSLog(@"showHUDByText 执行完成");
                       }];
                        
                        
                    }
                        
                        
                        break;
                    case AFNetworkReachabilityStatusReachableViaWWAN:
                        NSLog(@"3G|4G");
                        break;
                    case AFNetworkReachabilityStatusReachableViaWiFi:
                        NSLog(@"WiFi");
                    {
                        
                        
  
                        
                    }
                        
                        break;
                    default:
                        break;
                }
            }];

            
            
            
            
            
            
            
            
            
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];

            AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
            sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
            
            NSDictionary *parameters =@{@"email":_email.text};
            [sessionManager POST:[url stringByAppendingString:sendEmil] parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                NSLog(@"%lld", downloadProgress.totalUnitCount);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@", responseObject);
                
                
                if (!([[responseObject objectForKey:@"ok"] intValue]==1)) {
                   // _zhuangtai=@"结束";
                    
                    UIColor *color = [UIColor cyanColor];
                    
                    _hud = [[MBProgressHUD alloc] initWithView:self.view];
                    _hud.mode = MBProgressHUDModeText;
                    if ([user objectForKey:@"english"]) {
                        
                        _hud.labelText = @"Please make sure your email";
                        
                    }else{
                        _hud.labelText = @"请确认您的邮箱";
                    }
                    
                    _hud.labelFont = [UIFont systemFontOfSize:17];
                    _hud.labelColor = color; //设置文本颜色；默认为白色
                    _hud.detailsLabelText = @"^_^";
                    _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
                    _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
                    [self.view addSubview:_hud];
                    
                    [_hud showAnimated:YES
                   whileExecutingBlock:^{
                       [self taskOfText];
                   } completionBlock:^{
                       NSLog(@"showHUDByText 执行完成");
                   }];
                    return ;
                }
                
                else if ([[responseObject objectForKey:@"ok"] intValue]==1){
                    
                    _pw=[NSString stringWithFormat:@"%d",[[[responseObject objectForKey:@"0"]objectForKey:@"pw"]intValue]];
                    _name=[[responseObject objectForKey:@"0"] objectForKey:@"name"];
                    
                    NSLog(@"%@",_pw);
                    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                    [user setObject:_email.text forKey:@"email"];
                    [user setObject:_name forKey:@"name"];
                    [user setObject:_pw forKey:@"pw"];
                    
                    
                    [user setBool:YES forKey:@"2"];
                    [user synchronize];
                    
                    UIColor *color = [UIColor cyanColor];
                    
                    _hud = [[MBProgressHUD alloc] initWithView:self.view];
                    _hud.mode = MBProgressHUDModeText;
                    if ([user objectForKey:@"english"]) {
                        
                        _hud.labelText = @"Please make sure your email";
                        
                    }else{
                        _hud.labelText = @"发送验证码成功,请注意查收";
                    }
                    
                    _hud.labelFont = [UIFont systemFontOfSize:17];
                    _hud.labelColor = color; //设置文本颜色；默认为白色
                    _hud.detailsLabelText = @"^_^";
                    _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
                    _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
                    [self.view addSubview:_hud];
                    
                    [_hud showAnimated:YES
                   whileExecutingBlock:^{
                       [self taskOfText];
                   } completionBlock:^{
                       NSLog(@"showHUDByText 执行完成");
                   }];
                    
                    
                    __block int timeout=30; //倒计时时间
                    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
                    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
                    dispatch_source_set_event_handler(_timer, ^{
                        if(timeout<=0){ //倒计时结束，关闭
                            dispatch_source_cancel(_timer);
                            dispatch_async(dispatch_get_main_queue(), ^{
                                //设置界面的按钮显示 根据自己需求设置
                                
                                // [_l_timeButton setBackgroundColor:[UIColor clearColor]];
                                if ([user objectForKey:@"english"]) {
                                    
                                    [_l_timeButton setTitle:@"Obtain password" forState:UIControlStateNormal];
                                    
                                }else{
                                    [_l_timeButton setTitle:@"忘记/修改密码" forState:UIControlStateNormal];
                                }
                                //[_l_timeButton setTitle:@"忘记密码" forState:UIControlStateNormal];
                                _l_timeButton.userInteractionEnabled = YES;
                                // _l_timeButton.hidden=NO;
                            });
                        }else{
                            
                            //_l_timeButton.hidden=YES;
                            int seconds = timeout % 60;
                            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
                            dispatch_async(dispatch_get_main_queue(), ^{
                                //设置界面的按钮显示 根据自己需求设置
                                //NSLog(@"____%@",strTime);
                                //[_l_timeButton setBackgroundColor:[UIColor grayColor]];
                                [UIView beginAnimations:nil context:nil];
                                [UIView setAnimationDuration:1];
                                if ([user objectForKey:@"english"]) {
                                    
                                    [_l_timeButton setTitle:[NSString stringWithFormat:@"%@re-send30secondslater",strTime] forState:UIControlStateNormal];
                                    
                                }else{
                                    [_l_timeButton setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                                }
                                
                                [UIView commitAnimations];
                                _l_timeButton.userInteractionEnabled = NO;
                                
                            });
                            timeout--;
                        }
                    });
                    dispatch_resume(_timer);
                    
                    
                }
                
                
                
                
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"%@",error);
            }];
            
        }
    }
    
}





- (IBAction)login:(id)sender {
    
    
    
    
    AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager sharedManager];
    //开启监听，记得开启，不然不走block
    [manger startMonitoring];
    //2.监听改变
    [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /*
         AFNetworkReachabilityStatusUnknown = -1,
         AFNetworkReachabilityStatusNotReachable = 0,
         AFNetworkReachabilityStatusReachableViaWWAN = 1,
         AFNetworkReachabilityStatusReachableViaWiFi = 2,
         */
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
            {
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                UIColor *color = [UIColor cyanColor];
                
                _hud = [[MBProgressHUD alloc] initWithView:self.view];
                _hud.mode = MBProgressHUDModeText;
                if ([user objectForKey:@"english"]) {
                    
                    _hud.labelText = @"live without the Internet";
                    
                }else{
                    _hud.labelText = @"没有网络";
                }
                
                _hud.labelFont = [UIFont systemFontOfSize:17];
                _hud.labelColor = color; //设置文本颜色；默认为白色
               // _hud.detailsLabelText = @"^_^";
                _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
                _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
                [self.view addSubview:_hud];
                
                [_hud showAnimated:YES
               whileExecutingBlock:^{
                   [self taskOfText];
               } completionBlock:^{
                   NSLog(@"showHUDByText 执行完成");
               }];
            
            
            }
              
                
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G|4G");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
            {
                
      
                
            }
                
                break;
            default:
                break;
        }
    }];

    
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ( _email.text.length<=0||_password.text.length<=0) {
        UIColor *color = [UIColor cyanColor];
        
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.mode = MBProgressHUDModeText;
        if ([user objectForKey:@"english"]) {
            
            _hud.labelText = @"Please enter the complete";
            
        }else{
            _hud.labelText = @"请输入完整";
        }
        
        _hud.labelFont = [UIFont systemFontOfSize:17];
        _hud.labelColor = color; //设置文本颜色；默认为白色
        _hud.detailsLabelText = @"^_^";
        _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
        _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
        [self.view addSubview:_hud];
        
        [_hud showAnimated:YES
       whileExecutingBlock:^{
           [self taskOfText];
       } completionBlock:^{
           NSLog(@"showHUDByText 执行完成");
       }];
        return;
        
    }

    else{
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:format];
        
        
        
        NSLog(@"%@",_password.text);
        
        

        if([[NSUserDefaults standardUserDefaults] boolForKey:@"2"]){
            
            NSString *openUDID = [LXF_OpenUDID value];

             _parameters =@{@"email":_email.text,@"code":[NSString stringWithFormat:@"%d",_password.text.intValue],@"deviceId":openUDID};
            
        
        }else{
            
            NSString *openUDID = [LXF_OpenUDID value];

        
         _parameters =@{@"email":_email.text,@"password":_password.text,@"device_id":openUDID};
        
        }
        
        
        
        
//        NSDictionary *parameters =@{@"email":_email.text,@"code":[NSString stringWithFormat:@"%d",_password.text.intValue]};
        [sessionManager POST:[url stringByAppendingString:login] parameters:_parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"%lld", downloadProgress.totalUnitCount);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@", responseObject);
            
            
            if ([[responseObject objectForKey:@"code"] intValue]!=1) {
                UIColor *color = [UIColor cyanColor];
                
                _hud = [[MBProgressHUD alloc] initWithView:self.view];
                _hud.mode = MBProgressHUDModeText;
                if ([user objectForKey:@"english"]) {
                    
                    _hud.labelText = @"Password or email address does not match";
                    
                }else{
                    _hud.labelText = [responseObject objectForKey:@"msg"];
                }
                
                _hud.labelFont = [UIFont systemFontOfSize:17];
                _hud.labelColor = color; //设置文本颜色；默认为白色
                _hud.detailsLabelText = @"^_^";
                _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
                _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
                [self.view addSubview:_hud];
                
                [_hud showAnimated:YES
               whileExecutingBlock:^{
                   [self taskOfText];
               } completionBlock:^{
                   NSLog(@"showHUDByText 执行完成");
               }];
                
            }
            
            else{
                
                
                

                if (_foge.hidden==NO||_reme2.hidden==NO) {
                    
                    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"1"]){
                        
                        _pw=[NSString stringWithFormat:@"%d",[_password.text intValue]];
                        
                    }else{
                        
                        
                        _pw=_password.text ;
                        
                    }

                    
                    
                    
                    
                                    [user setObject:_email.text forKey:@"email"];
                    
                                    [user setObject:_pw forKey:@"pw"];
                    
                    NSLog(@"%@,    %@",[user objectForKey:@"email"],[user objectForKey:@"pw"]);
                                    [user synchronize];
                    
                    
                }
                else{
                    
                    [user removeObjectForKey:@"email"];
                    [user removeObjectForKey:@"pw"];
                    [user synchronize];
                    
                    
                }
                
                NSLog(@"%@",responseObject);
                
               
                 [user setObject:[[responseObject objectForKey:@"data"] objectForKey:@"username"] forKey:@"name"];
                [user setObject:[[responseObject objectForKey:@"data"] objectForKey:@"token"] forKey:@"token"];
                [user setObject:[[responseObject objectForKey:@"data"] objectForKey:@"userid"] forKey:@"userid"];

                
                
                  if([[NSUserDefaults standardUserDefaults] boolForKey:@"2"]){
                    //第一次启动
                    
                   // NSLog(@"第一次启动");
                    NSUserDefaults *email = [NSUserDefaults standardUserDefaults];

                    
                    
                    [email setObject:_email.text forKey:@"email"];
                    [email synchronize];
                    
                    
                    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"2"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    [self performSegueWithIdentifier:@"change" sender:self];
                    
                    
                }else{
                    //不是第一次启动了
                    NSLog(@"不是第一次启动");
                    
                    NSUserDefaults *email = [NSUserDefaults standardUserDefaults];
                    
                    
                    
                    [email setObject:_email.text forKey:@"email"];
                    [email synchronize];
                    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"2"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                     [self performSegueWithIdentifier:@"go" sender:self];
                    
                }

                
               

                
                
            }
            
            
            
            
            
            
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            
            
           
        }];
        
    }

    
    
    
    

}




-(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//点击屏幕，让键盘弹回
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)taskOfText {
    [self taskOfIndeterminate];
}
- (void)taskOfIndeterminate {
    sleep(2); //进程挂起3秒，这里仅仅是模拟，相当于执行了一些操作耗时3秒；sleep 和 usleep 都是进程挂起操作方法，他们的精准度不同，所以按需使用；对于一般秒级别操作，就使用 sleep 方法
}
- (IBAction)reme:(id)sender {
    _foge.hidden=NO;
    _reme.hidden=YES;
    _foge2.hidden=YES;
    _reme2.hidden=YES;
}
- (IBAction)remember2:(id)sender {
    _foge.hidden=YES;
    _reme.hidden=YES;
    _foge2.hidden=NO;
    _reme2.hidden=YES;
}

- (IBAction)forget2:(id)sender {
    _foge.hidden=YES;
    _reme.hidden=YES;
    _foge2.hidden=YES;
    _reme2.hidden=NO;
}

- (IBAction)foge:(id)sender {
    _foge.hidden=YES;
    _reme.hidden=NO;
    _foge2.hidden=YES;
    _reme2.hidden=YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [_l_timeButton setBackgroundColor:UIColorFromRGB(0xec6606)];
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //??使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if(version<8.0){
        if(self.interfaceOrientation==UIDeviceOrientationLandscapeLeft){
            self.view.frame = CGRectMake(self.view.frame.origin.x+100, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x-100, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-100 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}
//在UITextField 编辑完成调用方法
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //设置动画的名字
   // [_l_timeButton setBackgroundColor:UIColorFromRGB(0xd0d0d0)];
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //??使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if(version<8.0){
        if(self.interfaceOrientation==UIDeviceOrientationLandscapeLeft){
            self.view.frame = CGRectMake(self.view.frame.origin.x-100, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x+100, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }
    else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+100 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}

- (IBAction)changeYuYan:(id)sender {
    
    if (_reme.hidden==NO) {
        //_reme.hidden=YES;
       
        _reme.hidden=YES;
        _foge2.hidden=NO;
        
       
    }
    else if (_foge.hidden==NO){
    
        _foge.hidden=YES;
        _reme2.hidden=NO;
        
        
    }
    else if (_reme2.hidden==NO) {
        //_reme.hidden=YES;
        
        _reme2.hidden=YES;
        _foge.hidden=NO;
       
    }
    else if (_foge2.hidden==NO){
        
        _foge2.hidden=YES;
        _reme.hidden=NO;
    }
    

    
    
     NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if (_changeBtn.selected==YES) {
        [_changeBtn setSelected:NO];
        
        _userName.text=@"UserName";
        _passWord.text=@"PassWord";
        _switchLb.text=@"Switch to English";
        [_l_timeButton setTitle:@"GetPassWord" forState:UIControlStateNormal];
        [_loginBtn setTitle:@"Log in" forState:UIControlStateNormal];
        
        [user setBool:YES forKey:@"english"];
        [user synchronize]; 
        [_changeBtn setImage:[UIImage imageNamed:@"ying.png"] forState:UIControlStateNormal];
        
        
        _email.placeholder=@"Company e-mail";
        _password.placeholder=@"Enter password";

        
        
        
    }
    else{
        
        
        [_changeBtn setSelected:YES];
        
        _userName.text=@"登录邮箱";
        _passWord.text=@"登录密码";
        _switchLb.text=@"切换英文";
        [_l_timeButton setTitle:@"忘记/修改密码" forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        
        [user removeObjectForKey:@"english"];
        [user synchronize];
       [_changeBtn setImage:[UIImage imageNamed:@"zhong.png"] forState:UIControlStateNormal];


        _email.placeholder=@"请输入公司邮箱";
        _password.placeholder=@"请输入您的密码";
    }
}
@end

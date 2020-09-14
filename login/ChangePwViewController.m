//
//  ChangePwViewController.m
//  login
//
//  Created by 芙兰茶 on 2017/7/13.
//  Copyright © 2017年 茶茶漾. All rights reserved.
//

#import "ChangePwViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "LXF_OpenUDID.h"
@interface ChangePwViewController ()
@property (strong, nonatomic) MBProgressHUD *hud;
@property (strong, nonatomic)NSString*email;

@end

@implementation ChangePwViewController

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_authcodeBtn setBackgroundColor:UIColorFromRGB(0xec6606)];
    //[_loginBtn setTitle:@"登录" forState:UIControlStateNormal];


    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)taskOfText {
    [self taskOfIndeterminate];
}
- (void)taskOfIndeterminate {
    sleep(2); //进程挂起3秒，这里仅仅是模拟，相当于执行了一些操作耗时3秒；sleep 和 usleep 都是进程挂起操作方法，他们的精准度不同，所以按需使用；对于一般秒级别操作，就使用 sleep 方法
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)go:(id)sender {
    
    
    [self networking];

    
    
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:format];
        
    NSDictionary *parameters =@{@"email":_emailText.text,@"password":_tf1.text,@"repassword":_tf2.text,@"authcode":_authcodeText.text};
        // NSDictionary *parameters =@{@"email":_emailText.text};
        
        NSLog(@"%@",parameters);
        
        
        [sessionManager POST:[url stringByAppendingString:pwRest] parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"%lld", downloadProgress.totalUnitCount);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@", responseObject);
            
            
            
            if ([[responseObject objectForKey:@"code"] intValue]==1){
                
               
                
              UIColor *color = [UIColor cyanColor];
                 
                 _hud = [[MBProgressHUD alloc] initWithView:self.view];
                 _hud.mode = MBProgressHUDModeText;
                 _hud.labelText = [responseObject objectForKey:@"msg"];
                 
                 _hud.labelFont = [UIFont systemFontOfSize:17];
                 _hud.labelColor = color; //设置文本颜色；默认为白色
                 _hud.detailsLabelText = @"^_^";
                 _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
                 _hud.detailsLabelColor = color; //设置详细文本 颜色；默认为白色
                 [self.view addSubview:_hud];
                 
                 [_hud showAnimated:YES
                whileExecutingBlock:^{
                    [self taskOfText];
                } completionBlock:^{
                    NSLog(@"showHUDByText 执行完成");
                }];
                
                [self performSegueWithIdentifier:@"back" sender:self];

                

                
            }
            else{
                
                 UIColor *color = [UIColor cyanColor];
                       
                       _hud = [[MBProgressHUD alloc] initWithView:self.view];
                       _hud.mode = MBProgressHUDModeText;
                       _hud.labelText = [responseObject objectForKey:@"msg"];
                       
                       _hud.labelFont = [UIFont systemFontOfSize:17];
                       _hud.labelColor = color; //设置文本颜色；默认为白色
                       _hud.detailsLabelText = @"^_^";
                       _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
                       _hud.detailsLabelColor = color; //设置详细文本 颜色；默认为白色
                       [self.view addSubview:_hud];
                       
                       [_hud showAnimated:YES
                      whileExecutingBlock:^{
                          [self taskOfText];
                      } completionBlock:^{
                          NSLog(@"showHUDByText 执行完成");
                      }];
                       

                
            }

            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            
            
            
        }];
        
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    
    if (alertView.tag==1) {
        
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"1"]){
            
            //第一次启动
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"1"];
            [[NSUserDefaults standardUserDefaults] synchronize];

            
            NSLog(@"第一次启动");
           // [self performSegueWithIdentifier:@"shuoming" sender:self];
            
            [self performSegueWithIdentifier:@"home" sender:self];


            
          
        }else{
            //不是第一次启动了
            
           // [self performSegueWithIdentifier:@"go" sender:self];
            [self performSegueWithIdentifier:@"home" sender:self];


            NSLog(@"不是第一次启动");
            
        }
        
        
        
    }
    
    

    
    
}

//点击屏幕，让键盘弹回
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [_authcodeBtn setBackgroundColor:UIColorFromRGB(0xec6606)];

    
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
    
   // [_authcodeBtn setBackgroundColor:UIColorFromRGB(0xd0d0d0)];

    
    //设置动画的名字
   
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

- (IBAction)authcodeAct:(id)sender {
    
    [self networking];
    
    
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:format];
    
//    NSDictionary *parameters =@{@"email":_emailText.text,@"password":_tf1.text,@"repassword":_tf2.text};
     NSDictionary *parameters =@{@"email":_emailText.text};
    
    NSLog(@"%@",parameters);
    
    
    [sessionManager POST:[url stringByAppendingString:sendEmil] parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        
        
        if ([[responseObject objectForKey:@"code"] intValue]==1){
            
           
            
          UIColor *color = [UIColor cyanColor];
             
             _hud = [[MBProgressHUD alloc] initWithView:self.view];
             _hud.mode = MBProgressHUDModeText;
             _hud.labelText = [responseObject objectForKey:@"msg"];
             
             _hud.labelFont = [UIFont systemFontOfSize:17];
             _hud.labelColor = color; //设置文本颜色；默认为白色
             _hud.detailsLabelText = @"^_^";
             _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
             _hud.detailsLabelColor = color; //设置详细文本 颜色；默认为白色
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
                        
                         //[_authcodeBtn setBackgroundColor:[UIColor clearColor]];
                        
                        //[_l_timeButton setTitle:@"忘记密码" forState:UIControlStateNormal];
                        [_authcodeBtn setBackgroundColor:UIColorFromRGB(0xec6606)];

                         [_authcodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
                        _authcodeBtn.userInteractionEnabled = YES;
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
//                        if ([user objectForKey:@"english"]) {
//
//                            [_l_timeButton setTitle:[NSString stringWithFormat:@"%@re-send30secondslater",strTime] forState:UIControlStateNormal];
//
//                        }else{
                        [_authcodeBtn setBackgroundColor:UIColorFromRGB(0xd0d0d0)];

                            [_authcodeBtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                       // }
                        
                        [UIView commitAnimations];
                        _authcodeBtn.userInteractionEnabled = NO;
                        
                    });
                    timeout--;
                }
            });
            dispatch_resume(_timer);
            

            
        }
        else{
            
             UIColor *color = [UIColor cyanColor];
                   
                   _hud = [[MBProgressHUD alloc] initWithView:self.view];
                   _hud.mode = MBProgressHUDModeText;
                   _hud.labelText = [responseObject objectForKey:@"msg"];
                   
                   _hud.labelFont = [UIFont systemFontOfSize:17];
                   _hud.labelColor = color; //设置文本颜色；默认为白色
                   _hud.detailsLabelText = @"^_^";
                   _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
                   _hud.detailsLabelColor = color; //设置详细文本 颜色；默认为白色
                   [self.view addSubview:_hud];
                   
                   [_hud showAnimated:YES
                  whileExecutingBlock:^{
                      [self taskOfText];
                  } completionBlock:^{
                      NSLog(@"showHUDByText 执行完成");
                  }];
                   

            
        }

        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
        
        
    }];
    
}

- (void) networking{
    
    
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
                   
               {
                   NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                   UIColor *color = [UIColor cyanColor];
                   
                   _hud = [[MBProgressHUD alloc] initWithView:self.view];
                   _hud.mode = MBProgressHUDModeText;
                   if ([user objectForKey:@"english"]) {
                       
                       _hud.labelText = @"live without the Internet";
                       
                   }else{
                       _hud.labelText = @"当前网络状态不佳,请稍后再试哦";
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
                       _hud.labelText = @"当前网络状态不佳,请稍后再试哦";
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
               {
                   NSLog(@"WiFi");

               }
                   
                   break;
               default:
                   break;
           }
       }];
}

@end

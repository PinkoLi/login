//
//  ViewController.m
//  login
//
//  Created by 茶茶漾 on 16/6/29.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"




@interface ViewController ()
@property (strong, nonatomic) MBProgressHUD *hud;
@property (strong, nonatomic)NSString*pw;
@property (strong, nonatomic)NSString*name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _reme.hidden=YES;
    
    _email.placeholder=@"";
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getPassWrod:(id)sender {
    
    
    
    
    if (![self  isValidateEmail:_email.text]) {
        UIColor *color = [UIColor cyanColor];
        
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.mode = MBProgressHUDModeText;
        _hud.labelText = @"您的邮箱格式有误";
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
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSDictionary *parameters =@{@"email":_email.text};
    [sessionManager POST:@"https://paqcabg.chinacloudsites.cn/BD/index.php/Mail/sendMail/" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        
        if ([[responseObject objectForKey:@"ok"] intValue]==0) {
            UIColor *color = [UIColor cyanColor];
            
            _hud = [[MBProgressHUD alloc] initWithView:self.view];
            _hud.mode = MBProgressHUDModeText;
            _hud.labelText = @"请确认您的邮箱";
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
       
        else{
            
            _pw=[NSString stringWithFormat:@"%d",[[[responseObject objectForKey:@"0"]objectForKey:@"pw"]intValue]];
            
            NSLog(@"%@",_pw);
            
            
            _name=[[responseObject objectForKey:@"0"] objectForKey:@"name"];
            NSLog(@"%@",_pw);
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:_email.text forKey:@"email"];
        [user setObject:_name forKey:@"name"];
        [user setObject:_pw forKey:@"pw"];
        [user synchronize];
        
            
        }
        
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

    }
    
    __block int timeout=30; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
                [_l_timeButton setBackgroundColor:[UIColor clearColor]];
                [_l_timeButton setTitle:@"获取密码" forState:UIControlStateNormal];
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
                [_l_timeButton setBackgroundColor:[UIColor grayColor]];
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                
                [_l_timeButton setTitle:[NSString stringWithFormat:@"%@秒后重新获取",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                _l_timeButton.userInteractionEnabled = NO;
                
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);

    
    
    
}

- (IBAction)login:(id)sender {
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    if ( _email.text.length<=0||_password.text.length<=0) {
        UIColor *color = [UIColor cyanColor];
        
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.mode = MBProgressHUDModeText;
        _hud.labelText = @"请输入完整";
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
    else if (![_password.text isEqualToString:[user objectForKey:@"pw"]]&&![_email.text isEqualToString:[user objectForKey:@"email"]]){
    
        NSLog(@"%@,%@",_password.text,_pw);
        UIColor *color = [UIColor cyanColor];
        
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.mode = MBProgressHUDModeText;
        _hud.labelText = @"您的密码或邮箱地址有误";
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
        
        if (_reme.hidden==NO) {
            _pw=[NSString stringWithFormat:@"%d",[_password.text intValue]];
            
            [user setObject:_email.text forKey:@"email"];
            
            [user setObject:_pw forKey:@"pw"];
            [user synchronize];
        }
        else{
            
            [user removeObjectForKey:@"email"];
            [user removeObjectForKey:@"pw"];
            [user synchronize];
            
            
        }
       
    [self performSegueWithIdentifier:@"go" sender:self];
    
    }
    
    
    
    
}

- (IBAction)reme:(id)sender {
    
    _foge.hidden=NO;
    _reme.hidden=YES;
}

- (IBAction)foge:(id)sender {
    
    _foge.hidden=YES;
    _reme.hidden=NO;
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

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
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
@end

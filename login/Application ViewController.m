//
//  Application ViewController.m
//  login
//
//  Created by 茶茶漾 on 16/6/30.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "Application ViewController.h"
#import "STPickerDate.h"
#import "STPickerArea.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "SSCheckBoxView.h"
#import "MikiCell.h"
#import "RightTableViewCell.h"
#import "FMDatabase.h"
#import "QuestionViewController.h"
#import "PPTableViewCell.h"
#import "InfoViewController.h"
#import "LXF_OpenUDID.h"

@interface Application_ViewController ()<UITextFieldDelegate, STPickerDateDelegate,STPickerAreaDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *typeBtn;
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;
@property (weak, nonatomic) IBOutlet UIButton *hostBtn;
- (IBAction)shuaxin:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *resetLabel;
@property (weak, nonatomic)   NSTimer *timeNow;
@property (weak, nonatomic) IBOutlet UILabel *bianhaoLb;


@property(strong ,nonatomic )NSMutableDictionary*dict;
@property (strong, nonatomic) MBProgressHUD *hud;
@property(nonatomic,strong)SSCheckBoxView *cb;
@property(nonatomic,strong)SSCheckBoxView *cb2;
@property(nonatomic,strong)SSCheckBoxView *cb3;
@property(nonatomic,strong)SSCheckBoxView *cb4;
@property(nonatomic,strong)SSCheckBoxView *cb5;
@property(nonatomic,strong)SSCheckBoxView *cb6;
@property(nonatomic,strong)SSCheckBoxView *cb7;
@property(nonatomic,strong)SSCheckBoxView *cb8;
@property(nonatomic,strong)SSCheckBoxView *cb9;
@property(nonatomic,strong)NSMutableArray *mutableArray;
@property(nonatomic,strong)NSMutableArray *mutableArray2;
@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)UIView*view2;
@property(nonatomic,strong)UIButton*bth3;
@property(nonatomic,strong)UIButton*bth4;
@property(nonatomic,strong)UITableView*table;
@property(nonatomic,strong)UITableView*table2;
@property(nonatomic,strong)FMDatabase*db;
@property(nonatomic,strong)NSString*quest;
@property(nonatomic,strong)NSString*type;
@property(nonatomic,strong)NSString*optionTitle;

@property(nonatomic,assign)int id;
@property(nonatomic,assign)NSInteger indexPathRow;
@property(nonatomic,strong)NSMutableArray *arr1;
@property(nonatomic,strong)NSMutableArray *arr2;
@property(nonatomic,strong)NSMutableArray *arr3;

@end
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation Application_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        [_hostBtn setAdjustsImageWhenHighlighted:NO];
        [_timeBtn setAdjustsImageWhenHighlighted:NO];
        [_typeBtn setAdjustsImageWhenHighlighted:NO];
     _timeNow = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFunc)userInfo:nil repeats:YES];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"YY-MM-dd HH:mm:ss"];
    
    NSString *timestamp = [formatter stringFromDate:[NSDate date]];
    
    
    _resetLabel.text= [[NSString stringWithFormat:@"上一次刷新时间:" ]stringByAppendingString:timestamp];
    
    
    _mutableArray2=[[NSMutableArray alloc]init];
    _arr1=[[NSMutableArray alloc]init];
    _arr3=[NSMutableArray arrayWithCapacity:10];
    

    
    _start.delegate=self;
    _end.delegate=self;
    _host.delegate=self;
    _keshi.delegate=self;
  
    //_table3.hidden=YES;
   
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@",[user objectForKey:@"msd"]);
    NSLog(@"%@",[user objectForKey:@"token"]);

    

    if ([user objectForKey:@"name"]) {
        _name.text=[user objectForKey:@"name"];
    }
    
    [_diaoyan2.layer setMasksToBounds:YES];
    
    [_diaoyan2.layer setBorderWidth:1.0];//边框宽度
    [_wenjuan.layer setMasksToBounds:YES];
    
    [_wenjuan.layer setBorderWidth:1.0];//边框宽度
   
    [_diaoyan2 setBackgroundColor:[UIColor orangeColor]];
    _seg.selectedSegmentIndex=0;
    //_table.hidden=YES;


  
    _arr=[[NSArray alloc]init];
    
    _table3.delegate=self;
    _table3.dataSource=self;
    

    //[self addkeshi];
    
        [self networking];
    
      NSUserDefaults *list = [NSUserDefaults standardUserDefaults];
    
   
   
    
       AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
       sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:format];
       [sessionManager.requestSerializer setValue:[user objectForKey:@"token"] forHTTPHeaderField:@"authorization"];
       
       
       NSLog(@"%@",[user objectForKey:@"name"]);

       NSDictionary *parameters =@{@"page":@1,@"page_size":@50};
       
       

       [sessionManager POST:[url stringByAppendingString:researchList] parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
           NSLog(@"%lld", downloadProgress.totalUnitCount);
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           NSLog(@"%@",responseObject);
           
           
           _arr=[[responseObject objectForKey:@"data"] objectForKey:@"list"];
           
           NSLog(@"%@",_arr);
           
           [list setObject:_arr forKey:@"list"];
           [list synchronize];
           
           [_table3 reloadData];
           
         
          
           
           
           
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           NSLog(@"%@",error);
       }];
       
      
      
       
   
   

    
    
   
    
    
    
   
//    [user removeObjectForKey:@"wenjuan"];
//    [user synchronize];
    _view1.backgroundColor=UIColorFromRGB(0x134E8F);
    
    
    if ([user objectForKey:@"english"]) {
    
    _bianhaoLb.text=@"Serial No.";
        [_hostBtn setTitle:@"Order by hospital" forState:UIControlStateNormal];
        [_typeBtn setTitle:@"Current status" forState:UIControlStateNormal];
        [_timeBtn setTitle:@"Order by start time" forState:UIControlStateNormal];
        [_zhuxiao setImage:[UIImage imageNamed:@"log out.png"] forState:UIControlStateNormal];
        [_shuaxin setImage:[UIImage imageNamed:@"refresh.png"] forState:UIControlStateNormal];
        _xiezhuLb.text=@"I want to be a survey assistant";
        
        [_sureBtn setImage:[UIImage imageNamed:@"Confirm.png"] forState:UIControlStateNormal];
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;
        _xztext.placeholder = @"Please contact the master account owner and see the survey code provided in the survey profile";
    
    }
    
}

- (void)timerFunc
{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"YY-MM-dd HH:mm:ss"];
    
    NSString *timestamp = [formatter stringFromDate:[NSDate date]];
    
    
    _timeLabel.text= timestamp;


}

-(void)addkeshi{
    _cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(366, 260, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
    [_cb setText:@"科室1"];
    //[_cb setStateChangedTarget:self selector:@selector(checkBoxViewChangedState:)];
    [self.view addSubview:_cb];
    _cb2 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(499, 260, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
    [_cb2 setText:@"科室2"];
    //[_cb2 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState2:)];
    [self.view addSubview:_cb2];
    
    _cb3 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(650, 260, 288, 50) style:kSSCheckBoxViewStyleMono checked:NO];
    [_cb3 setText:@"科室3"];
    //[_cb3 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState3:)];
    [self.view addSubview:_cb3];
    
    _cb4 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(366, 324, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
    [_cb4 setText:@"科室4"];
    //[_cb4 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState4:)];
    [self.view addSubview:_cb4];
    
    _cb5 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(499, 324, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
    [_cb5 setText:@"科室5"];
    //[_cb5 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState5:)];
    [self.view addSubview:_cb5];
    _cb6 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(650, 324, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
    [_cb6 setText:@"科室6"];
    //[_cb5 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState5:)];
    [self.view addSubview:_cb6];
    _cb7 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(366, 388, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
    [_cb7 setText:@"科室7"];
    //[_cb5 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState5:)];
    [self.view addSubview:_cb7];
    _cb8 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(499, 388, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
    [_cb8 setText:@"科室8"];
    //[_cb5 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState5:)];
    [self.view addSubview:_cb8];
    _cb9 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(650, 388, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
    [_cb9 setText:@"科室9"];
    //[_cb5 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState5:)];
    [self.view addSubview:_cb9];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    if (textField == _host) {
//        [_host resignFirstResponder];
//        [[[STPickerArea alloc]initWithDelegate:self]show];
//    }
//  
//    
//    
//    
//    if (textField == _start) {
//        [_start resignFirstResponder];
//        
//        STPickerDate *datePicker = [[STPickerDate alloc]initWithDelegate:self];
//        datePicker.tag=1;
//        
//        [datePicker show];
//    }
//    if (textField == _end) {
//        [_end resignFirstResponder];
//        
//        STPickerDate *datePicker = [[STPickerDate alloc]initWithDelegate:self];
//        [datePicker show];
//    }
//    
//}

- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@%@", province, city, area,@"医院"];
    if (pickerArea.tag==1) {
        _keshi.text=text;
    }
    else{
    
        _host.text=text;
    }
}



- (void)pickerDate:(STPickerDate *)pickerDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSString *text = [NSString stringWithFormat:@"%ld年%ld月%ld日", (long)year, (long)month, (long)day];
    if (pickerDate.tag==1) {
        _start.text = text;
    }
    else{_end.text = text;
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender {
    
    
    
    
    }
- (IBAction)into:(id)sender {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    if (_cb.checked==NO&&_cb2.checked==NO&&_cb3.checked==NO&&_cb4.checked==NO&&_cb5.checked==NO&_cb6.checked==NO&_cb7.checked==NO&_cb8.checked==NO&_cb9.checked==NO) {
        NSLog(@"没选择");
        
        UIColor *color = [UIColor cyanColor];
        
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.mode = MBProgressHUDModeText;
        _hud.labelText = @"您还没有选择科室";
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
        
        //        [user removeObjectForKey:@"array"];
        //
        //        [user synchronize];
        return;
    }


    if ( _start.text.length<=0||_host.text.length<=0||_end.text.length<=0) {
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
    else{
        _mutableArray=[NSMutableArray arrayWithCapacity:10];
        if (_cb.checked==YES) {
            NSString*xuanze=@"科室1";
            // _mutableArray=[NSMutableArray arrayWithObject:xuanze];
            [_mutableArray addObject:xuanze];
        }
        if (_cb2.checked==YES){
            
            NSString*xuanze=@"科室2";
            [_mutableArray addObject:xuanze];
            
        }
        if (_cb3.checked==YES){
            
            NSString*xuanze=@"科室3";
            [_mutableArray addObject:xuanze];
            
        }
        if (_cb4.checked==YES){
            
            NSString*xuanze=@"科室4";
            [_mutableArray addObject:xuanze];
            
        }
        if (_cb5.checked==YES){
            
            NSString*xuanze=@"科室5";
            [_mutableArray addObject:xuanze];
            
        }
        if (_cb6.checked==YES){
            
            NSString*xuanze=@"科室6";
            [_mutableArray addObject:xuanze];
            
        }
        if (_cb7.checked==YES){
            
            NSString*xuanze=@"科室7";
            [_mutableArray addObject:xuanze];
            
        }
        if (_cb8.checked==YES){
            
            NSString*xuanze=@"科室8";
            [_mutableArray addObject:xuanze];
            
        }
        if (_cb9.checked==YES){
            
            NSString*xuanze=@"科室9";
            [_mutableArray addObject:xuanze];
            
        }
     
        
        

        
        
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
        NSDictionary *parameters =@{@"hos":_host.text,@"name":[user objectForKey:@"name"],@"keshi":_mutableArray,@"start":_start.text,@"end":_end.text};
        [sessionManager POST:@"https://paqcabg.chinacloudsites.cn/BD/index.php/Mail/check/" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"%lld", downloadProgress.totalUnitCount);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@", responseObject);
            
            
            if ([[responseObject objectForKey:@"ok"] intValue]==0) {
                UIColor *color = [UIColor cyanColor];
                
                _hud = [[MBProgressHUD alloc] initWithView:self.view];
                _hud.mode = MBProgressHUDModeText;
                _hud.labelText = @"申请失败";
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

                
                UIColor *color = [UIColor cyanColor];
                _hud = [[MBProgressHUD alloc] initWithView:self.view];
                _hud.mode = MBProgressHUDModeText;
                _hud.labelText = @"审核提交中";
                _hud.labelFont = [UIFont systemFontOfSize:17];
                _hud.labelColor = color; //设置文本颜色；默认为白色
                _hud.detailsLabelText = @"请耐心等待";
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
            
            _host.text=@"";
            _start.text=@"";
            _end.text=@"";
            _cb.checked=NO;
            _cb2.checked=NO;
            _cb3.checked=NO;
            _cb4.checked=NO;
            _cb5.checked=NO;
            _cb6.checked=NO;
            _cb7.checked=NO;
            _cb8.checked=NO;
            _cb9.checked=NO;
            
            
          
            
            AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
            sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
            
            NSDictionary *parameters =@{@"flag":@"100"};
            [sessionManager GET:@"https://paqcabg.chinacloudsites.cn/jpush/examples/push_example.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                NSLog(@"%lld", downloadProgress.totalUnitCount);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"1111111");
                
                
                
                
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"%@",error);
            }];

            
        

            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        
    }
    
    
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





-(void)selected:(id)sender {
    
    NSInteger Index = self.seg.selectedSegmentIndex;
    
    NSLog(@"Index %li", (long)Index);
    
    switch (Index) {
            
        case 0:
            
           
           // _view1.hidden=YES;
           // [_seg setBackgroundColor:[UIColor orangeColor]];
            _table.hidden=YES;
            _table2.hidden=YES;
            
            
            break;
            
        case 1:{
            
            NSLog(@"2");
            //[_seg setBackgroundColor:[UIColor orangeColor]];
            _table = [[UITableView alloc]initWithFrame:CGRectMake(198, 119, 643, 604)];
            _table.delegate=self;
            _table.dataSource=self;
            
            [self.view addSubview:_table];
           
            _table2.hidden=YES;
            _table3.hidden=YES;
            AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
            sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            NSDictionary *parameters =@{@"name":[user objectForKey:@"name"]};
            
            [sessionManager POST:@"https://paqcabg.chinacloudsites.cn/BD/index.php/Mail/details/" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                NSLog(@"%lld", downloadProgress.totalUnitCount);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@",responseObject);
                _arr=[responseObject objectForKey:@"0"];
                [_table reloadData];
                
                NSLog(@"%@", _arr);
                
                
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"%@",error);
            }];

            
            break;
        }
        case 2:{
            
            
            NSLog(@"3");
            _table2 = [[UITableView alloc]initWithFrame:CGRectMake(198, 119, 643, 604)];
            _table2.delegate=self;
            _table2.dataSource=self;
            
            [self.view addSubview:_table2];
           
            _table.hidden=YES;
            _table3.hidden=YES;
            AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
            sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            NSDictionary *parameters =@{@"user":[user objectForKey:@"name"]};
            NSLog(@"%@",[user objectForKey:@"name"]);
            
            [sessionManager GET:@"https://paqcabg.chinacloudsites.cn/BD/index.php/Index/main11" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                NSLog(@"%lld", downloadProgress.totalUnitCount);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                _arr=[responseObject objectForKey:@"0"];
                [_table2 reloadData];
                
                NSLog(@"%@", _arr);
                
                
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"%@",error);
            }];

            break;
        
        
        
        }
        
        default:
            break;
            
            
        
    }
}
- (IBAction)diaoyan3:(id)sender {
    
    [_diaoyan2 setBackgroundColor:[UIColor orangeColor]];
    [_wenjuan setBackgroundColor:[UIColor clearColor]];
   
    _seg.selectedSegmentIndex=0;
    _table3.hidden=YES;
    
    _seg.hidden=NO;
    
    
}

- (IBAction)wenjuan2:(id)sender {
    [_wenjuan setBackgroundColor:[UIColor orangeColor]];
    [_diaoyan2 setBackgroundColor:[UIColor clearColor]];
//    _view2=[[UIView alloc]initWithFrame:CGRectMake(198, 64, 662, 670)];
//    
//    [_view2 setBackgroundColor:[UIColor whiteColor]];
//    [self.view addSubview:_view2];
    // _view2.hidden=NO;
    _seg.hidden=YES;
    _table3.hidden=NO;
    _table2.hidden=YES;
    _table.hidden=YES;
    _table3.delegate=self;
    _table3.dataSource=self;
//    _cb.hidden=YES;
//    _cb2.hidden=YES;
//    _cb3.hidden=YES;
//    _cb4.hidden=YES;
//    _cb5.hidden=YES;
//    _cb6.hidden=YES;
//    _cb7.hidden=YES;
//    _cb9.hidden=YES;
//    _cb8.hidden=YES;
//    _keshi.hidden=YES;
    
    [self.view addSubview:_table3];
    [_table3 reloadData];
    

    
   
   
   
}


- (UITableView *)table
{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(198, 119, 643, 604)];
        
    }
    
    return _table;
}
- (UITableView *)table2
{
    if (!_table2) {
        _table2 = [[UITableView alloc]initWithFrame:CGRectMake(198, 119, 643, 604)];
        
    }
    return _table2;
}
- (UITableView *)table3
{
    if (!_table3) {
        [self.view addSubview:_table3];
    }
    return _table3;
}


//可选实现的方法，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 1;
}

//必须实现的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//     NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([tableView isEqual:_table3]) {
        NSLog(@"table3");
        return [_arr count];
    }
    else{
    return _arr.count;
    }
    return _arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [user removeObjectForKey:@"update"];
//    [user synchronize];
   
     if ([tableView isEqual:_table]){
         
           static NSString *simpleTableIdentifier = @"Cell";
    
    MikiCell *cell = (MikiCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    

    NSLog(@"%@",[[_arr objectAtIndex:indexPath.row]objectForKey:@"number"]);
    

    if (![[_arr objectAtIndex:indexPath.row]objectForKey:@"number"]) {
       cell.title.text=@"";
    }
    else{
        cell.title.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"number"];
    
    }

    
    if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"flag"]isEqualToString:@"100"]) {
        //cell.zt.titleLabel.text=@"dsm审批中";
        [cell.zt setTitle:@"dsm审批中" forState:UIControlStateNormal];
    }
    else if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"flag"]isEqualToString:@"200"]) {
//        cell.zt.titleLabel.text=@"admin审批中";
        [cell.zt setTitle:@"admin审批中" forState:UIControlStateNormal];
    }
    else if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"flag"]isEqualToString:@"300"]) {
       [cell.zt setTitle:@"通过开始调研" forState:UIControlStateNormal];
        [cell.zt addTarget:self action:@selector(on:) forControlEvents:UIControlEventTouchUpInside];
        //cell.zt.tag=indexPath.row;
        //cell.zt.tag=indexPath.row;
        // NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSLog(@"122324324324324%@",[user objectForKey:@"update"]);
//        if ([[user objectForKey:@"update"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row] ]) {
//            
//            [cell.zt setTitle:@"已下载" forState:UIControlStateNormal];
//            
//            
//            //[cell.zt addTarget:self action:@selector(on:) forControlEvents:UIControlEventTouchUpInside];
//
//            
//        }else {
//            
//        [cell.zt setTitle:@"下载" forState:UIControlStateNormal];
//        
//            NSLog(@"%ld",(long)cell.zt.tag);
//        [cell.zt addTarget:self action:@selector(update:) forControlEvents:UIControlEventTouchUpInside];
//            
//        }
    }
    else if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"flag"]isEqualToString:@"400"]) {
        //cell.zt.titleLabel.text=@"审批驳回";
        [cell.zt setTitle:@"审批驳回" forState:UIControlStateNormal];
        
        
        
    }
    cell.hos.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"hos"];
    //cell.title.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"number"];
    NSString*start=[[NSString alloc]init];
    NSString*end=[[NSString alloc]init];
    start=[[_arr objectAtIndex:indexPath.row]objectForKey:@"start"];
    end=[[_arr objectAtIndex:indexPath.row]objectForKey:@"end"];
    cell.time.text=[start stringByAppendingString:[@"~" stringByAppendingString:end]];
    cell.keshi.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"keshi"];
    

         return cell;
     
     }
    
  else  if ([tableView isEqual:_table2]){
      
    
        static NSString *simpleTableIdentifier = @"Cell";
   
      RightTableViewCell *cell = (RightTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
      if (!cell) {
          
          NSBundle *bundle = [NSBundle mainBundle];//加载cell的xib 文件
          NSArray *objs = [bundle loadNibNamed:@"RightCell" owner:self options:nil];
          cell = [objs lastObject];
      }
        cell.hos.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"hos"];
        //cell.title.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"number"];
        NSString*start=[[NSString alloc]init];
        NSString*end=[[NSString alloc]init];         
        start=[[_arr objectAtIndex:indexPath.row]objectForKey:@"start"];
        end=[[_arr objectAtIndex:indexPath.row]objectForKey:@"end"];
        cell.time.text=[start stringByAppendingString:[@"~" stringByAppendingString:end]];
        cell.keshi.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"keshi"];
        cell.final.text=@"";
      
      if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"flag"]isEqualToString:@"100"]) {

          cell.pass.hidden=NO;
          cell.nopass.hidden=NO;
          cell.jieguo.text=@"";
          cell.pass.tag=indexPath.row;
          
          [cell.pass addTarget:self action:@selector(onClick3:) forControlEvents:UIControlEventTouchUpInside];
         
          cell.final.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"id"];

          [cell.nopass addTarget:self action:@selector(onClick4:) forControlEvents:UIControlEventTouchUpInside];

      }
     else if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"flag"]isEqualToString:@"200"]){
      
         
         
      cell.jieguo.text=@"admin审核中";
         cell.pass.hidden=YES;
         cell.nopass.hidden=YES;
      }
     else if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"flag"]isEqualToString:@"300"]){
         
         cell.jieguo.text=@"审批通过";
         cell.pass.hidden=YES;
         cell.nopass.hidden=YES;
     }
     else if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"flag"]isEqualToString:@"400"]){
         
         cell.jieguo.text=@"审批拒绝";
         cell.pass.hidden=YES;
         cell.nopass.hidden=YES;
     }
      


      return cell;
    
    }
    
  else if ([tableView isEqual:_table3]){
      
      static NSString *indentifier = @"pp";
      PPTableViewCell *cell = (PPTableViewCell *)[tableView dequeueReusableCellWithIdentifier:indentifier];
      if (!cell) {
          cell = [[PPTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier] ;
        }
      if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"status_text"]isEqualToString:@"结束"]){
      
          NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
          if ([user objectForKey:@"english"]) {
          
          cell.type.text=@"Finish";
          }
          else{
          
           cell.type.text=@"结束";
          }
      }
      else{
          
          if ([user objectForKey:@"english"]) {
              
              if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"status_text"]isEqualToString:@"尚未开始"]) {
                   cell.type.text=@"Not started yet";
              }
            else  if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"status_text"]isEqualToString:@"已过期"]) {
                  cell.type.text=@"Expired";
              }
            else{
                if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"status_text"]isEqualToString:@"进行中"]) {
                    cell.type.text=@"Execute";
                }
            
            }
              
          
          
          }else{
          
      cell.type.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"status_text"];
          }
      }
      
      
      
      
      cell.host.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"hospital"];
    //  cell.typeText.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"is_mine"];
      if ([[[_arr objectAtIndex:indexPath.row]objectForKey:@"is_mine"]intValue]==1) {
          
          cell.typeText.text=@"主";
          // 字体大小
          cell.typeText.font = [UIFont systemFontOfSize:20.f];
          cell.typeText.font = [UIFont boldSystemFontOfSize:20.f];
          cell.typeText.font = [UIFont italicSystemFontOfSize:20.f];
          // 文字颜色
          cell.typeText.textColor = [UIColor redColor];
          // 设置阴影
          cell.typeText.shadowColor = [UIColor redColor];
          //cell.typeText.shadowOffset = CGSizeMake(-2, 1)
          
          // 行数 0为自动换行
          cell.typeText.numberOfLines = 0;
          // 显示模式
          cell.typeText.lineBreakMode = NSLineBreakByWordWrapping;
         
      }else{
          
          cell.typeText.text=@"辅";
          // 字体大小
          cell.typeText.font = [UIFont systemFontOfSize:20.f];
          cell.typeText.font = [UIFont boldSystemFontOfSize:20.f];
          cell.typeText.font = [UIFont italicSystemFontOfSize:20.f];
          // 文字颜色
          cell.typeText.textColor = [UIColor blueColor];
          // 设置阴影
          cell.typeText.shadowColor = [UIColor blueColor];
          //cell.typeText.shadowOffset = CGSizeMake(-2, 1);
          // 行数 0为自动换行
          cell.typeText.numberOfLines = 0;
          // 显示模式
          cell.typeText.lineBreakMode = NSLineBreakByWordWrapping;
      }
      
      
      NSString*start=[[NSString alloc]init];
      NSString*end=[[NSString alloc]init];
      start=[[_arr objectAtIndex:indexPath.row]objectForKey:@"start"];
      end=[[_arr objectAtIndex:indexPath.row]objectForKey:@"end"];
      cell.time.text=[start stringByAppendingString:[@"~" stringByAppendingString:end]];
      cell.keshi.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"department"];
      cell.bianhao.text=[[_arr objectAtIndex:indexPath.row]objectForKey:@"assist_number"];
      
      
      
      NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
      if ([user objectForKey:@"english"]) {
         
          NSString *path = [[NSBundle mainBundle]pathForResource:@"查看详情_英文"ofType:@"png"];
          UIImage *image = [UIImage imageWithContentsOfFile:path];
          cell.image.layer.contents = (id)image.CGImage;
      
      }
//      }
      return cell;
      
      
    
  }

      return nil;
}




-(void)update:(UIButton*)sender{

    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    
    
  

    
       MikiCell * cell = (MikiCell *)[[sender superview] superview];
    NSLog(@"%ld",(long)sender.tag);
  
    self.indexPathRow=cell.zt.tag;

    if ([_arr1 containsObject:[NSString stringWithFormat:@"%ld",(long)_indexPathRow]]) {
        
    }
    else{
    
     [_arr1 addObject:[NSString stringWithFormat:@"%ld",(long)_indexPathRow]];
    }
    
    
    [_mutableArray2 addObject:[_arr objectAtIndex:_indexPathRow]];
   
    NSArray * array3 = [NSArray arrayWithArray:_mutableArray2];
    [user setObject:array3 forKey:@"zip"];
    
    NSLog(@"%@",[user objectForKey:@"zip"]);
    
     NSArray * array2 = [NSArray arrayWithArray:_arr1];
    
    
        [user setObject:array2 forKey:@"update"];
        [user synchronize];
    NSLog(@"432532342352554%@",array2);
            [cell.zt setTitle:@"打开" forState:UIControlStateNormal];
            //cell.zt.titleLabel.text=@"打开";
//            [user setBool:YES forKey:@"update"];
//            [user synchronize];
    
            NSLog(@"%ld",(long)self.indexPathRow);
            AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
            sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
            
            
            [sessionManager GET:@"https://paqcabg.chinacloudsites.cn/roche/index.php/Api/xedni" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                NSLog(@"%lld", downloadProgress.totalUnitCount);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                //_dict=[[NSMutableDictionary alloc] init];
                
                _dict=[responseObject[0]objectForKey:@"content"];
                
                
                
                
                
                
                NSLog(@"%@",_dict);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"%@",error);
            }];
            
            
    
    
    

    
    
   
  
    [_table reloadData];
    [_table3 reloadData];

    
    
    
    

}

-(void)on:(id)sender{


    [_wenjuan setBackgroundColor:[UIColor orangeColor]];
    [_diaoyan2 setBackgroundColor:[UIColor clearColor]];
    //    _view2=[[UIView alloc]initWithFrame:CGRectMake(198, 64, 662, 670)];
    //
    //    [_view2 setBackgroundColor:[UIColor whiteColor]];
    //    [self.view addSubview:_view2];
    // _view2.hidden=NO;
    _seg.hidden=YES;
    _table3.hidden=NO;
    _table2.hidden=YES;
    _table.hidden=YES;
    _table3.delegate=self;
    _table3.dataSource=self;
    for(int i = 0;i<_arr.count;i++){
        if ([[[_arr objectAtIndex:i] objectForKey:@"flag"] isEqualToString:@"300"]) {
            [_arr1 addObject:[_arr objectAtIndex:i]];
        }
        
    }
     NSLog(@"%@",_arr);
    NSLog(@"%@",_arr1);
    NSSet *set = [NSSet setWithArray:_arr1];
  
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
     [user setObject:[set allObjects] forKey:@"zip"];
    [user synchronize];
    NSLog(@"%@",[set allObjects]);
    
    [self.view addSubview:_table3];
    
    [_table3 reloadData];
    

}
-(void)onClick3:(id)sender{

    
    
    RightTableViewCell * cell = (RightTableViewCell *)[[sender superview] superview];
    NSLog(@"%ld",(long)cell.pass.tag);
    NSInteger tt=cell.pass.tag;
    cell.jieguo.text=@"已通过";
    cell.pass.hidden=YES;
    cell.nopass.hidden=YES;
    NSLog(@"%@",cell.final.text);
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSDictionary *parameters =@{@"user":[user objectForKey:@"name"],@"id":cell.final.text};
    NSLog(@"%@",parameters);
    
    [sessionManager GET:@"https://paqcabg.chinacloudsites.cn/BD/index.php/Index/pass1" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
        NSDictionary *parameters =@{@"flag":@"300"};
        [sessionManager GET:@"https://paqcabg.chinacloudsites.cn/jpush/examples/push_example.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"%lld", downloadProgress.totalUnitCount);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"1111111");
            
            
            
            
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];

        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
   

    
    
    
    

    

}
-(void)onClick4:(id)sender{
    RightTableViewCell * cell = (RightTableViewCell *)[[sender superview]  superview];
    
    cell.jieguo.text=@"已拒绝";
    cell.pass.hidden=YES;
    cell.nopass.hidden=YES;
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSDictionary *parameters =@{@"user":[user objectForKey:@"name"],@"id":cell.final.text};
    NSLog(@"%@",[user objectForKey:@"name"]);
    
    [sessionManager GET:@"https://paqcabg.chinacloudsites.cn/BD/index.php/Index/nopass1" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
        NSDictionary *parameters =@{@"flag":@"400"};
        [sessionManager GET:@"https://paqcabg.chinacloudsites.cn/jpush/examples/push_example.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"%lld", downloadProgress.totalUnitCount);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"1111111");
            
            
            
            
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];

        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([tableView isEqual:_table3]) {
        
           NSLog(@"跳转了");
    }
     NSLog(@"%@",[[_arr objectAtIndex:indexPath.row]objectForKey:@"time"]);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [self networking];

    
    
     NSIndexPath *selectIndexPath = [self.table3 indexPathForSelectedRow];
    
       
    
   // PPTableViewCell * cell = (PPTableViewCell *)[[sender superview]  superview];
   // NSLog(@"%@",cell.time.text[selectIndexPath);

    if ([segue.identifier isEqualToString:@"push"]) {
        // segue.destinationViewController：获取连线时所指的界面（VC）
       
        
        
        InfoViewController *receive = segue.destinationViewController;
        
//        if ([[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"is_mine"] isEqualToString:@"1"]) {
//            receive.diaoyanrenyuan=@"1";
//        }
//        else{
//
//            receive.diaoyanrenyuan=@"2";
//        }
        
        receive.diaoyanrenyuan=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"is_mine"];

        receive.name=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"hospital"];
         receive.zhuangtai=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"status_text"];
        receive.research_id=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"research_id"];
        
        receive.startStr=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"start"];
        receive.endStr=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"end"];
        receive.qitaStr=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"remark"];
        receive.numberStr=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"assist_number"];
        receive.numberStr2=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"nurse_qrcode_url"];
        receive.bianhao=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"bd_number"];

        
//        _arr3=[NSMutableArray arrayWithObjects:[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"keshi"],@"其他" ,nil];
        
       
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if ([user objectForKey:@"english"]) {
            _keshiStr2=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"keshi"];
         
            _keshiStr2=[_keshiStr2 stringByReplacingOccurrencesOfString:@"重症"withString:@"ICU"];
            _keshiStr2=[_keshiStr2 stringByReplacingOccurrencesOfString:@"急症"withString:@"Emergency"];
            _keshiStr2=[_keshiStr2 stringByReplacingOccurrencesOfString:@"呼吸"withString:@"Respiratory"];
            _keshiStr2=[_keshiStr2 stringByReplacingOccurrencesOfString:@"麻醉"withString:@"Anesthesiology"];
            receive.keshiStr=_keshiStr2;
            
            NSLog(@"%@",receive.keshiStr);
            
            
        }
        else{
        
        receive.keshiStr=[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"keshi"];
        }
       
       
       
        
        NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
        [keshi setObject:[[_arr objectAtIndex:selectIndexPath.row]objectForKey:@"department"] forKey:@"keshi"];
        [keshi synchronize];
        
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 76;
}
- (IBAction)dele:(id)sender {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user removeObjectForKey:@"update"];
        [user removeObjectForKey:@"zip"];
        [user removeObjectForKey:@"wenj uan"];
        [user synchronize];
        [_table reloadData];
        [_table3 reloadData];
}
- (IBAction)sele:(id)sender {
    NSInteger Index = _sel2.selectedSegmentIndex;
    
    switch (Index) {
            
        case 0:{
            
            NSLog(@"%@",_arr);
            NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES]];
            NSArray *sortedArr = [_arr sortedArrayUsingDescriptors:sortDesc];
            
            _arr=[NSMutableArray arrayWithArray:sortedArr];
             NSLog(@"排序后的数组:%@",_arr);
            [_table reloadData];
            
            break;
        }
        case 1:{
            
            NSLog(@"hahahahaha");
            
            NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"time" ascending:NO]];
            NSArray *sortedArr = [_arr sortedArrayUsingDescriptors:sortDesc];
            
            _arr=[NSMutableArray arrayWithArray:sortedArr];
            NSLog(@"排序后的数组:%@",_arr);
            [_table reloadData];
            break;
        }
        case 2:{    
            
             NSLog(@"%@",_arr);
            
            NSSortDescriptor *flag=[[NSSortDescriptor alloc]initWithKey:@"flag" ascending:NO];
            
            NSSortDescriptor *time=[[NSSortDescriptor alloc]initWithKey:@"time" ascending:YES];
            NSArray *elementarr=[NSArray arrayWithObjects:flag,time, nil];
            
            
            
            NSArray *sortArray=[_arr sortedArrayUsingDescriptors:elementarr];
            
            _arr=[NSMutableArray arrayWithArray:sortArray];
            NSLog(@"排序后的数组:%@",_arr);
            [_table reloadData];
            
           
            

        
        
            break;
        }
            default:
            break;

    }


}

- (IBAction)hostPaiXu:(id)sender {
    
   
    
    if (_hostBtn.selected==YES) {
        [_hostBtn setSelected:NO];
        [_hostBtn setBackgroundColor:[UIColor clearColor]];
       
        NSLog(@"点击了！！！");
        NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"hos" ascending:YES]];
        NSArray *sortedArr = [_arr sortedArrayUsingDescriptors:sortDesc];
        
        _arr=[NSMutableArray arrayWithArray:sortedArr];
        NSLog(@"排序后的数组:%@",_arr);
        [_table3 reloadData];
        [_img1 setImage:[UIImage imageNamed:@"12312321.png"]];
           [_img2 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
           [_img3 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        

        
    }
    else{
        
    
        [_hostBtn setSelected:YES];
        NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"hos" ascending:NO]];
        NSArray *sortedArr = [_arr sortedArrayUsingDescriptors:sortDesc];
        
        _arr=[NSMutableArray arrayWithArray:sortedArr];
        NSLog(@"排序后的数组:%@",_arr);
        [_table3 reloadData];
        
         [_img1 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
           [_img2 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
           [_img3 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        
        NSLog(@"没点击了！！！！");
    
    }
    
}

- (IBAction)timePaiXu:(id)sender {
    
    if (_timeBtn.selected==YES) {
        [_timeBtn setSelected:NO];
        NSLog(@"点击了！！！");
        NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"start" ascending:YES]];
        NSArray *sortedArr = [_arr sortedArrayUsingDescriptors:sortDesc];
        
        _arr=[NSMutableArray arrayWithArray:sortedArr];
        NSLog(@"排序后的数组:%@",_arr);
        [_table3 reloadData];
        [_img2 setImage:[UIImage imageNamed:@"12312321.png"]];
        [_img1 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        [_img3 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        
    }
    else{
        
        
        [_timeBtn setSelected:YES];
        NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"start" ascending:NO]];
        NSArray *sortedArr = [_arr sortedArrayUsingDescriptors:sortDesc];
        
        _arr=[NSMutableArray arrayWithArray:sortedArr];
        NSLog(@"排序后的数组:%@",_arr);
        [_table3 reloadData];
        
        NSLog(@"没点击了！！！！");
         [_img2 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        [_img1 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        [_img3 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
    }

}

- (IBAction)typePaiXu:(id)sender {
    
    if (_typeBtn.selected==YES) {
        [_typeBtn setSelected:NO];
        NSLog(@"点击了！！！");
        NSSortDescriptor *flag=[[NSSortDescriptor alloc]initWithKey:@"end" ascending:NO];
        
        NSSortDescriptor *time=[[NSSortDescriptor alloc]initWithKey:@"time" ascending:YES];
        NSArray *elementarr=[NSArray arrayWithObjects:flag,time, nil];
        
        
        
        NSArray *sortArray=[_arr sortedArrayUsingDescriptors:elementarr];
        
        _arr=[NSMutableArray arrayWithArray:sortArray];
        NSLog(@"排序后的数组:%@",_arr);
        [_table3 reloadData];
        [_img3 setImage:[UIImage imageNamed:@"12312321.png"]];
        [_img2 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        [_img1 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        
    }
    else{
        
        
        [_typeBtn setSelected:YES];
        NSSortDescriptor *flag=[[NSSortDescriptor alloc]initWithKey:@"end" ascending:YES];
        
        NSSortDescriptor *time=[[NSSortDescriptor alloc]initWithKey:@"time" ascending:YES];
        NSArray *elementarr=[NSArray arrayWithObjects:flag,time, nil];
        
        
        
        NSArray *sortArray=[_arr sortedArrayUsingDescriptors:elementarr];
        
        _arr=[NSMutableArray arrayWithArray:sortArray];
        NSLog(@"排序后的数组:%@",_arr);
        [_table3 reloadData];
         [_img3 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        [_img2 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        [_img1 setImage:[UIImage imageNamed:@"矢量智能对象.png"]];
        NSLog(@"没点击了！！！！");
        
    }

    
    
}
- (IBAction)shuaxin:(id)sender {
    
    
    [self networking];
    
    NSUserDefaults *list = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];


    
      AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
                    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:format];
                    [sessionManager.requestSerializer setValue:[user objectForKey:@"token"] forHTTPHeaderField:@"authorization"];
                    
                    
                    NSLog(@"%@",[user objectForKey:@"name"]);

                    NSDictionary *parameters =@{@"page":@1,@"page_size":@50};
                    
                    

                    [sessionManager POST:[url stringByAppendingString:researchList] parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                        NSLog(@"%lld", downloadProgress.totalUnitCount);
                    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        NSLog(@"%@",responseObject);
                        
                        
                        _arr=[[responseObject objectForKey:@"data"] objectForKey:@"list"];
                        
                         NSLog(@"%@",_arr);
                       
                        [list setObject:_arr forKey:@"list"];
                        [list synchronize];
                        
                        [_table3 reloadData];
                        
                      
                       
                        
                        
                        
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        NSLog(@"%@",error);
                    }];
    
    
   

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
            self.view.frame = CGRectMake(self.view.frame.origin.x+215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x-215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-390 , self.view.frame.size.width, self.view.frame.size.height);
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
            self.view.frame = CGRectMake(self.view.frame.origin.x-215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x+215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }
    else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+390 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}



- (IBAction)xzPost:(id)sender {
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [self networking];
    

    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
   sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:format];
      [sessionManager.requestSerializer setValue:[user objectForKey:@"token"] forHTTPHeaderField:@"authorization"];
    
    NSDictionary *parameters =@{@"assist_number":_xztext.text};
    NSLog(@"%@",parameters);
    
    [sessionManager POST:[url stringByAppendingString:assistanceResearch] parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
      //  NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

                UIColor *color = [UIColor cyanColor];
                           
               _hud = [[MBProgressHUD alloc] initWithView:self.view];
               _hud.mode = MBProgressHUDModeText;
             
                _hud.labelText = [responseObject objectForKey:@"msg"];
               
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
    
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

    
}

- (IBAction)zhuxiaoAct:(id)sender {
    
    
    [self networking];

    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];

    
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:format];
    //sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
       [sessionManager.requestSerializer setValue:[user objectForKey:@"token"] forHTTPHeaderField:@"authorization"];

    
    [sessionManager POST:[url stringByAppendingString:loginOut] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      
        
        
        [self performSegueWithIdentifier:@"modal" sender:self];

        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
        
    }];
    
    
    
}


-(void)networking{
    
    
    NSUserDefaults *list = [NSUserDefaults standardUserDefaults];

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
                
                _arr=[list objectForKey:@"list"];
                              
                               NSLog(@"%@",_arr);
                   
                              [_table3 reloadData];
                
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
                


                 _arr=[list objectForKey:@"list"];
                 
                  NSLog(@"%@",_arr);
      
                 [_table3 reloadData];
                
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
                _arr=[list objectForKey:@"list"];
                              
                               NSLog(@"%@",_arr);
                   
                              [_table3 reloadData];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"WiFi");
                _arr=[list objectForKey:@"list"];
                              
                               NSLog(@"%@",_arr);
                   
                              [_table3 reloadData];

            }
                
                break;
            default:
                break;
        }
    }];
}
@end

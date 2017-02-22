//
//  InfoViewController.m
//  login
//
//  Created by 茶茶漾 on 16/7/29.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "InfoViewController.h"
#import "QuestionViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "WenJuanViewController.h"
#import "OnePageViewController.h"

#import <QuartzCore/QuartzCore.h>
@interface InfoViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
UITableViewCellEditingStyle _editingStyle;
    NSMutableArray *listArray;
}
@property (weak, nonatomic) IBOutlet UIImageView *erweimaimg;
- (IBAction)postPhoto:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *hushiText;
- (IBAction)over:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (strong, nonatomic) MBProgressHUD *hud;
@property(nonatomic,strong)NSMutableArray *mutableArray;
@property(nonatomic,strong)NSMutableArray *mutableArray2;
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,strong)NSMutableArray *tagArr;
@property(nonatomic,assign)NSInteger add;
@property(nonatomic,assign)NSInteger add2;
@property(nonatomic,assign)NSInteger add3;
@property(nonatomic,strong)SSCheckBoxView *cb;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic,strong)UITextField*textField;
@end
#define INSERT    @"insert"

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.view setBackgroundColor:[UIColor whiteColor]];
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _thisArr=[[NSMutableArray alloc] init];
  _thisArr2=[[NSMutableArray alloc] init];
   
    _qitaArr=[[NSMutableArray alloc] init];
    
    
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
//            [button setTitle:@"返回" forState:UIControlStateNormal];
//           [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
//  
//           self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    self.navigationItem.backBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@"返回"
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:nil
                                                                          action:nil];
    
    
   
//    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
//    backbutton.title = @"返回";
//    self.navigationItem.backBarButtonItem = backbutton;
    
    
    
  NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        _hostLb.text=@"Hospital";
        _startDate.text=@"Time started";
        _endDate.text=@"Time ended";
        _qitaLb.text=@"Other information";
        
        _fuzhuNumberLb.text=@"Survey assistant code";
        _keshiDiaoyan.text=@"Within-department survey";
        _chooseKeshi.text=@"Select the department";
        _wanchengLb.text=@"Completed:";
        _hushiErweimaLb.text=@"Nurse survey 2D code";
        _keshiDiaoyanLb.text=@"of department survey questionnaires";
        _hushiDiaoyanLb.text=@"of nurse survey questionnaires";
        _shiyanshiLb.text=@"of laboratory survey questionnaires";
        
        [_zhuxiao setImage:[UIImage imageNamed:@"log out.png"] forState:UIControlStateNormal];
        [_shuaxin setImage:[UIImage imageNamed:@"refresh.png"] forState:UIControlStateNormal];
    
//        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
//        backbutton.title = @"Return";
//        self.navigationItem.backBarButtonItem = backbutton;
      
      
    
        
        _lb1.text=@"View the survey report";
        _lb2.text=@"Upload / Synchronize the survey questionnaire";
        _lb3.text=@"End the survey";
        [_generateBtn setImage:[UIImage imageNamed:@"生成调研-英文.png"] forState:UIControlStateNormal];
        
//        self.navigationItem.backBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@"<Return"
//                                                                               style:UIBarButtonItemStylePlain
//                                                                              target:nil
//                                                                              action:nil];

        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;
    }
    
    
    // 1.创建过滤器
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.恢复默认
    [filter setDefaults];
    // 3.给过滤器添加数据(正则表达式/账号和密码)
    NSString *dataString = [@"http://netkq.webbsn.com/BD/admin.php/Nurse/index/number/" stringByAppendingString:_numberStr2];
    NSLog(@"%@",dataString);
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    // 4.获取输出的二维码
    CIImage *outputImage = [filter outputImage];
    // 5.将CIImage转换成UIImage，并放大显示
    _erweimaimg.image = [self createNonInterpolatedUIImageFormCIImage:outputImage withSize:200];

    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters =@{@"number":_numberStr2};
    NSLog(@"%@",parameters);
    
    [sessionManager POST:@"http://netkq.webbsn.com/BD/admin.php/Nurse/nursecount" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        //  NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject );
        
        
        if ([user objectForKey:@"english"]) {
             _hushiText.text=[[responseObject objectForKey:@"0"] stringByAppendingString:@"copies"];
        }
        else{
        _hushiText.text=[[responseObject objectForKey:@"0"] stringByAppendingString:@"份"];
        }
        
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"%@",error);
     }];
    
    
    _chooseArray1=[[NSMutableArray alloc] init];
   
    _view1.layer.masksToBounds = YES;
    _view1.layer.cornerRadius = 10.0;
    _view1.layer.borderWidth = 1.0;
    _view1.layer.borderColor = [[UIColor whiteColor] CGColor];
    _view2.layer.masksToBounds = YES;
    _view2.layer.cornerRadius = 10.0;
    _view2.layer.borderWidth = 1.0;
    _view2.layer.borderColor = [[UIColor whiteColor] CGColor];
    _view3.layer.masksToBounds = YES;
    _view3.layer.cornerRadius = 10.0;
    _view3.layer.borderWidth = 1.0;
    _view3.layer.borderColor = [[UIColor whiteColor] CGColor];
    _view4.layer.masksToBounds = YES;
    _view4.layer.cornerRadius = 10.0;
    _view4.layer.borderWidth = 1.0;
    _view4.layer.borderColor = [[UIColor whiteColor] CGColor];
     _erweima.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1475210628.png"]];
    
    
     _keshi.text=_keshiStr;
    
    _tagArr=[[NSMutableArray alloc] init];
    if (_keshiStr) {
        _a =  _keshiStr ;
    }
 
    
    
    NSArray *arr = [_a componentsSeparatedByString:@"-"];
    NSMutableArray*arr2=[[NSMutableArray alloc] init];
    arr2=[NSMutableArray arrayWithArray:arr];
    
    NSLog(@"%@",_keshiStr);
    
    

    
   // NSMutableArray*arr2=[[NSMutableArray alloc] initWithObjects:@"ICU", nil];
    if ([user objectForKey:@"english"]) {
         [arr2 addObject:@"Other"];

    }
    else{
    [arr2 addObject:@"其他"];
        
    }
    NSUserDefaults *keshiArr = [NSUserDefaults standardUserDefaults];
    NSArray*arrKeshi=[NSArray arrayWithArray:arr2];
    [keshiArr setObject:arrKeshi forKey:@"keshiArr"];
    [keshiArr synchronize];
    
    
    NSLog(@"%@",arr2);
    for (int i=0; i<arr2.count; i++) {
        _cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(10, 55+i*45, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
         NSString *a3 = [arr2 objectAtIndex:i];
        [_cb setText:a3];
        
        
        [_cb setStateChangedTarget:self selector:@selector(checkBoxViewChangedState:)];
        
        [_view3 addSubview:_cb];
        
        _cb.tag=i;
       NSNumber *number =[NSNumber numberWithInt:i];
       
        [_tagArr addObject:number];
        if ([[arr2 objectAtIndex:i]isEqualToString:@"其他"]||[[arr2 objectAtIndex:i]isEqualToString:@"Other"]) {
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(125, 62+i*45, 100, 30)];
            // 设置UITextField的样式
            _textField.delegate=self;
            _textField.borderStyle = UITextBorderStyleRoundedRect;
            
            // 文字对齐方式
            _textField.textAlignment = NSTextAlignmentCenter;
            // 文字颜色
            _textField.textColor = [UIColor blackColor];
            // 提示信息内容
            //_textField.placeholder = @"请输入科室名称";
            // 字体
            
            _textField.font = [UIFont fontWithName:@"Arial" size:20.0];
            
            
            [_view3 addSubview: _textField];
            _textField.enabled=NO;
            _textField.delegate=self;

        }
        
        [_chooseArray1 addObject:_cb];
        
    }
    
    
    NSLog(@"%@",_bianhao);
   // _bianhao2=[_bianhao copy];
   
    _mutableArray= [@[@"开始调研"] mutableCopy];
    _mutableArray2=[NSMutableArray arrayWithCapacity:10];
    
   
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:INSERT];
    _host.text=_name;
    _host.lineBreakMode = UILineBreakModeWordWrap;
    _host.numberOfLines = 0;
   
    _start.text=_startStr;
    _end.text=_endStr;
    _qita.text=_qitaStr;
    _numberLb.text=_numberStr;
    [_numberLb setTextColor:UIColorFromRGB(0x1863B0)];
  
     NSUserDefaults *shiyanshi = [NSUserDefaults standardUserDefaults];
    [user setInteger:1 forKey:@"int"];
    //[user removeObjectForKey:@"diaoyan"];
    [user synchronize];
 
    NSLog(@"%@",_zhuangtai);
    
    NSLog(@"%@",_diaoyanrenyuan);
    
    
    
    
//    NSLog(@"%@",[[[[user objectForKey:@"wenjuan"]objectAtIndex:0]objectAtIndex:65]valueForKey:@"bianhao"] );
//    
//    for (int i=0; i<[[user objectForKey:@"wenjuan"]  count]; i++) {
//        if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[user objectForKey:@"wenjuan"]objectAtIndex:i]objectAtIndex:65]valueForKey:@"bianhao"]]]) {
//           
//            _add++;
//        }
//        NSLog(@"%@",[NSString stringWithFormat:@"%@",[[[[user valueForKey:@"wenjuan"]objectAtIndex:i]objectAtIndex:65]valueForKey:@"bianhao"]]);
//
//        
//    }
//    NSLog(@"add=========%ld",(long)_add);
    //NSString*b=[NSString stringWithFormat:@"%lu",[[user objectForKey:@"diaoyan"] count]];
    
    
   
    //_add=2;
    _add=0;
    _add2=0;
    _add3=0;

    
    
    
    for (int i=0; i<[[user objectForKey:@"diaoyan"]  count]; i++) {
        
        for (int j=0; j<[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
            
//            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
            
            if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
                
                ++_add;
                
                //NSLog(@"%@",[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0]);
                
                [_thisArr addObject:[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0]];
                
               
            }
            
        }
        
    }
    
    NSLog(@"%ld",(long)_add);
   
   
    
    
    for (int i=0; i<[[shiyanshi objectForKey:@"shiyanshi"]  count]; i++) {
        
        for (int j=0; j<[[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
            
            //            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
            
            if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
                
              ++_add2;
                
                //NSLog(@"%@",[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0]);
                
                [_thisArr2 addObject:[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0]];
                
                
               
            }
            
        }
        
    }

    NSLog(@"%@",_thisArr2);
   
    NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
    
    [photoList setInteger:_add forKey:@"photoList"];
    [photoList setInteger:_add2 forKey:@"photoList2"];
    [photoList synchronize];
   
    if ([user objectForKey:@"english"]) {
    _fen.text=[[NSString stringWithFormat:@"%ld",(long)_add ] stringByAppendingString:@"copies"];
    _shiyanLb.text=[[NSString stringWithFormat:@"%ld",(long)_add2 ] stringByAppendingString:@"copies"];
    }else{
        _fen.text=[[NSString stringWithFormat:@"%ld",(long)_add ] stringByAppendingString:@"份"];
        _shiyanLb.text=[[NSString stringWithFormat:@"%ld",(long)_add2 ] stringByAppendingString:@"份"];
    
    }
    NSLog(@"%@",_fen.text);
    
    NSLog(@"%@",_bianhao);
        
//        NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:i] objectAtIndex:j]  );
   
    if ([user objectForKey:@"name"]) {
        _nameLb.text=[user objectForKey:@"name"];
    }
    
    
    
    
    if (_add==0&&_add2==0) {
        [self doSomething];
    }

    
   //NSLog(@"%@",[user objectForKey:@"diaoyan"]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];}
- (void)timerFunc
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"YY-MM-dd HH:mm:ss"];
    
    NSString *timestamp = [formatter stringFromDate:[NSDate date]];
    
    
    _timeLabel.text= timestamp;
    
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)checkBoxViewChangedState:(SSCheckBoxView*)cbv{


    
    if(_tmpBtn== cbv) {
        //上次点击过的按钮，不做处理
    } else{
        //本次点击的按钮设为红色
        cbv.checked=YES;
        //将上次点击过的按钮设为黑色
        _tmpBtn.checked=NO;
    }
    _tmpBtn= cbv;
    
    
    
    if ((cbv.checked==YES&&[cbv.textLabel.text isEqualToString:@"其他"])||(cbv.checked==YES&&[cbv.textLabel.text isEqualToString:@"Other"])) {
        
        _textField.enabled=YES;
        _chooseStr=_textField.text;
        
    }
        
    
    else if((cbv.checked==NO&&[cbv.textLabel.text isEqualToString:@"其他"])||(cbv.checked==NO&&[cbv.textLabel.text isEqualToString:@"Other"])){
        _textField.enabled=NO;
        _textField.text=@"";
        _chooseStr=@"";

    }
    else{
    
        _textField.enabled=NO;
        _textField.text=@"";
    }
    NSLog(@"%@",_chooseStr);
    
    


}
#pragma mark - Table view data source
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   [self performSegueWithIdentifier:@"go" sender:self];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_mutableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:INSERT forIndexPath:indexPath];
    cell.textLabel.text = _mutableArray[indexPath.row];
    return cell;
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    NSString*str=[[NSString alloc] init];
    NSString*str2=[[NSString alloc] init];
    NSString*str3=[[NSString alloc] init];
    
   
    str=[NSString stringWithFormat:@"%@",@"问卷"];
    str2=[NSString stringWithFormat:@"%ld",(long)_add++];
    NSLog(@"%@",str2);
    str3=[str stringByAppendingString:str2];
    [_mutableArray insertObject:str3 atIndex:indexPath.row];
    [_table insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

//    if ([segue.identifier isEqualToString:@"go"]) {
//    
//        WenJuanViewController *receive = [segue destinationViewController];
//        receive.keshiLb=_chooseStr;
//        NSLog(@"%@",receive.keshiLb);
//    
//    }


}

- (IBAction)insert:(id)sender {
    
    _editingStyle = UITableViewCellEditingStyleInsert;
    
    BOOL isEditing = _table.isEditing;
    // 开启\关闭编辑模式
    [_table setEditing:!isEditing animated:YES];
}



- (void) doSomething
{
    
    
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *shiyanshi = [NSUserDefaults standardUserDefaults];
    
    
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters =@{@"number":_numberStr2};
    //        NSLog(@"%@",_numberStr2);
    NSLog(@"%@",[user objectForKey:@"diaoyan"]);
    
    
    [sessionManager POST:@"http://netkq.webbsn.com/BD/admin.php/Survey/tongbu" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        //  NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _add=0;
        NSLog(@"%@",responseObject);
        
        
      
        NSMutableArray*arr=[[NSMutableArray alloc] initWithArray:responseObject];
        NSMutableArray*arr2=[[NSMutableArray alloc] init];
        
        NSLog(@"%@",arr);
        
        
        
        for (int i=0; i<arr.count; i++) {
            
            for (int j=0; j<[[arr objectAtIndex:i] count]; j++) {
                
                //NSLog(@"%@",[arr objectAtIndex:i]);
                // NSLog(@"%@",[[arr objectAtIndex:i] objectAtIndex:j]);
                
                
                for (NSString*key in [[[arr objectAtIndex:i] objectAtIndex:j] allKeys]) {
                    
                    NSArray* arr3=[[arr objectAtIndex:i] objectAtIndex:j][key];
                    
                    // NSLog(@"%@",arr3);
                    
                    [arr2 addObject:arr3 ];
                    
                }
                
                
            }
            
            
        }
        NSArray*arr4=[NSArray arrayWithArray:arr2];
        
        NSLog(@"%@",arr4);
        
        
       
        
        [user setObject:arr4 forKey:@"diaoyan"];
        [user synchronize];
        
        NSLog(@"%@",[user objectForKey:@"diaoyan"]);
        
        
        
        for (int i=0; i<[[user objectForKey:@"diaoyan"]  count]; i++) {
            
            for (int j=0; j<[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
                
                //            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
                
                
                
                if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
                    
                    ++_add;
                    
                    
                    
                    
                }
                
            }
            
        }
        
        NSLog(@"%ld",(long)_add);
        
        
        if ([user objectForKey:@"english"]) {
            
             _fen.text=[[NSString stringWithFormat:@"%ld",(long)_add ] stringByAppendingString:@"copies"];
            
        }
        else{
        _fen.text=[[NSString stringWithFormat:@"%ld",(long)_add ] stringByAppendingString:@"份"];
        
        }
        
   
        
        
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
    AFHTTPSessionManager *sessionManager2 = [AFHTTPSessionManager manager];
    sessionManager2.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters2 =@{@"number":_numberStr2};
    //        NSLog(@"%@",_numberStr2);
    NSLog(@"%@",[shiyanshi objectForKey:@"shiyanshi"]);
    
    [sessionManager2 POST:@"http://netkq.webbsn.com/BD/admin.php/Survey/tongbusys" parameters:parameters2 progress:^(NSProgress * _Nonnull downloadProgress) {
        //  NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
      
        _add2=0;
        
//        if (![responseObject containsObject:@"<null>"]) {
        
            NSMutableArray*arr=[[NSMutableArray alloc] initWithArray:responseObject];
            //  [arr removeLastObject];
            
            NSMutableArray*arr2=[[NSMutableArray alloc] init];
            
            NSLog(@"%@",arr);
            
            
            for (int i=0; i<arr.count; i++) {
                
                for (int j=0; j<[[arr objectAtIndex:i] count]; j++) {
                    
                    //NSLog(@"%@",[arr objectAtIndex:i]);
                    // NSLog(@"%@",[[arr objectAtIndex:i] objectAtIndex:j]);
                    
                    
                    for (NSString*key in [[[arr objectAtIndex:i] objectAtIndex:j] allKeys]) {
                        
                        NSArray* arr3=[[arr objectAtIndex:i] objectAtIndex:j][key];
                        
                        // NSLog(@"%@",arr3);
                        
                        [arr2 addObject:arr3 ];
                        
                    }
                    
                    
                }
                
                
            }
            NSArray*arr4=[NSArray arrayWithArray:arr2];
            
            [shiyanshi setObject:arr4 forKey:@"shiyanshi"];
            [shiyanshi synchronize];
            
            
            for (int i=0; i<[[shiyanshi objectForKey:@"shiyanshi"]  count]; i++) {
                
                for (int j=0; j<[[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
                    
                    //            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
                    
                    if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
                        
                        ++_add2;
                        
                        
                        
                        
                    }
                    
                }
                
            }
        NSLog(@"%ld",(long)_add2);

        
            //             _shiyanLb.text=[[NSString stringWithFormat:@"%ld",(long)[[shiyanshi objectForKey:@"shiyanshi"]count] ] stringByAppendingString:@"份"];
            //
            //            _add2=[[shiyanshi objectForKey:@"shiyanshi"] count];
        
        
         if ([user objectForKey:@"english"]) {
            _shiyanLb.text=[[NSString stringWithFormat:@"%ld",(long)_add2 ] stringByAppendingString:@"copies"];
             
         }
         else{
         
            _shiyanLb.text=[[NSString stringWithFormat:@"%ld",(long)_add2 ] stringByAppendingString:@"份"];
         }
       // }

        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

    
}


- (IBAction)post:(id)sender {
    
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *shiyanshi = [NSUserDefaults standardUserDefaults];
    
    //[self doSomething];
 
    
// if (![shiyanshi objectForKey:@"shiyanshi"]&&![user objectForKey:@"diaoyan"]) {
 
    
    
    
    
    

    
    
    
     // return;
//}
    
    


    
    

//    if (_add==0) {
//        
//        
//        UIColor *color = [UIColor cyanColor];
//        
//        _hud = [[MBProgressHUD alloc] initWithView:self.view];
//        _hud.mode = MBProgressHUDModeText;
//        
//        
//        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//        if (![user objectForKey:@"english"]) {
//           _hud.labelText = @"您还没有完成至少一份问卷";
//        }else{
//            _hud.labelText = @"You have not completed at least one questionnaire";
//            
//        }
//        
//        
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
//    else
//        
//        if (_add2==0) {
//            
//            
//            UIColor *color = [UIColor cyanColor];
//            
//            _hud = [[MBProgressHUD alloc] initWithView:self.view];
//            _hud.mode = MBProgressHUDModeText;
//            
//            
//            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//            if (![user objectForKey:@"english"]) {
//                _hud.labelText = @"您还没有完成至少一份实验室问卷";
//            }else{
//                _hud.labelText = @"You have not completed at least one lab questionnaire";
//                
//            }
//            
//            _hud.labelFont = [UIFont systemFontOfSize:17];
//            _hud.labelColor = color; //设置文本颜色；默认为白色
//            _hud.detailsLabelText = @"^_^";
//            _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
//            _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
//            [self.view addSubview:_hud];
//            
//            [_hud showAnimated:YES
//           whileExecutingBlock:^{
//               [self taskOfText];
//           } completionBlock:^{
//               NSLog(@"showHUDByText 执行完成");
//           }];
//            
//            return;
//            
//        }
    
//        else{
    
            NSLog(@"%@",[user objectForKey:@"shiyanshi"]);
            
            
            NSMutableArray*allArr2=[[NSMutableArray alloc] init];
            
            
            NSMutableArray*bianhaoArray2=[[NSMutableArray alloc]init];
            for (int i=0; i<[[user objectForKey:@"shiyanshi"]  count]; i++) {
                
                for (int j=0; j<[[[[user objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
                    
                    //            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
                    
                    
                    
                    if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[user objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
                        
                        [bianhaoArray2 addObject:[[user objectForKey:@"shiyanshi"] objectAtIndex:i] ];
                        
                        
                        
                    }
                    
                }
                
            }
            
            NSLog(@"%@",bianhaoArray2);
            
            
            
            
            
            
            
            NSEnumerator *enumerator = [bianhaoArray2 reverseObjectEnumerator];
            
            NSArray*array=[[NSArray alloc] initWithArray:[enumerator allObjects]];
            NSLog(@"%@",[enumerator allObjects]);
            
            int i=0;
            
            
            for (NSArray*arr in array) {
                
                NSDictionary*dict=@{[NSString stringWithFormat:@"%d",++i]:arr};
                
                [allArr2 addObject:dict];
                
            }
            NSLog(@"%@",allArr2);
            
            
            
            AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
            sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
            sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
            
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:allArr2 options:NSJSONWritingPrettyPrinted error:nil];
            
            NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            //        NSDictionary *parameters=[[NSDictionary alloc]init];
            //        [parameters setValue:[NSString JSONStringWithNSDictionary:self.orderModel.cartCids] forKey:@"cids"];
            //    NSDictionary *parameters2=@{@"1":[user objectForKey:@"wenjuan"][0],@"2":[user objectForKey:@"wenjuan"][1],@"3":[user objectForKey:@"wenjuan"][2],@"4":[user objectForKey:@"wenjuan"][3],@"5":[user objectForKey:@"wenjuan"][4]};
            
            params[@"wenjuan"] = str;
            
            NSLog(@"%@",params[@"wenjuan"]);
            
            
            
            [sessionManager POST:@"http://netkq.webbsn.com/BD/main.php/AcceptData/sys" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                NSLog(@"%lld", downloadProgress.totalUnitCount);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@", responseObject);
                
                
                
                
                
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"%@",error);
                
                
                
            }];
            
        

        
        
         _allArr=[[NSMutableArray alloc] init];
            
            NSMutableArray*bianhaoArray=[[NSMutableArray alloc]init];
            for (int i=0; i<[[user objectForKey:@"diaoyan"]  count]; i++) {
                
                for (int j=0; j<[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
                    
                    //            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
                    
                    
                    
                    if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
                        
                        [bianhaoArray addObject:[[user objectForKey:@"diaoyan"] objectAtIndex:i] ];
                        
                        
                        
                    }
                    
                }
                
            }

            NSLog(@"%@",bianhaoArray);
            
            
       
        
        NSEnumerator *enumerator2 = [bianhaoArray reverseObjectEnumerator];
        
          NSArray*array2=[[NSArray alloc] initWithArray:[enumerator2 allObjects]];
        NSLog(@"%@",[enumerator2 allObjects]);
        
        
        
        int a=0;
        
        
        for (NSArray*arr in array2) {
           
            NSDictionary*dict=@{[NSString stringWithFormat:@"%d",++a]:arr};
            
            [_allArr addObject:dict];
            
        }
        NSLog(@"%@",_allArr);
        
        
        
    AFHTTPSessionManager *sessionManager2 = [AFHTTPSessionManager manager];
    sessionManager2.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager2.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];

        NSData *jsonData2 = [NSJSONSerialization dataWithJSONObject:_allArr options:NSJSONWritingPrettyPrinted error:nil];
        
        NSString *str2 = [[NSString alloc] initWithData:jsonData2 encoding:NSUTF8StringEncoding];
  NSMutableDictionary *params2 = [NSMutableDictionary dictionary];
//        NSDictionary *parameters=[[NSDictionary alloc]init];
//        [parameters setValue:[NSString JSONStringWithNSDictionary:self.orderModel.cartCids] forKey:@"cids"];
//    NSDictionary *parameters2=@{@"1":[user objectForKey:@"wenjuan"][0],@"2":[user objectForKey:@"wenjuan"][1],@"3":[user objectForKey:@"wenjuan"][2],@"4":[user objectForKey:@"wenjuan"][3],@"5":[user objectForKey:@"wenjuan"][4]};
      
       params2[@"wenjuan"] = str2;
        
        
    [sessionManager POST:@"http://netkq.webbsn.com/BD/main.php/AcceptData" parameters:params2 progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        
        
        
        UIColor *color = [UIColor cyanColor];
        
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.mode = MBProgressHUDModeText;
        
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            _hud.labelText = @"上传/同步成功";
        }else{
            _hud.labelText = @"uploaded";
            
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
        
       
        [self doSomething];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

    
            
            
          
            
            
//}
    

    
    
    
    
    
    [self photo];
    
    
}

- (IBAction)baogao:(id)sender {
    NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *thisArr2 = [NSUserDefaults standardUserDefaults];
     NSUserDefaults *time = [NSUserDefaults standardUserDefaults];
    
    
    NSLog(@"%ld",(long)_add);
    
    if (_add>=1&&_add2>=1) {
        
        
//        for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
//            
//            
//            
//            for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
//                
//                
//                if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"keshi"] objectForKey:@"keshi"]) {
//                    
//                    [_qitaArr addObject:[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"keshi"] objectForKey:@"keshi"]];
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//            }
//        }
        
      
        
       
        
//        NSMutableArray *discardedItems = [NSMutableArray array];
//        
//        for (NSString*kk in _qitaArr) {
//            
//            if ([kk isEqualToString:@"Anaesthesia"]||[kk isEqualToString:@"重症"]||[kk isEqualToString:@"ICU"]||[kk isEqualToString:@"急症"]||[kk isEqualToString:@"Emergency"]||[kk isEqualToString:@"呼吸"]||[kk isEqualToString:@"Respiratory"]||[kk isEqualToString:@"麻醉"]) {
//                
//                NSLog(@"%@",kk);
//                
//                [discardedItems addObject:kk];
//                
//            }
//            
//            
//            
//            
//            
//        }
//        
//        [_qitaArr removeObjectsInArray:discardedItems];
//        
//     
//        
//        
//        
//        
//        NSUserDefaults *keshiArr = [NSUserDefaults standardUserDefaults];
//        NSArray*arrKeshi=[NSArray arrayWithArray:[keshiArr objectForKey:@"keshiArr"]];
//        [_qitaArr addObjectsFromArray:arrKeshi];
//        NSLog(@"%@",_qitaArr);
//        NSArray*arrKeshi2=[NSArray arrayWithArray:_qitaArr];
//        
//        [keshiArr setObject:arrKeshi2 forKey:@"keshiArr"];
//        [keshiArr synchronize];
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSUserDefaults *shiyanshi = [NSUserDefaults standardUserDefaults];
        
        NSLog(@"%@",[user objectForKey:@"diaoyan"]);
        
       
        [_thisArr removeAllObjects];
        [_thisArr2 removeAllObjects];
       
            
        
        
        for (int i=0; i<[[user objectForKey:@"diaoyan"]  count]; i++) {
            
            for (int j=0; j<[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
                
                //            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
                
                if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
                    
                  
                    
                    //NSLog(@"%@",[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0]);
                    
                    [_thisArr addObject:[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0]];
                    
                    
                }
                
            }
            
        }
        
     
        
        
        
        
        for (int i=0; i<[[shiyanshi objectForKey:@"shiyanshi"]  count]; i++) {
            
            for (int j=0; j<[[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
                
                //            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
                
                if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
                    
              
                    
                    //NSLog(@"%@",[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0]);
                    
                    [_thisArr2 addObject:[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0]];
                    
                    
                    
                }
                
            }
            
        }
            
            

        
        
        
        NSArray*arr=[NSArray arrayWithArray:_thisArr];
        [thisArr setObject:arr forKey:@"thisArr"];
        [thisArr setObject:_name forKey:@"yiyuan"];
        [thisArr synchronize];
        
        NSArray*arr2=[NSArray arrayWithArray:_thisArr2];
        [thisArr2 setObject:arr2 forKey:@"thisArr2"];
        [thisArr2 synchronize];

        [time setObject:_startStr forKey:@"time"];
        [time synchronize];
        
        
        NSLog(@"%@",[thisArr objectForKey:@"thisArr"]);

        
        
        
       
        [self performSegueWithIdentifier:@"onePPT" sender:self];
    }
    else{
    
        UIColor *color = [UIColor cyanColor];
        
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.mode = MBProgressHUDModeText;
       
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            _hud.labelText = @"您还没有完成至少一份科室内调研或实验室调研";
        }else{
            _hud.labelText = @"You have not completed at least one questionnaire";
            
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
    
    
    
    
}


- (void)taskOfText {
    [self taskOfIndeterminate];
}
- (void)taskOfIndeterminate {
    sleep(1); //进程挂起3秒，这里仅仅是模拟，相当于执行了一些操作耗时3秒；sleep 和 usleep 都是进程挂起操作方法，他们的精准度不同，所以按需使用；对于一般秒级别操作，就使用 sleep 方法
}

- (IBAction)postWenJuan:(id)sender{
    
    int isok1=0;
    int isok2=0;
    
    
    
    if ([_zhuangtai isEqualToString:@"结束"]||[_zhuangtai isEqualToString:@"已过期"]) {
        
        if ([_diaoyanrenyuan isEqualToString:@"2"]) {
            
            isok2=1;
        }
    }
    
    
    
    NSMutableArray*Q1=[[NSMutableArray alloc] init];
    
    for(int i=0;i<[_chooseArray1 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray1 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok1=1;
            [Q1 addObject:pp.textLabel.text];
            _chooseStr=pp.textLabel.text;
            
        }
    }
    
    if (isok1==0) {
        
        
        //||_radioGroup1.sValue==nil||_radioGroup2.sValue==nil||_radioGroup3.sValue==nil||_radioGroup4.sValue==nil||_radioGroup5.sValue==nil||_radioGroup6.sValue==nil
        
        //NSLog(@"%@",);
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请填写完整" message:@"请选择对应的选项" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
            [alert show];
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please complete the form" message:@"Please select the option" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        
        

        
        
    }
  else  if (isok2==1) {
        
        
        //||_radioGroup1.sValue==nil||_radioGroup2.sValue==nil||_radioGroup3.sValue==nil||_radioGroup4.sValue==nil||_radioGroup5.sValue==nil||_radioGroup6.sValue==nil
        
        //NSLog(@"%@",);
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"调研已结束" message:@"" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
            [alert show];
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please complete the form" message:@"Please select the option" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        
        
        
        
        
    }

    
    else{
        
        
        [self post:sender];
        
        
        
        
        
        
         NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
        
        
        
        
        
        if ([_textField.text isEqual:@""]||_textField.text==nil) {
            
            [keshi setObject:_chooseStr forKey:@"keshi"];
            [keshi synchronize];
            
        }
        else{
            [keshi setObject:_textField.text forKey:@"keshi"];
            [keshi synchronize];
            _chooseStr=_textField.text;
        
        }
        NSUserDefaults *number = [NSUserDefaults standardUserDefaults];
        [number setObject:_bianhao forKey:@"number"];
        [number synchronize];
        
        
         NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        
        
        NSLog(@"%@",[user objectForKey:@"diaoyan"]);
        
        
        
        NSMutableArray*arr11=[[NSMutableArray alloc] init];
        NSMutableArray*arr12=[[NSMutableArray alloc] init];
        
        for (int i=0; i<[[user objectForKey:@"diaoyan"]  count]; i++) {
            
            for (int j=0; j<[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
            
            
                if ([_numberStr2 isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
                    
                    [arr11 addObject:[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0]];
                    
                }
                
            
            }
            
        }
        
        _add3=0;
        
        NSLog(@"%@",_chooseStr);
        
       
        
       
        
        for (int i=0; i<[arr11 count]; i++) {
            
            
            
            for (int j=0; j<[[arr11 objectAtIndex:i]  count]; j++) {
                
                if ([[[[arr11 objectAtIndex:i]  objectAtIndex:j] objectForKey:@"keshi"] objectForKey:@"keshi"]) {
                    [arr12 addObject:[[[[arr11 objectAtIndex:i]  objectAtIndex:j] objectForKey:@"keshi"] objectForKey:@"keshi"]];
                }
                
//                [arr12 addObject:[[[[arr11 objectAtIndex:i]  objectAtIndex:j] objectForKey:@"keshi"] objectForKey:@"keshi"]];
                
                
//                if ([_chooseStr isEqualToString:[NSString stringWithFormat:@"%@",[[[[arr11 objectAtIndex:i]  objectAtIndex:j] objectForKey:@"keshi"] objectForKey:@"keshi"]]]) {
//                    
//                    ++_add3;
//                    
                  
//
//                    
//                   
//                    
//                     
//                 }
                
            }
            
        }
        
//        
//            Department ICU Emergency Anesthesiology Respiratory  Other
//        
//         _oneArray=[[NSMutableArray alloc] initWithObjects:@"检验科",@"重症",@"急诊",@"呼吸",@"麻醉",@"其他",nil];
        
        
        
        if ([_chooseStr isEqualToString:@"ICU"]) {
            _chooseStr =@"重症";
        }
     else   if ([_chooseStr isEqualToString:@"Emergency"]) {
         
            _chooseStr =@"急症";
        }
        
      else  if ([_chooseStr isEqualToString:@"Anesthesiology"]) {
             _chooseStr =@"呼吸";
        }
        
     else   if ([_chooseStr isEqualToString:@"Respiratory"]) {
            _chooseStr =@"麻醉";
        }
        
     else   if ([_chooseStr isEqualToString:@"Other"]) {
             _chooseStr =@"其他";
        }

        
        NSLog(@"%@",arr12);
        
        
        NSMutableArray *memberarray=[[NSMutableArray alloc]initWithArray:arr12];
        
        for (NSString*str in arr12) {
            
            if ([str isEqualToString:@"ICU"]) {
                [memberarray addObject:@"重症"];
            }
           else if ([str isEqualToString:@"Emergency"]) {
                [memberarray addObject:@"急症"];
            }

           else if ([str isEqualToString:@"Anesthesiology"]) {
                [memberarray addObject:@"呼吸"];
            }

          else  if ([str isEqualToString:@"Respiratory"]) {
                [memberarray addObject:@"麻醉"];
            }

          else  if ([str isEqualToString:@"Other"]) {
                [memberarray addObject:@"其他"];
            }
          else{
              NSLog(@"???");
          
          }
            
        }
        
        
        
        for (NSString*str in memberarray) {
            if ([_chooseStr isEqualToString:str]) {
                ++_add3;
            }
        }

      
       
        
        if (_add3>0) {
             InfoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"sixPage"];
             [self.navigationController pushViewController:receive animated:YES];
            
            [user setObject:@"123" forKey:@"123"];
            [user synchronize];
        }
        else{
        
         InfoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"onePage"];
             [self.navigationController pushViewController:receive animated:YES];
            
            [user removeObjectForKey:@"123"];
            [user synchronize];
        }
        
        

    
    

    
   
    }


}

- (void)viewWillAppear:(BOOL)animated{
    
    //[self viewDidLoad];
   // [super viewWillAppear:animated];
     NSString *dataString = [@"http://netkq.webbsn.com/BD/admin.php/Nurse/index/number/" stringByAppendingString:_numberStr2];
    NSLog(@"hhhhhhhhhhhh");
    _add3=0;
   
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [user setInteger:1 forKey:@"int"];
//    [user synchronize];
//    NSLog(@"%lu",[[user objectForKey:@"wenjuan"]count]);
//    //NSLog(@"%@",[[user objectForKey:@"wenjuan"] valueForKey:@"bianhao"] );
//    NSLog(@"%@",_bianhao);
//    for (int i=0; i<[[user objectForKey:@"wenjuan"]  count]; i++) {
//        if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[user objectForKey:@"wenjuan"]objectAtIndex:i]objectAtIndex:65]valueForKey:@"bianhao"]]]) {
//            
//            _add2++;
//        }
//        //        NSLog(@"%@",[NSString stringWithFormat:@"%@",[[[user objectForKey:@"wenjuan"] valueForKey:@"bianhao"] objectAtIndex:i]]);
//        
//        
//    }
//    NSLog(@"add=========%ld",(long)_add2);
//    _fen.text=[[NSString stringWithFormat:@"%ld",(long)_add2] stringByAppendingString:@"份"];
//    _add2=0;
    
    

    
}
- (IBAction)over:(id)sender {
    
    
    
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *shiyanshi = [NSUserDefaults standardUserDefaults];
//
//    if (![shiyanshi objectForKey:@"shiyanshi"]&&![user objectForKey:@"diaoyan"]) {
//        
//        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//        NSDictionary *parameters =@{@"number":_numberStr2};
//        //        NSLog(@"%@",_numberStr2);
//        NSLog(@"%@",[user objectForKey:@"diaoyan"]);
//        
//        
//        [sessionManager POST:@"http://netkq.webbsn.com/BD/admin.php/Survey/tongbu" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
//            //  NSLog(@"%lld", downloadProgress.totalUnitCount);
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@",responseObject);
//            
//            NSMutableArray*arr=[[NSMutableArray alloc] initWithArray:responseObject];
//            NSMutableArray*arr2=[[NSMutableArray alloc] init];
//            for (int i=0; i<arr.count; i++) {
//                
//                for (int j=0; j<[[arr objectAtIndex:i] count]; j++) {
//                    
//                    //NSLog(@"%@",[arr objectAtIndex:i]);
//                    // NSLog(@"%@",[[arr objectAtIndex:i] objectAtIndex:j]);
//                    
//                    
//                    for (NSString*key in [[[arr objectAtIndex:i] objectAtIndex:j] allKeys]) {
//                        
//                        NSArray* arr3=[[arr objectAtIndex:i] objectAtIndex:j][key];
//                        
//                        // NSLog(@"%@",arr3);
//                        
//                        [arr2 addObject:arr3 ];
//                        
//                    }
//                    
//                    
//                }
//                
//                
//            }
//            NSArray*arr4=[NSArray arrayWithArray:arr2];
//            
//            [user setObject:arr4 forKey:@"diaoyan"];
//            [user synchronize];
//            
//            
//            for (int i=0; i<[[user objectForKey:@"diaoyan"]  count]; i++) {
//                
//                for (int j=0; j<[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
//                    
//                    //            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
//                    
//                    if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
//                        
//                        ++_add;
//                        
//                        
//                        
//                        
//                    }
//                    
//                }
//                
//            }
//            
//            _fen.text=[[NSString stringWithFormat:@"%ld",(long)_add ] stringByAppendingString:@"份"];
//            
//            
//            
//            NSLog(@"%ld",(long)[[user objectForKey:@"diaoyan"] count]);
//            NSLog(@"%ld",(long)[[shiyanshi objectForKey:@"shiyanshi"] count]);
//            
//            
//            
//            
//            
//            
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"%@",error);
//        }];
//        
//        
//        AFHTTPSessionManager *sessionManager2 = [AFHTTPSessionManager manager];
//        sessionManager2.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//        NSDictionary *parameters2 =@{@"number":_numberStr2};
//        //        NSLog(@"%@",_numberStr2);
//        NSLog(@"%@",[shiyanshi objectForKey:@"shiyanshi"]);
//        
//        [sessionManager POST:@"http://netkq.webbsn.com/BD/admin.php/Survey/tongbusys" parameters:parameters2 progress:^(NSProgress * _Nonnull downloadProgress) {
//            //  NSLog(@"%lld", downloadProgress.totalUnitCount);
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            // NSLog(@"%@",responseObject);
//            NSMutableArray*arr=[[NSMutableArray alloc] initWithArray:responseObject];
//            NSMutableArray*arr2=[[NSMutableArray alloc] init];
//            for (int i=0; i<arr.count; i++) {
//                
//                for (int j=0; j<[[arr objectAtIndex:i] count]; j++) {
//                    
//                    //NSLog(@"%@",[arr objectAtIndex:i]);
//                    // NSLog(@"%@",[[arr objectAtIndex:i] objectAtIndex:j]);
//                    
//                    
//                    for (NSString*key in [[[arr objectAtIndex:i] objectAtIndex:j] allKeys]) {
//                        
//                        NSArray* arr3=[[arr objectAtIndex:i] objectAtIndex:j][key];
//                        
//                        // NSLog(@"%@",arr3);
//                        
//                        [arr2 addObject:arr3 ];
//                        
//                    }
//                    
//                    
//                }
//                
//                
//            }
//            NSArray*arr4=[NSArray arrayWithArray:arr2];
//            
//            [shiyanshi setObject:arr4 forKey:@"shiyanshi"];
//            [shiyanshi synchronize];
//            
//            
//            for (int i=0; i<[[shiyanshi objectForKey:@"shiyanshi"]  count]; i++) {
//                
//                for (int j=0; j<[[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] count]; j++) {
//                    
//                    //            NSLog(@"%@",[[[[user objectForKey:@"diaoyan"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j]);
//                    
//                    if ([_bianhao isEqualToString:[NSString stringWithFormat:@"%@",[[[[[[shiyanshi objectForKey:@"shiyanshi"] objectAtIndex:i] objectAtIndex:0] objectAtIndex:j] objectForKey:@"number"] objectForKey:@"number"]]]) {
//                        
//                        ++_add2;
//                        
//                        
//                        
//                        
//                    }
//                    
//                }
//                
//            }
//            
//            
//            //             _shiyanLb.text=[[NSString stringWithFormat:@"%ld",(long)[[shiyanshi objectForKey:@"shiyanshi"]count] ] stringByAppendingString:@"份"];
//            //
//            //            _add2=[[shiyanshi objectForKey:@"shiyanshi"] count];
//            
//            _shiyanLb.text=[[NSString stringWithFormat:@"%ld",(long)_add2 ] stringByAppendingString:@"份"];
//            
//            
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"%@",error);
//        }];
//        
//        
//        
//        
//        
//        
//        
//        UIColor *color = [UIColor cyanColor];
//        
//        _hud = [[MBProgressHUD alloc] initWithView:self.view];
//        _hud.mode = MBProgressHUDModeText;
//       
//        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//        if (![user objectForKey:@"english"]) {
//             _hud.labelText = @"同步成功";
//        }else{
//            _hud.labelText = @"Synchronization succeeded";
//            
//        }
//
//        
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
//        
//        
//    }
//    
//    
//    
    if (_add==0) {
        
        
        UIColor *color = [UIColor cyanColor];
        
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.mode = MBProgressHUDModeText;
       
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
             _hud.labelText = @"您还没有完成至少一份问卷";
        }else{
            _hud.labelText = @"You have not completed at least one questionnaire";
            
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
   
    else if(_add2==0) {
            
            
            UIColor *color = [UIColor cyanColor];
            
            _hud = [[MBProgressHUD alloc] initWithView:self.view];
            _hud.mode = MBProgressHUDModeText;
            
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            if (![user objectForKey:@"english"]) {
               _hud.labelText = @"您还没有完成至少一份实验室问卷";
            }else{
                _hud.labelText = @"You have not completed at least one lab questionnaire";
                
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
        
        //else{
//
//            
//            NSMutableArray*allArr2=[[NSMutableArray alloc] init];
//            
//            NSEnumerator *enumerator = [[user objectForKey:@"shiyanshi"] reverseObjectEnumerator];
//            
//            NSArray*array=[[NSArray alloc] initWithArray:[enumerator allObjects]];
//            NSLog(@"%@",[enumerator allObjects]);
//            
//            int i=0;
//            
//            
//            for (NSArray*arr in array) {
//                
//                NSDictionary*dict=@{[NSString stringWithFormat:@"%d",++i]:arr};
//                
//                [allArr2 addObject:dict];
//                
//            }
//            NSLog(@"%@",allArr2);
//            
//            
//            
//            AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//            sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//            sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
//            
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:allArr2 options:NSJSONWritingPrettyPrinted error:nil];
//            
//            NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//            NSMutableDictionary *params = [NSMutableDictionary dictionary];
//            //        NSDictionary *parameters=[[NSDictionary alloc]init];
//            //        [parameters setValue:[NSString JSONStringWithNSDictionary:self.orderModel.cartCids] forKey:@"cids"];
//            //    NSDictionary *parameters2=@{@"1":[user objectForKey:@"wenjuan"][0],@"2":[user objectForKey:@"wenjuan"][1],@"3":[user objectForKey:@"wenjuan"][2],@"4":[user objectForKey:@"wenjuan"][3],@"5":[user objectForKey:@"wenjuan"][4]};
//            
//            params[@"wenjuan"] = str;
//            
//            
//            [sessionManager POST:@"http://netkq.webbsn.com/BD/main.php/AcceptData/sys" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
//                NSLog(@"%lld", downloadProgress.totalUnitCount);
//            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                NSLog(@"%@", responseObject);
//                
//                
//                
//                
//                
//                
//                
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                NSLog(@"%@",error);
//            }];
//            
//        }
//        
//        
//        
//        _allArr=[[NSMutableArray alloc] init];
//        
//        
//        
//        NSEnumerator *enumerator = [[user objectForKey:@"diaoyan"] reverseObjectEnumerator];
//        
//        NSArray*array=[[NSArray alloc] initWithArray:[enumerator allObjects]];
//        NSLog(@"%@",[enumerator allObjects]);
//        
//        
//        
//        int i=0;
//        
//        
//        for (NSArray*arr in array) {
//            
//            NSDictionary*dict=@{[NSString stringWithFormat:@"%d",++i]:arr};
//            
//            [_allArr addObject:dict];
//            
//        }
//        NSLog(@"%@",_allArr);
//        
//        
//        
//        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//        sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
//        
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_allArr options:NSJSONWritingPrettyPrinted error:nil];
//        
//        NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        NSMutableDictionary *params = [NSMutableDictionary dictionary];
//        //        NSDictionary *parameters=[[NSDictionary alloc]init];
//        //        [parameters setValue:[NSString JSONStringWithNSDictionary:self.orderModel.cartCids] forKey:@"cids"];
//        //    NSDictionary *parameters2=@{@"1":[user objectForKey:@"wenjuan"][0],@"2":[user objectForKey:@"wenjuan"][1],@"3":[user objectForKey:@"wenjuan"][2],@"4":[user objectForKey:@"wenjuan"][3],@"5":[user objectForKey:@"wenjuan"][4]};
//        
//        params[@"wenjuan"] = str;
//        
//        
//        [sessionManager POST:@"http://netkq.webbsn.com/BD/main.php/AcceptData" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
//            NSLog(@"%lld", downloadProgress.totalUnitCount);
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@", responseObject);
//            
//            
//            
//            UIColor *color = [UIColor cyanColor];
//            
//            _hud = [[MBProgressHUD alloc] initWithView:self.view];
//            _hud.mode = MBProgressHUDModeText;
//           
//            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//            if (![user objectForKey:@"english"]) {
//                _hud.labelText = @"上传成功";
//            }else{
//                _hud.labelText = @"uploaded";
//                
//            }
//
//            
//            
//            _hud.labelFont = [UIFont systemFontOfSize:17];
//            _hud.labelColor = color; //设置文本颜色；默认为白色
//            _hud.detailsLabelText = @"^_^";
//            _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
//            _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
//            [self.view addSubview:_hud];
//            
//            [_hud showAnimated:YES
//           whileExecutingBlock:^{
//               [self taskOfText];
//           } completionBlock:^{
//               NSLog(@"showHUDByText 执行完成");
//           }];
//            
//            
//            
//            
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"%@",error);
//        }];
//        
//    }
    
//上传结束后
    
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSDictionary *parameters =@{@"number":_bianhao};

    
    [sessionManager POST:@"http://netkq.webbsn.com/BD/index.php/Hissurvey/isok/" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        
        
        
        InfoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"listPage"];
        
        [self.navigationController pushViewController:receive animated:YES];

        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

    
    
    
    
    
    
    
    
}
- (IBAction)clear:(id)sender {
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *shiyanshi = [NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:@"diaoyan"];
     [shiyanshi removeObjectForKey:@"shiyanshi"];
    [user synchronize];
    [shiyanshi synchronize];
}


- (IBAction)shuaxin:(id)sender {
    
      NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters =@{@"number":_numberStr2};
    NSLog(@"%@",parameters);
    
    [sessionManager POST:@"http://netkq.webbsn.com/BD/admin.php/Nurse/nursecount" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        //  NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject );
        
//        _hushiText.text=[[responseObject objectForKey:@"0"] stringByAppendingString:@"份"];
        if ([user objectForKey:@"english"]) {
            _hushiText.text=[[responseObject objectForKey:@"0"] stringByAppendingString:@"copies"];
        }
        else{
            _hushiText.text=[[responseObject objectForKey:@"0"] stringByAppendingString:@"份"];

        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}
- (void) photo{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSUserDefaults *number = [NSUserDefaults standardUserDefaults];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSLog(@"%@",documentsDirectory);
    
    NSFileManager *fileManage = [NSFileManager defaultManager];
    NSArray *photosArr = [fileManage subpathsAtPath: [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",[number objectForKey:@"number"]]]];
     NSString*path=[[NSString alloc ] init];
    
    NSLog(@"%@",[number objectForKey:@"number"]);
    NSLog(@"%@",photosArr);
    
    
    
     _photoArr=[[NSMutableArray alloc] init];
    for (int i=0; i<photosArr.count; i++) {
        
       
        path=[[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@/",[number objectForKey:@"number"]]] stringByAppendingPathComponent:photosArr[i]];
        
        [_photoArr addObject:path];
    }
    NSLog(@"%@",_photoArr);
    

    
     NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_numberStr2, @"number", nil];
    // 基于AFN3.0+ 封装的HTPPSession句柄
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 20;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    // 在parameters里存放照片以外的对象
    [manager POST:@"http://netkq.webbsn.com/BD/main.php/Image/index" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // formData: 专门用于拼接需要上传的数据,在此位置生成一个要上传的数据体
        // 这里的_photoArr是你存放图片的数组
        for (int i = 0; i < _photoArr.count; i++) {
            
            //UIImage *image =[[UIImage alloc] initWithContentsOfFile:photosArr[i]];
             UIImage *image =[UIImage imageWithContentsOfFile:_photoArr[i] ];
            
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            
            NSLog(@"%@",imageData);
            
            // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
            // 要解决此问题，
            // 可以在上传时使用当前的系统事件作为文件名
           // NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            //[formatter setDateFormat:@"yyyyMMddHHmmss"];
           // NSString *dateString = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString  stringWithFormat:@"%@", _photoArr[i] ];
            /*
             *该方法的参数
             1. appendPartWithFileData：要上传的照片[二进制流]
             2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
             3. fileName：要保存在服务器上的文件名
             4. mimeType：上传的文件的类型
             */
            NSString * Name = [NSString stringWithFormat:@"%@%zi", image, i+1];
            [formData appendPartWithFileData:imageData name:Name fileName:fileName mimeType:@"image/jpeg"]; //
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"---上传进度--- %@",uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"```上传成功``` %@",responseObject);
        
        
        
//        UIColor *color = [UIColor cyanColor];
//        
//        _hud = [[MBProgressHUD alloc] initWithView:self.view];
//        _hud.mode = MBProgressHUDModeText;
//        //_hud.labelText = @"图片上传成功";
//        
//        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//        if (![user objectForKey:@"english"]) {
//            _hud.labelText = @"图片上传成功";
//        }else{
//            _hud.labelText = @"Image uploaded";
//            
//        }
//
//        
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

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"xxx上传失败xxx %@", error);
        
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
            self.view.frame = CGRectMake(self.view.frame.origin.x-215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x+215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }
    else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+100 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}
@end

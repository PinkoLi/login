//
//  WenJuanViewController.m
//  login
//
//  Created by 茶茶漾 on 16/8/31.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "WenJuanViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "AFNetworking.h"
@interface WenJuanViewController ()
@property(strong,nonatomic)NSMutableArray*arr;
@property(assign,nonatomic)NSInteger a;
@property(assign,nonatomic)NSInteger b;
@property(assign,nonatomic)NSInteger c;

@property(nonatomic,strong)SSCheckBoxView *cb;
@property(nonatomic,strong)SSCheckBoxView *cb2;
@property(nonatomic,strong)SSCheckBoxView *cb3;
@property(nonatomic,strong)NSMutableArray *arr2;
@property(nonatomic,strong)NSMutableArray *arr3;
@property(nonatomic,strong)NSMutableArray *arr4;
@property(nonatomic,strong)NSMutableArray *optionArr;
@property(nonatomic,strong)NSMutableArray *answerArr;
@property(nonatomic,strong)NSMutableArray *answerArr2;
@property(nonatomic,strong)NSMutableArray *answerArr3;
@property(nonatomic,strong)NSMutableDictionary*allDict;
@property(nonatomic,strong)NSMutableDictionary*allDict2;
@property(nonatomic)bool isFullScreen;
@property(nonatomic)bool isok;

@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;
- (IBAction)segGo:(id)sender;

@property(nonatomic,strong)NSString*titleStr;

@property (weak, nonatomic) IBOutlet UIView *view1;

@end
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define Start_X 66.0f           // 第一个按钮的X坐标
#define Start_Y 260.0f           // 第一个按钮的Y坐标
#define Width_Space 19.0f        // 2个按钮之间的横间距
#define Height_Space 10.0f      // 竖间距
#define Button_Height 30.0f    // 高
#define Button_Width 100.0f      // 宽


#define Start_X2 25.0f           // 第一个按钮的X坐标
#define Start_Y2 60.0f           // 第一个按钮的Y坐标
#define Width_Space2 30.0f        // 2个按钮之间的横间距
#define Height_Space2 20.0f      // 竖间距
#define Button_Height2 30.0f    // 高
#define Button_Width2 200.0f      // 宽


#define URLStr @"https://paqcabg.chinacloudsites.cn/BD/Public/OptionIMG/"
@implementation WenJuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:@"22"];
    [user removeObjectForKey:@"21"];
    [user synchronize];
    
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB1"ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    
    _step1.layer.contents = (id)image.CGImage;
    //_step1.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"TAB1.png"] ];
    
    
    
    _titleStr=[[NSString alloc] init];
    
       _answer=[NSMutableArray arrayWithCapacity:10];
     //_allArr=[NSMutableArray arrayWithCapacity:10];
    _allArr2=[[NSMutableArray alloc] init];
//_optionArr=[[NSMutableArray alloc]init];
      _texts=[NSMutableDictionary dictionaryWithCapacity:10] ;
    
    _seg.selectedSegmentIndex=0;
    _isok=NO;
       _chooseKeshi.text=_keshiLb;
    
    NSLog(@"%@",_keshiBianhao);
    
    
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
 
    
    [sessionManager POST:@"https://paqcabg.chinacloudsites.cn/BD/main.php/Survey" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        
                _allDict=[NSMutableDictionary dictionaryWithDictionary:responseObject];
        
        NSLog(@"%@",_allDict);
        
        [_allDict removeObjectForKey:[NSString stringWithFormat:@"%d",4]];
        _allDict2=[NSMutableDictionary dictionaryWithDictionary:responseObject];
        [_allDict2 removeObjectForKey:[NSString stringWithFormat:@"%d",1]];
        _titleArr2=[[NSArray alloc] initWithArray:[[_allDict2 objectForKey:[NSString stringWithFormat:@"%d",4]] objectForKey:[NSString stringWithFormat:@"%ld",(long)1]]];
        NSLog(@"%@", _titleArr2 );
        
        
        
        for (int i=0; i<_titleArr2.count; i++) {
            
            
            //         _lb1.text=[[[NSString stringWithFormat:@"%@",[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"、"] stringByAppendingString:[titleArr[0]objectForKey:@"title"]];
            
            
            
            if ([[_titleArr2 objectAtIndex:i]objectForKey:@"title"]) {
                
                if ([[[_titleArr2 objectAtIndex:i]objectForKey:@"photo"]isEqualToString:@"1"]) {
                    
                    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    
                    
                    
                    [button setTitle:@"建议拍照" forState:UIControlStateNormal];
                    button.frame = CGRectMake(800.0, 40.0+i*130, 80.0, 30.0);
                    [_view3 addSubview:button];
                    
                    
                }
                
                
                UILabel *lblType=[[UILabel alloc] initWithFrame:CGRectMake(35, 39+i*130, 870, 30)];
                
                [lblType setBackgroundColor:[UIColor clearColor]];
                
                [lblType setFont:[UIFont systemFontOfSize:17]];
                
                [lblType setTextColor:UIColorFromRGB(0x034f9a)];
                
                [lblType setText:[[[NSString stringWithFormat:@"%@",[_titleArr2[i]objectForKey:@"num"]]stringByAppendingString:@"、"] stringByAppendingString:[[_titleArr2 objectAtIndex:i] objectForKey:@"title"]]];
                
                
                [_view3 addSubview:lblType];
                
                
                if ([[_titleArr2 objectAtIndex:i]objectForKey:@"option"]) {
                    
                    
                    if ([[_titleArr2 objectAtIndex:i]objectForKey:@"rule"]) {
                        
                        NSLog(@"1111");
                        
                    }
                    
                    NSInteger b;
                    b=[[[_titleArr2 objectAtIndex:i] objectForKey:@"newline"] intValue];
                    
                    NSLog(@"%ld",(long)b);
                    
                    _optionArr=[NSMutableArray arrayWithArray:[[_titleArr2 objectAtIndex:i]objectForKey:@"option"]];
                    
                    
                    // NSLog(@"%@",[[titleArr objectAtIndex:i]objectForKey:@"option"]);
                    
                    
                    for (int j=0; j<_optionArr.count; j++) {
                        
                        //        float x = i%5;
                        //
                        //        float y = i/5;
                        
                        if ([[[_titleArr2 objectAtIndex:i]objectForKey:@"newline"]isEqualToString:@""]) {
                            NSLog(@"不用换行！");
                            
                            NSInteger index = j % _optionArr.count;
                            
                            
                            SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index*(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2)+Start_Y2+i*130, Button_Width2, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                            [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                            
                            [cb setText:[_optionArr objectAtIndex:j]];
                            cb.tag=[[[_titleArr2 objectAtIndex:i]objectForKey:@"num"] intValue];
                            
                            [_optionArray addObject:cb];
                            
                            
                            
                            [_view3 addSubview:cb];
                            
                            
                            
                            
                            
                            
                        }
                        else{
                            NSInteger index = j % b;
                            NSInteger page = j/b;
                            SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2) + Start_X2, page  * (Button_Height2 + Height_Space2)+Start_Y2+i*130, Button_Width2, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                            [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                            
                            [cb setText:[_optionArr objectAtIndex:j]];
                            [_optionArray addObject:cb];
                            
                            
                            cb.tag=[[[_titleArr2 objectAtIndex:i]objectForKey:@"num"] intValue];
                            
                            [_view3 addSubview:cb];
                            
                            
                            
                            
                        }
                        
                        
                        if (![[[_titleArr2 objectAtIndex:i]objectForKey:@"img"]isEqualToString:@""]) {
                            NSLog(@"有照片！！！！");
                            
                            
                            if ([[[_titleArr2 objectAtIndex:i]objectForKey:@"img"]isEqualToString:@"1"]) {
                                
                                NSInteger index = j % _optionArr.count;
                                
                                UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(index*(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2)+Start_Y2+i*130, Button_Width2, Button_Height2)];
                                NSString*urlStr=[[NSString alloc]init];
                                urlStr=[[URLStr stringByAppendingString:[_titleArr2[i]objectForKey:@"num"]]stringByAppendingString:@".png"];
                                
                                NSLog(@"%@",urlStr);
                                
                                NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
                                UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
                                imgView.image=image;
                                [_view3 addSubview:imgView];
                                
                                
                                
                                
                            }
                            else if ([[[_titleArr2 objectAtIndex:i]objectForKey:@"img"]isEqualToString:@"3"]){
                                
                                
                                
                                
                                
                            }
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                }
                
                
                
            }
            
            
            
            
            
            NSMutableDictionary*numDict=[NSMutableDictionary dictionaryWithCapacity:10] ;
            [numDict setObject:[[_titleArr2 objectAtIndex:i]objectForKey:@"num"] forKey:@"num"] ;
            
            
            
            
            NSLog(@"%@",numDict);
            
            
            
            
            
            
        }
        
        
        
       _btn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _btn.frame =CGRectMake(767, 522, 75, 31);

        [_btn setTitle:@"继续答题" forState:UIControlStateNormal];
        
        [_btn addTarget:self action:@selector(next2:) forControlEvents:UIControlEventTouchUpInside];
        _btn.tag=300;
        [_view3 addSubview:_btn];

        
       NSString*xuhao=@"2、";
        
        
        
        _lb1.text=[xuhao stringByAppendingString:[[[responseObject objectForKey:[NSString stringWithFormat:@"%d",1]]objectForKey:[NSString stringWithFormat:@"%d",1]][0]objectForKey:@"title"]];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

    
    
    _view1.layer.masksToBounds = YES;
    _view1.layer.cornerRadius = 4.0;
    _view1.layer.borderWidth = 1.0;
    _view1.layer.borderColor = [[UIColor clearColor] CGColor];
    _view2.layer.masksToBounds = YES;
    _view2.layer.cornerRadius = 6.0;
    _view2.layer.borderWidth = 1.0;
    _view2.layer.borderColor = [[UIColor clearColor] CGColor];
    _view3.layer.masksToBounds = YES;
    _view3.layer.cornerRadius = 6.0;
    _view3.layer.borderWidth = 1.0;
    _view3.layer.borderColor = [[UIColor clearColor] CGColor];
    [_view3 setHidden:YES];
    
    UITextField*textField =[[UITextField alloc]initWithFrame:CGRectMake(150,40, 80, 30)];
    
    // 设置UITextField的样式
    textField.delegate=self;
    textField.borderStyle = UITextBorderStyleNone;
    
    // 文字对齐方式
    textField.textAlignment = NSTextAlignmentLeft;
    // 文字颜色
    textField.textColor = [UIColor blackColor];
    // 提示信息内容
    textField.placeholder = @"请输入...";
    // 字体
    textField.font = [UIFont fontWithName:@"Arial" size:20.0];
    
    [_view2 addSubview:textField];
    
    UITextField*textField2 =[[UITextField alloc]initWithFrame:CGRectMake(770,268, 80, 30)];
    
    // 设置UITextField的样式
    textField2.delegate=self;
    textField2.borderStyle = UITextBorderStyleNone;
    
    // 文字对齐方式
    textField2.textAlignment = NSTextAlignmentLeft;
    // 文字颜色
    textField2.textColor = [UIColor blackColor];
    // 提示信息内容
    textField2.placeholder = @"请输入...";
    // 字体
    textField2.font = [UIFont fontWithName:@"Arial" size:20.0];
    
    [_view2 addSubview:textField2];

    
    
    //[_redayBtn setTitle:@"继续答题" forState:UIControlStateNormal];
    [_redayBtn setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
    
  
    _a=1;
    _b=2;
    _arr2=[NSMutableArray arrayWithObjects:@"1ml",@"2ml",@"3ml",@"5ml",@"10ml", nil];
    _arr3=[NSMutableArray arrayWithObjects:@"BD",@"雷度",@"史密斯",@"泰尔茂",@"威世德",@"其他",@"1ml",@"1ml",@"1ml",@"1ml",@"1ml",@"1ml",@"1.5ml",@"1.5ml",@"1.5ml",@"1.5ml",@"1.5ml",@"1.5ml",@"2ml",@"2ml",@"2ml",@"2ml",@"2ml",@"2ml",@"2.5ml",@"2.5ml",@"2.5ml",@"2.5ml",@"2.5ml",@"2.5ml",@"3ml",@"3ml",@"3ml",@"3ml",@"3ml",@"3ml",nil];
//    _arr4=[[NSMutableArray alloc] initWithObjects:@"1ml",@"1.5ml",@"2ml",@"2.5ml",@"3ml","1ml",@"1.5ml",@"2ml",@"2.5ml",@"3ml", nil];
//    
//    NSLog(@"%@",_arr4);
    
    for (int i=0; i<_arr2.count; i++) {
        _cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(66+i*120, 170, 100, 30) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a3 = [_arr2 objectAtIndex:i];
        [_cb setText:a3];
        
        
        [_cb setStateChangedTarget:self selector:@selector(checkBoxViewChangedState:)];
        [_view2 addSubview:_cb];
        
        _cb.tag=i;
       //        if ([[arr2 objectAtIndex:i]isEqualToString:@"其他"]) {
//            _textField = [[UITextField alloc] initWithFrame:CGRectMake(770, 233+i*45, 250, 30)];
//            // 设置UITextField的样式
//            _textField.delegate=self;
//            _textField.borderStyle = UITextBorderStyleNone;
//            
//            // 文字对齐方式
//            _textField.textAlignment = NSTextAlignmentCenter;
//            // 文字颜色
//            _textField.textColor = [UIColor blackColor];
//            // 提示信息内容
//            _textField.placeholder = @"请输入科室名称";
//            // 字体
//            _textField.font = [UIFont fontWithName:@"Arial" size:20.0];
//            
//            
//            [self.view addSubview: _textField];
        
        }
    
    for (int i=0; i<_arr3.count; i++) {
        
//        float x = i%5;
//        
//        float y = i/5;
        NSInteger index = i % 6;
        NSInteger page = i / 6;
        _cb2 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a3 = [_arr3 objectAtIndex:i];
        [_cb2 setText:a3];
        
        
        [_cb2 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState2:)];
        [_view2 addSubview:_cb2];
        
        _cb2.tag=i;
    }
    
//    for (int i=0; i<_arr4.count; i++) {
//        _cb3 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(66+i*120, 330, 100, 30) style:kSSCheckBoxViewStyleMono checked:NO];
//        NSString *a3 = [_arr4 objectAtIndex:i];
//        [_cb3 setText:a3];
//        
//        
//        [_cb3 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState3:)];
//        [_infoView addSubview:_cb3];
//        
//        _cb3.tag=i;
//    }
    
    
    
    _answerArr=[[NSMutableArray alloc] init];
    _answerArr2=[[NSMutableArray alloc] init];
    _answerArr3=[[NSMutableArray alloc] init];
    
   
    
    
    [_lb1 setTextColor:UIColorFromRGB(0x034f9a)];
     [_lb2 setTextColor:UIColorFromRGB(0x034f9a)];
     [_lb3 setTextColor:UIColorFromRGB(0x034f9a)];
     [_lb4 setTextColor:UIColorFromRGB(0x034f9a)];
     //[_lb5 setTextColor:UIColorFromRGB(0x034f9a)];
    
    _lb1.tag=100;
    _redayBtn.tag=200;
    
    
    
    
    
  
    

    
    
        
}




    
-(void)checkBoxViewChangedState:(SSCheckBoxView*)cbv{
    
   

    
//    NSMutableDictionary*dict=[NSMutableDictionary dictionaryWithObjectsAndKeys:<#(nonnull id), ...#>, nil]
    
   NSString*str1=[NSString stringWithString:cbv.textLabel.text];
    if (cbv.checked==YES) {
        
         NSLog(@"1111");
        
        
        
        
        if ([_answerArr containsObject:str1]==0) {
            
            
       
            
            
        [_answerArr addObject:str1];
            
            
        
        
        }
        
        
        
        
    }
    if (cbv.checked==NO) {
        NSLog(@"xxxxxxx");
        
        [_answerArr removeObject:str1];
    }
    
    NSLog(@"%@",_answerArr);
    
    
}
-(void)checkBoxViewChangedState2:(SSCheckBoxView*)cbv{
    
    NSString*str1=[NSString stringWithString:cbv.textLabel.text];

    
    if (cbv.checked==YES) {
        
        NSLog(@"1111");
        
        
        
        if ([_answerArr2 containsObject:str1]==0) {
            
            
            
            
            
            [_answerArr2 addObject:str1];
            
            
            
            
        }
        
        
        
       
    }
    if (cbv.checked==NO) {
        NSLog(@"xxxxxxx");
        
         [_answerArr2 removeObject:str1];
        
        
    }

    
     NSLog(@"%@",_answerArr2);
    
}
-(void)checkBoxViewChangedState3:(SSCheckBoxView*)cbv{
    
    
      NSString*str1=[NSString stringWithString:cbv.textLabel.text];
    
    
    if (cbv.checked==YES) {
        
        NSLog(@"1111");
        
      
        
        
        if ([_answerArr3 containsObject:str1]==0) {
            
            
            
            
            
            [_answerArr3 addObject:str1];
            
            
            
            
        }
        
        
        
       
    }
    if (cbv.checked==NO) {
        NSLog(@"xxxxxxx");
        
        [_answerArr3 removeObject:str1];
        
    }
 NSLog(@"%@",_answerArr3);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)next:(id)sender {
    

    
     _isok=0;
    
    


    NSLog(@"%@",_allArr2);
    
    
 
    
    _opts2=[[NSMutableArray alloc] init];
    
    NSLog(@"%@",_optionArray2);
    
    for(int a=0;a<[_optionArray2 count];a++)
    {
        
        
        NSLog(@"%@",[_optionArray2 objectAtIndex:a]);
        
       
        
        
     
        
        
         _opts=[[NSMutableArray alloc] init];
        
        int z=0;
        
        
        for ( SSCheckBoxView* pp in [_optionArray2 objectAtIndex:a]) {
            
            
            
            
            if (pp.checked==YES) {
                
                if (z==0) {
                    _isok=1;
                    z++;
                }
                
                
                
                
                [_opts addObject:pp.textLabel.text];
                NSLog(@"%@",_opts);
              
            }
            
            
            
            
            
        }
        NSLog(@"%d",z);
        
        if (z==0) {
            _isok=0;
        }
        
        
        
        [_opts2 addObject:_opts];
        
        NSLog(@"%@",_opts2);
        
        
}
    NSLog(@"%lu",(unsigned long)_opts2.count);
    

  
    _c=0;
    
    NSArray*titleArr2=[[NSArray alloc] initWithArray:[[_allDict objectForKey:[NSString stringWithFormat:@"%d",1]] objectForKey:[NSString stringWithFormat:@"%ld",(long)_a]]];
    NSLog(@"%@", titleArr2 );
    
    
    
    for (int i=0; i<titleArr2.count; i++) {
        
         _allArr=[[NSMutableArray alloc] init];
        
         _options=[NSMutableDictionary dictionaryWithCapacity:10] ;
        
    
        if ([[titleArr2 objectAtIndex:i]objectForKey:@"option"]) {
            
             NSMutableArray*opts=[[NSMutableArray alloc] init];
            
            
            NSLog(@"%@",_opts2);

        
        
           
            
//            if (_opts.count!=0) {
//                
//                
//                [opts addObject:[_opts objectAtIndex:i]];
// }
            
            
            
           
            if (_opts2.count!=0) {
                
                                opts=[_opts2 objectAtIndex:_c];
                
                //[opts addObject:[_opts2 objectAtIndex:_c] ];
                
                
                ++_c;
            
}
             [_options setObject:opts forKey:@"option"];
            [_allArr addObject: _options];

        
        }
        
        if ([[[titleArr2 objectAtIndex:i] objectForKey:@"title"]rangeOfString:@"#"].location!=NSNotFound) {
            
            [_texts setObject:@"if U mother Boom?" forKey:@"text"];
            [_allArr addObject: _texts];

        }
        
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (_a>1) {
            
            if ([_view2 viewWithTag:20]) {
                NSLog(@"2222222");
                
                
                NSLog(@"%@",[user objectForKey:@"21"]);
                
                if ([[user objectForKey:@"21"]intValue]==1) {
                    
                    if (_isok==0) {
                        
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您有未回答的题目" message:@"请回答完整" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
                        [alert show];
                        
                        
                        
                        return;
                        
                    }
                    

                }
               else if ([[user objectForKey:@"21"]intValue]==0) {
                   
                    if (_isok==1) {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请回答对应的问题" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
                    [alert show];
                    
                    return;
                    }
                    else{
                    
                        break;
                    }
                   
                   
                    
                }

                
                
                
            }
            
            
            if ([_view2 viewWithTag:22]) {
            
                if ([[user objectForKey:@"22"]intValue]==0) {
                
                    if (_isok==1) {
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请回答对应的问题" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
                        [alert show];
                        
                        return;
                    }
                    else{
                    
                        break;
                    }
                
                }
                else  if ([[user objectForKey:@"22"]intValue]==1){
                    
                     if (_isok==0) {
                         UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您有未回答的题目" message:@"请回答完整" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
                         [alert show];
                    return;
                }
                
                }
            
            
            }
            
            
            if ([_view2 viewWithTag:32]) {
                NSLog(@"2222222");
                
                
                NSLog(@"%@",[_view2 viewWithTag:32]);
                
                if ([[user objectForKey:@"32"]intValue]==1) {
                    
                    if (_isok==0) {
                        
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您有未回答的题目" message:@"请回答完整" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
                        [alert show];
                        
                        
                        
                        return;
                        
                    }
                    else{
                        if ([[user objectForKey:@"34"]intValue]==1){
                        
                            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请回答对应的问题" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
                            [alert show];
                            return;
                        
                        }
                    
                    
                    }
                    
                    
                    
                }
                else if ([[user objectForKey:@"32"]intValue]==0) {
                    
                    if (_isok==1) {
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请回答对应的问题" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
                        [alert show];
                        
                        return;
                    }
                    else{
                        
                        break;
                    }
                    
                    
                    
                }
                
                
                
                
            }

            
            
            
            if (_isok==0) {
                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您有未回答的题目" message:@"请回答完整" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
                [alert show];
                
                
                
                return;
                
            }
            

            
        }
        
        NSMutableDictionary*numDict=[NSMutableDictionary dictionaryWithCapacity:10] ;
        [numDict setObject:_allArr forKey:[[titleArr2 objectAtIndex:i]objectForKey:@"num"]] ;
        
        
        //[_allArr addObject:numDict];
        
        
        
        
        [_allArr2 addObject:numDict];
        
        
        
        
        NSLog(@"%@",_allArr2);



    }
    
    
    
    

    
        
        
    
    
     NSLog(@"%d",_isok);
    


    
    
    _optionArray2=[[NSMutableArray alloc]init];
   
    if (_answer.count!=0) {
        [_answer removeAllObjects];
    }
    ++_a;
    
    NSArray*views =_view2.subviews;
    for(UIView* view in views)
    {
        if (([view isKindOfClass:[UIButton class]]&&200==view.tag)) {
            
            
        }
        else{
           
            [view removeFromSuperview];
        }
        
    }
    
    
    if (_a>5) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB2"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        _step1.layer.contents = (id)image.CGImage;

    }
    if (_a>10) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB3"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        _step1.layer.contents = (id)image.CGImage;
    }
    
    
    
   
    NSArray*titleArr=[[NSArray alloc] initWithArray:[[_allDict objectForKey:[NSString stringWithFormat:@"%d",1]] objectForKey:[NSString stringWithFormat:@"%ld",(long)_a]]];
     NSLog(@"%@", titleArr );
    

    
    
    if (_a>25) {
        
        NSLog(@"222222222222");
        [_redayBtn setTitle:@"提交问卷" forState:UIControlStateNormal];
       
        
       
    }
    
   
    if (_a>26) {
//        NSDictionary *lc =@{@"2":@"2",@"3.1":@[@0,@1,@2],@"3.2":@[@0,@1,@2],@"4":@[@0,@1],@"5.1":@[@0,@1],@"5.2":@[@0,@1],@"5.3":@[@0,@1],@"6":@[@0,@1],@"7":@"123",@"8":@"234",@"9":@[@0,@1],@"10":@[@0,@1]};
        
       // NSMutableArray*bianhao=[[NSMutableArray alloc] init];
        NSDictionary*bianhao=@{@"bianhao":_keshiBianhao};
       // [bianhao addObject:bianhao1];
       // [bianhao setValue:@"bianhao" forKey:_keshiBianhao];
        
        [_allArr2 addObject:bianhao];
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                if ([[user objectForKey:@"wenjuan"]count]==0) {
                    _AllShuJu=[NSMutableArray arrayWithObject:_allArr2];
        
                    NSArray*arr1=[NSArray arrayWithArray:_allArr2];
                    [user setObject:arr1 forKey:@"wenjuan"];
                    [user synchronize];
                    NSLog(@"111111%@,222222222%@",_AllShuJu,arr1);
        
                }
        
                else{
                   // _arr2=[NSMutableArray arrayWithObjects:parameters,[user objectForKey:@"wenjuan"], nil];
                    _AllShuJu=[NSMutableArray arrayWithObject:_allArr2];
                    [_AllShuJu addObjectsFromArray:[user objectForKey:@"wenjuan"]];
        
        
                    NSArray*arr1=[NSArray arrayWithArray:_AllShuJu];
                    [user setObject:arr1 forKey:@"wenjuan"];
                    [user synchronize];
                    NSLog(@"111111%@,222222%@",_arr2,arr1);
                   
        
                
                }

        
        
        
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_allArr2 options:NSJSONWritingPrettyPrinted error:nil];
//        
//        NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        NSMutableDictionary *params = [NSMutableDictionary dictionary];
//        //        NSDictionary *parameters=[[NSDictionary alloc]init];
//        //        [parameters setValue:[NSString JSONStringWithNSDictionary:self.orderModel.cartCids] forKey:@"cids"];
//        //    NSDictionary *parameters2=@{@"1":[user objectForKey:@"wenjuan"][0],@"2":[user objectForKey:@"wenjuan"][1],@"3":[user objectForKey:@"wenjuan"][2],@"4":[user objectForKey:@"wenjuan"][3],@"5":[user objectForKey:@"wenjuan"][4]};
//        
//        params[@"diaoyan"] = str;
//        
//         NSLog(@"%@",str);
//        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//        sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
//
//        
//        
//        [sessionManager POST:@"http://netkq.webbsn.com/BD/main.php/AcceptData" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
//            NSLog(@"%lld", downloadProgress.totalUnitCount);
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@", responseObject);
//            
//            
//            
//            
//            
//            
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"%@",error);
//        }];

        

        
        
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您的问卷已成功提交" message:@"感谢您的参与" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alert show];

        [[self navigationController] popViewControllerAnimated:YES];

        return;
        
    }
  
   
    
    for (int i=0; i<titleArr.count; i++) {
        
        
//         _lb1.text=[[[NSString stringWithFormat:@"%@",[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"、"] stringByAppendingString:[titleArr[0]objectForKey:@"title"]];
        
        _optionArr=[NSMutableArray arrayWithArray:[[titleArr objectAtIndex:i]objectForKey:@"option"]];
       

        NSLog(@"%@",_optionArr);
       
        
        
       
       
        
        if ([[titleArr objectAtIndex:i]objectForKey:@"title"]) {
            
            if ([[[titleArr objectAtIndex:i]objectForKey:@"photo"]isEqualToString:@"1"]) {
                
                UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                
             
               
                [button setTitle:@"建议拍照" forState:UIControlStateNormal];
                [button addTarget:self action:@selector(takephoto:) forControlEvents:UIControlEventTouchUpInside];

                button.frame = CGRectMake(800.0, 40.0+i*130, 65.0, 30.0);
                
                _imageView=[[UIImageView alloc] initWithFrame:CGRectMake(870, 40+i*130, 30, 30)];
                [_imageView setBackgroundColor:[UIColor clearColor]];
                
                
                [_view2 addSubview:button];
                [_view2 addSubview:_imageView];
            
            
            }
            
            
            if ([[[titleArr objectAtIndex:i] objectForKey:@"title"]rangeOfString:@"#"].location!=NSNotFound) {
                
               
                
                _tihuanStr = [[[titleArr objectAtIndex:i] objectForKey:@"title"] stringByReplacingOccurrencesOfString:@"#" withString:@"            "];
                
                UILabel *lblType=[[UILabel alloc] initWithFrame:CGRectMake(35, 39+i*130, 870, 30)];
                
                
                
                [lblType setBackgroundColor:[UIColor clearColor]];
                
                [lblType setFont:[UIFont systemFontOfSize:17]];
                
                [lblType setTextColor:UIColorFromRGB(0x034f9a)];
                
                [lblType setText:[[[NSString stringWithFormat:@"%@",[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"、"] stringByAppendingString:_tihuanStr]];
                
                
                
                UITextField*textField =[[UITextField alloc]initWithFrame:CGRectMake(60, 69+i*160, 100, 30)];
                
                // 设置UITextField的样式
                textField.delegate=self;
                textField.borderStyle = UITextBorderStyleNone;
                
                // 文字对齐方式
                textField.textAlignment = NSTextAlignmentLeft;
                // 文字颜色
                textField.textColor = [UIColor blackColor];
                // 提示信息内容
                textField.placeholder = @"请输入...";
                // 字体
                textField.font = [UIFont fontWithName:@"Arial" size:20.0];
                
                [_view2 addSubview:textField];
                
                
                [_view2 addSubview:lblType];
                

                
            }
            else{
                
                if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"48"]) {
                    UILabel *lblType=[[UILabel alloc] initWithFrame:CGRectMake(35, 139+i*130, 870, 30)];
                    
                    [lblType setBackgroundColor:[UIColor clearColor]];
                    
                    [lblType setFont:[UIFont systemFontOfSize:17]];
                    
                    [lblType setTextColor:UIColorFromRGB(0x034f9a)];
                    
                    [lblType setText:[[[NSString stringWithFormat:@"%@",[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"、"] stringByAppendingString:[[titleArr objectAtIndex:i] objectForKey:@"title"]]];
                    
                    
                    [_view2 addSubview:lblType];
                }
                
//              else  if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"5-1"]) {
//                    UILabel *lblType=[[UILabel alloc] initWithFrame:CGRectMake(35, 139, 870, 30)];
//                    
//                    [lblType setBackgroundColor:[UIColor clearColor]];
//                    
//                    [lblType setFont:[UIFont systemFontOfSize:17]];
//                    
//                    [lblType setTextColor:UIColorFromRGB(0x034f9a)];
//                    
//                    [lblType setText:[[[NSString stringWithFormat:@"%@",[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"、"] stringByAppendingString:[[titleArr objectAtIndex:i] objectForKey:@"title"]]];
//                    
//                    
//                    [_view2 addSubview:lblType];
//                }

                else{
                
                
                
            
            UILabel *lblType=[[UILabel alloc] initWithFrame:CGRectMake(35, 39+i*130, 870, 44)];
            
            [lblType setBackgroundColor:[UIColor clearColor]];
            
            [lblType setFont:[UIFont systemFontOfSize:16]];
            
            [lblType setTextColor:UIColorFromRGB(0x034f9a)];
                    
                    lblType.textAlignment = NSTextAlignmentLeft;
                    //lblType.lineBreakMode = UILineBreakModeWordWrap;
                    lblType.numberOfLines = 0; // 关键一句
                    NSString*a=[[[NSString stringWithFormat:@"%@",[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"、"] stringByAppendingString:[[titleArr objectAtIndex:i] objectForKey:@"title"]];
                    NSLog(@"%@",a);
                    
                    
                   NSString*b=[a stringByReplacingOccurrencesOfString:@"/n" withString:@"\n"];
                    NSLog(@"%@",b);
            
            [lblType setText:b];
                    
                   
            
            [_view2 addSubview:lblType];
                }
                
                
            }
            if ([[titleArr objectAtIndex:i]objectForKey:@"option"]) {
                
                
              
                
//               NSMutableArray*opts=[[NSMutableArray alloc] initWithObjects:@"A",@"B",@"F#nimasile", nil];
              
             // [_options setObject:opts forKey:@"option"];
//               [_allArr addObject: _options];
//                NSLog(@"%d",i);
//                
//                if (_opts2.count!=0) {
//                    NSMutableArray*opts=[[NSMutableArray alloc] init];
//                    
//                    opts=[_opts2 objectAtIndex:0];
//                    [_opts2 removeObjectAtIndex:0];
//                    
//                    NSLog(@"%@,%@",_opts2,opts);
//                    
//                        [_options setObject:opts forKey:@"option"];
//                        [_allArr addObject: _options];
//                    
//                   
//                }
                
                
                if (![[[titleArr objectAtIndex:i]objectForKey:@"rule"]isEqualToString:@""]) {
                    
                    NSLog(@"1111");
                    
                }
                
                NSInteger b;
                b=[[[titleArr objectAtIndex:i] objectForKey:@"newline"] intValue];
              
                NSLog(@"%ld",(long)b);
                
               
                
                // NSLog(@"%@",[[titleArr objectAtIndex:i]objectForKey:@"option"]);
                NSLog(@"%d",i);
                
               
                
                
                _optionArray=[[NSMutableArray alloc]init];
                
                
                
                for (int j=0; j<_optionArr.count; j++) {
                    
                    //        float x = i%5;
                    //
                    //        float y = i/5;
                    
                    if ([[[titleArr objectAtIndex:i]objectForKey:@"newline"]isEqualToString:@""]) {
                        NSLog(@"不用换行！");
                       
                        if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"48"]){
                            
                            NSInteger index = j % _optionArr.count;
                            
                            
                            SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index*(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2)+Start_Y2+i*130+80, Button_Width2+80, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                            
                            
                            
                            
                            [cb setText:[_optionArr objectAtIndex:j]];
                            
                             cb.tag=[[[titleArr objectAtIndex:i]objectForKey:@"num"] integerValue];
                            
                            [_optionArray addObject:cb];
                            if ([[[titleArr objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"radio" ]) {
                                [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                            }
                            else{
                                
                                [cb setStateChangedTarget:self selector:@selector(checkBoxView2:)];
                                
                            }
                            
                            
                            NSLog(@"%@",_optionArray);
                            
                            [_view2 addSubview:cb];
                            
                            
                            
                        }
                      
                        else{

                        
                         NSInteger index = j % _optionArr.count;
                        
                        
                        SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index*(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2)+Start_Y2+i*130, Button_Width2+80, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                       
                        
                       
                        
                        [cb setText:[_optionArr objectAtIndex:j]];
                        
                        if ([[_optionArr objectAtIndex:j]rangeOfString:@"#"].location!=NSNotFound) {
                        
                            UITextField*textField =[[UITextField alloc]initWithFrame:CGRectMake(index*(Button_Width2 + Width_Space2) + Start_X2+20,  (Button_Height2 + Height_Space2)+Start_Y2+i*130+35, Button_Width2+80, Button_Height2) ];
                            
                            // 设置UITextField的样式
                            textField.delegate=self;
                            textField.borderStyle = UITextBorderStyleNone;
                            
                            // 文字对齐方式
                            textField.textAlignment = NSTextAlignmentLeft;
                            // 文字颜色
                            textField.textColor = [UIColor blackColor];
                            // 提示信息内容
                            textField.placeholder = @"请输入...";
                            // 字体
                            textField.font = [UIFont fontWithName:@"Arial" size:20.0];
                            
                            [_view2 addSubview:textField];
                        
                        
                        }
                        cb.tag=[[[titleArr objectAtIndex:i]objectForKey:@"num"] integerValue];
                        
                        [_optionArray addObject:cb];
                        if ([[[titleArr objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"radio" ]) {
                            [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                        }
                        else{
                            
                            [cb setStateChangedTarget:self selector:@selector(checkBoxView2:)];
                            
                        }
                        
                        
                        NSLog(@"%@",_optionArray);
                      
                        [_view2 addSubview:cb];
                        
                        }
                       

                        
                       
                        
                        

                    }
                    else{
                        
                        if ([[[titleArr objectAtIndex:i]objectForKey:@"newline"]isEqualToString:@"1"]) {
                            NSInteger index = j % b;
                            NSInteger page = j/b;
                            SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2) + Start_X2, page  * (Button_Height2 + Height_Space2)+Start_Y2+i*130, Button_Width2+250, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                            // [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                            
                            [cb setText:[_optionArr objectAtIndex:j]];
                            
                            
                            if ([[_optionArr objectAtIndex:j]rangeOfString:@"#"].location!=NSNotFound) {
                                
                                UITextField*textField =[[UITextField alloc]initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2)+470 + Start_X2, page  * (Button_Height2 + Height_Space2)+Start_Y2+5+i*130, Button_Width2+250, Button_Height2) ];
                                
                                // 设置UITextField的样式
                                textField.delegate=self;
                                textField.borderStyle = UITextBorderStyleNone;
                                
                                // 文字对齐方式
                                textField.textAlignment = NSTextAlignmentLeft;
                                // 文字颜色
                                textField.textColor = [UIColor blackColor];
                                // 提示信息内容
                                textField.placeholder = @"请输入...";
                                // 字体
                                textField.font = [UIFont fontWithName:@"Arial" size:20.0];
                                
                                [_view2 addSubview:textField];
                                
                                
                            }

                            [_optionArray addObject:cb];
                            
                            if ([[[titleArr objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"radio" ]) {
                                [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                            }
                            else{
                                
                                [cb setStateChangedTarget:self selector:@selector(checkBoxView2:)];
                                
                            }
                            NSLog(@"%@",_optionArray);
                            
                            cb.tag=[[[titleArr objectAtIndex:i]objectForKey:@"num"] integerValue];
                            
                            [_view2 addSubview:cb];
                        }
                        
                      else  if ([[[titleArr objectAtIndex:i]objectForKey:@"newline"]isEqualToString:@"2"]) {
                            NSInteger index = j % b;
                            NSInteger page = j/b;
                            SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2+90) + Start_X2, page  * (Button_Height2 + Height_Space2)+Start_Y2+i*130, Button_Width2+200, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                            // [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                            
                            [cb setText:[_optionArr objectAtIndex:j]];
                            [_optionArray addObject:cb];
                          
                          if ([[_optionArr objectAtIndex:j]rangeOfString:@"#"].location!=NSNotFound) {
                              
                              UITextField*textField =[[UITextField alloc]initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2+90) + Start_X2, page  * (Button_Height2 + Height_Space2)+Start_Y2+i*130+40, Button_Width2+200, Button_Height2)];
                              
                              // 设置UITextField的样式
                              textField.delegate=self;
                              textField.borderStyle = UITextBorderStyleNone;
                              
                              // 文字对齐方式
                              textField.textAlignment = NSTextAlignmentLeft;
                              // 文字颜色
                              textField.textColor = [UIColor blackColor];
                              // 提示信息内容
                              textField.placeholder = @"请输入...";
                              // 字体
                              textField.font = [UIFont fontWithName:@"Arial" size:20.0];
                              
                              [_view2 addSubview:textField];
                              
                              
                          }
                          

                            
                            if ([[[titleArr objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"radio" ]) {
                                [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                            }
                            else{
                                
                                [cb setStateChangedTarget:self selector:@selector(checkBoxView2:)];
                                
                            }
                            NSLog(@"%@",_optionArray);
                            
                            cb.tag=[[[titleArr objectAtIndex:i]objectForKey:@"num"] integerValue];
                            
                            [_view2 addSubview:cb];
                        }
                        
                      else  if ([[[titleArr objectAtIndex:i]objectForKey:@"newline"]isEqualToString:@"3"]) {
                          NSInteger index = j % b;
                          NSInteger page = j/b;
                          SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2+50) + Start_X2, page  * (Button_Height2 + Height_Space2)+Start_Y2+i*130, Button_Width2+100, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                          // [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                          
                          [cb setText:[_optionArr objectAtIndex:j]];
                          [_optionArray addObject:cb];
                          
                          if ([[_optionArr objectAtIndex:j]rangeOfString:@"#"].location!=NSNotFound) {
                              
                              UITextField*textField =[[UITextField alloc]initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2+75) + Start_X2, page  * (Button_Height2 + Height_Space2+40)+Start_Y2+i*130, Button_Width2+100, Button_Height2)];
                              
                              // 设置UITextField的样式
                              textField.delegate=self;
                              textField.borderStyle = UITextBorderStyleNone;
                              
                              // 文字对齐方式
                              textField.textAlignment = NSTextAlignmentLeft;
                              // 文字颜色
                              textField.textColor = [UIColor blackColor];
                              // 提示信息内容
                              textField.placeholder = @"请输入...";
                              // 字体
                              textField.font = [UIFont fontWithName:@"Arial" size:20.0];
                              
                              [_view2 addSubview:textField];
                              
                              
                          }

                          
                          if ([[[titleArr objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"radio" ]) {
                              [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                          }
                          else{
                              
                              [cb setStateChangedTarget:self selector:@selector(checkBoxView2:)];
                              
                          }
                          NSLog(@"%@",_optionArray);
                          
                          cb.tag=[[[titleArr objectAtIndex:i]objectForKey:@"num"] integerValue];
                          
                          [_view2 addSubview:cb];
                      }
                        
                      

                        else{
                            if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"46"]) {
                                NSLog(@"111111");
                                NSInteger index = j % b;
                                NSInteger page = j/b;
                                SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2-80) + Start_X2, page  * (Button_Height2 + Height_Space2+150)+Start_Y2+200, Button_Width2, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                                // [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                                
                                [cb setText:[_optionArr objectAtIndex:j]];
                                
                                if ([[_optionArr objectAtIndex:j]rangeOfString:@"#"].location!=NSNotFound) {
                                    
                                    NSLog(@"hahahaahah");
                                    
                                    
                                }
                                
                                [_optionArray addObject:cb];
                                
                                if ([[[titleArr objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"radio" ]) {
                                    [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                                }
                                else{
                                    
                                    [cb setStateChangedTarget:self selector:@selector(checkBoxView2:)];
                                    
                                }
                                NSLog(@"%@",_optionArray);
                                
                                cb.tag=[[[titleArr objectAtIndex:i]objectForKey:@"num"] integerValue];
                                
                                [_view2 addSubview:cb];
                                
                            }
                
                            else{
                        
                    NSInteger index = j % b;
                    NSInteger page = j/b;
                    SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2) + Start_X2, page  * (Button_Height2 + Height_Space2)+Start_Y2+i*180, Button_Width2+80, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                        // [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                    
                    [cb setText:[_optionArr objectAtIndex:j]];
                            
                            if ([[_optionArr objectAtIndex:j]rangeOfString:@"#"].location!=NSNotFound) {
                                
                                NSLog(@"hahahaahah");
                                
                                
                            }

                         [_optionArray addObject:cb];
                        
                        if ([[[titleArr objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"radio" ]) {
                            [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                        }
                        else{
                            
                            [cb setStateChangedTarget:self selector:@selector(checkBoxView2:)];
                            
                        }
                         NSLog(@"%@",_optionArray);
                        
                        cb.tag=[[[titleArr objectAtIndex:i]objectForKey:@"num"] integerValue];
            
                    [_view2 addSubview:cb];
                            }
                        }
                        

                        
                    }
                    
                    
                    if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"36"]) {
                        NSLog(@"有照片！！！！");
                        NSInteger index = j % _optionArr.count;
                        
                        UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(index *(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2+200)+Start_Y2, Button_Width2+20, Button_Height2+160)];
                        NSString*urlStr=[[NSString alloc]init];
                        urlStr=[[[[URLStr stringByAppendingString:[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"."]stringByAppendingString:[NSString stringWithFormat:@"%d",j+1]] stringByAppendingString:@".png"];
                        
                        NSLog(@"%@",urlStr);
                        
                        NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
                        UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
                        NSLog(@"%@",url);
                        
                        imgView.image=image;
                        [_view2 addSubview:imgView];
}
                    
                    
                    
                    if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"46"]) {
                        NSLog(@"有照片！！！！");
                        NSInteger index = j % _optionArr.count;
                        
                        UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(index *(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2)+Start_Y2+40, Button_Width2-70, Button_Height2+50)];
                        NSString*urlStr=[[NSString alloc]init];
                        urlStr=[[[[URLStr stringByAppendingString:[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"."]stringByAppendingString:[NSString stringWithFormat:@"%d",j+1]] stringByAppendingString:@".png"];
                        
                        NSLog(@"%@",urlStr);
                        
                        NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
                        UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
                        NSLog(@"%@",url);
                        
                        imgView.image=image;
                        [_view2 addSubview:imgView];
                    }
                    if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"47"]) {
                        NSLog(@"有照片！！！！");
                        NSInteger index = j % _optionArr.count;
                        
                        UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(index *(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2)+Start_Y2+40, Button_Width2-80, Button_Height2+50)];
                        NSString*urlStr=[[NSString alloc]init];
                        urlStr=[[[[URLStr stringByAppendingString:[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"."]stringByAppendingString:[NSString stringWithFormat:@"%d",j+1]] stringByAppendingString:@".png"];
                        
                        NSLog(@"%@",urlStr);
                        
                        NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
                        UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
                        NSLog(@"%@",url);
                        
                        imgView.image=image;
                        [_view2 addSubview:imgView];
                    }

                    
                    
//                        if ([[[titleArr objectAtIndex:i]objectForKey:@"img"]isEqualToString:@"1"]) {
//                            
//                            NSLog(@"222222");
//                            
//                            NSInteger index = j % _optionArr.count;
//                            
//                            UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(index *(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2+200)+Start_Y2, Button_Width2+20, Button_Height2+160)];
//                            NSString*urlStr=[[NSString alloc]init];
//                            urlStr=[[[[URLStr stringByAppendingString:[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"."]stringByAppendingString:[NSString stringWithFormat:@"%d",j+1]] stringByAppendingString:@".png"];
//                            
//                            NSLog(@"%@",urlStr);
//                            
//                            NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
//                            UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
//                            NSLog(@"%@",url);
//
//                            imgView.image=image;
//                            [_view2 addSubview:imgView];
//                            
//
//                            
//                            
//                        }
//                        else if ([[[titleArr2 objectAtIndex:i]objectForKey:@"img"]isEqualToString:@"3"]){
//                            
//                            NSLog(@"33333");
//                            
//                            
//                            
//                        }
//                        
//                        else if ([[[titleArr2 objectAtIndex:i]objectForKey:@"img"]isEqualToString:@"2"]){
//                            
//                            
//                            NSLog(@"222222");
//                            
//                            
//                        }
                        
                    
                
                
                
                [_optionArray2 addObject:_optionArray ];
                
                  NSLog(@"%@",_optionArray2);
                
                
//                for(int i=0;i<[[_optionArray2 objectAtIndex:i] count];i++)
//                {
//                    
//                    SSCheckBoxView* pp=[_optionArray2 objectAtIndex:i];
//                    
//                    if(pp.checked==1)
//                    {
//                        
//                        
//                    }
//                }
                
                
                
        
            
            }
                
                if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"40"]) {
                    NSLog(@"有照片！！！！");
                   // NSInteger index = j % _optionArr.count;
                    
                    UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(30, 180, 500, 350)];
                    NSString*urlStr=[[NSString alloc]init];
                    urlStr=[[URLStr stringByAppendingString:[titleArr[i]objectForKey:@"num"] ]stringByAppendingString:@".png"];
                    
                    NSLog(@"%@",urlStr);
                    
                    NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
                    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
                    NSLog(@"%@",url);
                    
                    imgView.image=image;
                    [_view2 addSubview:imgView];
                    
                    
                }
                
                if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"55"]) {
                    NSLog(@"有照片！！！！");
                   // NSInteger index = j % _optionArr.count;
                    
                    UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(30, 400, 200, 200)];
                    NSString*urlStr=[[NSString alloc]init];
                    urlStr=[[URLStr stringByAppendingString:[titleArr[i]objectForKey:@"num"] ]stringByAppendingString:@".png"];
                    
                    NSLog(@"%@",urlStr);
                    
                    NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
                    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
                    NSLog(@"%@",url);
                    
                    imgView.image=image;
                    [_view2 addSubview:imgView];
                }

                
                if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"21"]) {
                    NSLog(@"有照片！！！！");
                    // NSInteger index = j % _optionArr.count;
                    
                    UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(30, 300, 500, 300)];
                    NSString*urlStr=[[NSString alloc]init];
                    urlStr=[[URLStr stringByAppendingString:[titleArr[i]objectForKey:@"num"] ]stringByAppendingString:@".png"];
                    
                    NSLog(@"%@",urlStr);
                    
                    NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
                    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
                    NSLog(@"%@",url);
                    
                    imgView.image=image;
                    [_view2 addSubview:imgView];
                    
                    
                }
                if ([[[titleArr objectAtIndex:i]objectForKey:@"num"]isEqualToString:@"30"]) {
                    NSLog(@"有照片！！！！");
                    // NSInteger index = j % _optionArr.count;
                    
                    UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(350, 200, 100, 100)];
                    NSString*urlStr=[[NSString alloc]init];
                    urlStr=[[URLStr stringByAppendingString:[titleArr[i]objectForKey:@"num"] ]stringByAppendingString:@".png"];
                    
                    NSLog(@"%@",urlStr);
                    
                    NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
                    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
                    NSLog(@"%@",url);
                    
                    imgView.image=image;
                    [_view2 addSubview:imgView];
                    
                    
                }


            
            
            
}

        
        
        
        
    
       
        
        
       
        
        
        
        
        
        
        
        
        
}
   
    

    
    
    
    }
}


- (void)next2:(id)sender {
    
    ++_b;
    NSLog(@"%ld",(long)_b);
    
    NSArray*views =_view3.subviews;
    for(UIView* view in views)
    {
        if (([view isKindOfClass:[UIButton class]]&&300==view.tag)) {
            
            
        }
        else{
            
            [view removeFromSuperview];
        }
        
    }

    if (_b>3) {
        
        NSLog(@"222222222222");
        [_btn setTitle:@"提交问卷" forState:UIControlStateNormal];
        //[[self navigationController] popViewControllerAnimated:YES];
        
        
    }
    if (_b>4) {
        [[self navigationController] popViewControllerAnimated:YES];
        return;

    }

    NSArray* titleArr2=[[NSArray alloc] initWithArray:[[_allDict2 objectForKey:[NSString stringWithFormat:@"%d",4]] objectForKey:[NSString stringWithFormat:@"%ld",(long)_b]]];
    NSLog(@"%@", titleArr2 );
    

    for (int i=0; i<titleArr2.count; i++) {
        
        
        //         _lb1.text=[[[NSString stringWithFormat:@"%@",[titleArr[i]objectForKey:@"num"]]stringByAppendingString:@"、"] stringByAppendingString:[titleArr[0]objectForKey:@"title"]];
        
        
        
        if ([[titleArr2 objectAtIndex:i]objectForKey:@"title"]) {
            
            if ([[[titleArr2 objectAtIndex:i]objectForKey:@"photo"]isEqualToString:@"1"]) {
                
                UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                
                
                
                [button setTitle:@"建议拍照" forState:UIControlStateNormal];
                button.frame = CGRectMake(800.0, 40.0+i*130, 80.0, 30.0);
                [_view3 addSubview:button];
                
                
            }
            
            
            
            UILabel *lblType=[[UILabel alloc] initWithFrame:CGRectMake(35, 39+i*130, 870, 30)];
            
            [lblType setBackgroundColor:[UIColor clearColor]];
            
            [lblType setFont:[UIFont systemFontOfSize:17]];
            
            [lblType setTextColor:UIColorFromRGB(0x034f9a)];
            
            [lblType setText:[[[NSString stringWithFormat:@"%@",[titleArr2[i]objectForKey:@"num"]]stringByAppendingString:@"、"] stringByAppendingString:[[titleArr2 objectAtIndex:i] objectForKey:@"title"]]];
            
            
            [_view3 addSubview:lblType];
            
            
            if ([[titleArr2 objectAtIndex:i]objectForKey:@"option"]) {
                
                
                if ([[titleArr2 objectAtIndex:i]objectForKey:@"rule"]) {
                    
                    NSLog(@"1111");
                    
                }
                
                NSInteger b;
                b=[[[titleArr2 objectAtIndex:i] objectForKey:@"newline"] intValue];
                
                NSLog(@"%ld",(long)b);
                
                _optionArr=[NSMutableArray arrayWithArray:[[titleArr2 objectAtIndex:i]objectForKey:@"option"]];
                
                
                // NSLog(@"%@",[[titleArr objectAtIndex:i]objectForKey:@"option"]);
                
                
                for (int j=0; j<_optionArr.count; j++) {
                    
                    //        float x = i%5;
                    //
                    //        float y = i/5;
                    
                    if ([[[titleArr2 objectAtIndex:i]objectForKey:@"newline"]isEqualToString:@""]) {
                        NSLog(@"不用换行！");
                        
                        NSInteger index = j % _optionArr.count;
                        
                        
                        SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index*(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2)+Start_Y2+i*130, Button_Width2, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                        [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                        
                        [cb setText:[_optionArr objectAtIndex:j]];
                        cb.tag=[[[titleArr2 objectAtIndex:i]objectForKey:@"num"] intValue];
                        
                        [_optionArray addObject:cb];
                        
                        
                        
                        [_view3 addSubview:cb];
                        
                        
                        
                        
                        
                        
                    }
                    else{
                        NSInteger index = j % b;
                        NSInteger page = j/b;
                        SSCheckBoxView*cb =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width2 + Width_Space2) + Start_X2, page  * (Button_Height2 + Height_Space2)+Start_Y2+i*130, Button_Width2, Button_Height2) style:kSSCheckBoxViewStyleMono checked:NO];
                        [cb setStateChangedTarget:self selector:@selector(checkBoxView:)];
                        
                        [cb setText:[_optionArr objectAtIndex:j]];
                        [_optionArray addObject:cb];
                        
                        
                        cb.tag=[[[titleArr2 objectAtIndex:i]objectForKey:@"num"] intValue];
                        
                        [_view3 addSubview:cb];
                        
                        
                        
                        
                    }
                    
                    
                    if (![[[titleArr2 objectAtIndex:i]objectForKey:@"img"]isEqualToString:@""]) {
                        NSLog(@"有照片！！！！");
                        
                        
                        if ([[[titleArr2 objectAtIndex:i]objectForKey:@"img"]isEqualToString:@"1"]) {
                            
                            NSInteger index = j % _optionArr.count;
                            
                            UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(index*(Button_Width2 + Width_Space2) + Start_X2,  (Button_Height2 + Height_Space2)+Start_Y2, Button_Width2, Button_Height2)];
                            NSString*urlStr=[[NSString alloc]init];
                            urlStr=[[URLStr stringByAppendingString:[titleArr2[i]objectForKey:@"num"]]stringByAppendingString:@".png"];
                            
                            NSLog(@"%@",urlStr);
                            
                            NSURL *url = [NSURL URLWithString: urlStr];// 获取的图片地址
                            UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
                            imgView.image=image;
                            [_view3 addSubview:imgView];
                            
                             NSLog(@"111111");
                            
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                
                
                
            }
            
            
            
        }
        
        
        
        
        
        NSMutableDictionary*numDict=[NSMutableDictionary dictionaryWithCapacity:10] ;
        [numDict setObject:[[titleArr2 objectAtIndex:i]objectForKey:@"num"] forKey:@"num"] ;
        
        
        
        
        NSLog(@"%@",numDict);
        
        
        
        
        
        
    }



}
-(void)checkBoxView:(SSCheckBoxView*)cbv
{
    NSLog(@"%@",_optionArray2);
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
    if (cbv.tag==20) {
        NSLog(@"????");
        
        if (cbv.checked==YES&& [cbv.textLabel.text isEqualToString:@"是"]) {
            NSLog(@"1234567");
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setBool:YES forKey:@"21"];
            [user synchronize];

        }
        else if (cbv.checked==NO&& [cbv.textLabel.text isEqualToString:@"是"]){
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user removeObjectForKey:@"21"];
            [user synchronize];
             NSLog(@"7654321");
        }
         if (cbv.checked==YES&& [cbv.textLabel.text isEqualToString:@"否"]){
        
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
              [user setBool:YES forKey:@"22"];
            [user synchronize];
              NSLog(@"1234567");
        
        }
         else  if (cbv.checked==NO&& [cbv.textLabel.text isEqualToString:@"否"]){
             NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
             [user removeObjectForKey:@"22"];
             [user synchronize];
              NSLog(@"7654321");
         }
        
    }
    
    if (cbv.tag==31) {
        NSLog(@"????");
        
        if (cbv.checked==YES&& [cbv.textLabel.text isEqualToString:@"是"]) {
            NSLog(@"1234567");
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setBool:YES forKey:@"34"];
            [user synchronize];
            
        }
        else if (cbv.checked==NO&& [cbv.textLabel.text isEqualToString:@"是"]){
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user removeObjectForKey:@"34"];
            [user synchronize];
            NSLog(@"7654321");
        }
        if (cbv.checked==YES&& [cbv.textLabel.text isEqualToString:@"否"]){
            
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setBool:YES forKey:@"32"];
            [user synchronize];
            NSLog(@"1234567");
            
        }
        else  if (cbv.checked==NO&& [cbv.textLabel.text isEqualToString:@"否"]){
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user removeObjectForKey:@"32"];
            [user synchronize];
            NSLog(@"7654321");
        }
        
    }

    

    
    int i = 0;
    for (SSCheckBoxView *checkboxView in _optionArray) {
        if (checkboxView.checked)
        {
            i++;
        }
        
    }
    
    
    if (i > 1) {
        
        cbv.checked=NO;
        NSLog(@"?????");
        
    }

   
    
}

-(void)checkBoxView2:(SSCheckBoxView*)cbv{

    NSLog(@"多选！！！");

}

- (IBAction)segGo:(id)sender {
    
    NSInteger Index = _seg.selectedSegmentIndex;
    
    switch (Index) {
            
        case 0:{
            
            [_view2 setHidden:NO];
            [_view3 setHidden:YES];
            
            _step1.hidden=NO;
            _step2.hidden=YES;
            
            break;
        }
        case 1:{
            
            _step2.hidden=NO;
            _step1.hidden=YES;
            
            NSString *path = [[NSBundle mainBundle]pathForResource:@"采血耗材-检测仪器"ofType:@"png"];
            UIImage *image = [UIImage imageWithContentsOfFile:path];
            
            _step2.layer.contents = (id)image.CGImage;
            
        
           
            [_view2 setHidden:YES];
            [_view3 setHidden:NO];
            
}
              default:
            break;
            
    }

}



- (void)takephoto:(id)sender {
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!isCamera) { //若不可用，弹出警告框
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"无可用摄像头" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    /**
     *      UIImagePickerControllerSourceTypePhotoLibrary  ->所有资源文件夹
     UIImagePickerControllerSourceTypeCamera        ->摄像头
     UIImagePickerControllerSourceTypeSavedPhotosAlbum ->内置相册
     */
    imagePicker.delegate = self;    //设置代理，遵循UINavigationControllerDelegate,UIImagePickerControllerDelegate协议
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    /* 此处info 有六个值
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     * UIImagePickerControllerMediaURL;       // an NSURL
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     */
    // 保存图片至本地，方法见下文
    [self saveImage:image withName:@"currentImage.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    _isFullScreen = NO;
    [self.imageView setImage:savedImage];
    
    self.imageView.tag = 100;
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    _isFullScreen = !_isFullScreen;
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:_view2];
    
    CGPoint imagePoint = self.imageView.frame.origin;
    //touchPoint.x ，touchPoint.y 就是触点的坐标
    
    // 触点在imageView内，点击imageView时 放大,再次点击时缩小
    if(imagePoint.x <= touchPoint.x && imagePoint.x +self.imageView.frame.size.width >=touchPoint.x && imagePoint.y <=  touchPoint.y && imagePoint.y+self.imageView.frame.size.height >= touchPoint.y)
    {
        // 设置图片放大动画
        [UIView beginAnimations:nil context:nil];
        // 动画时间
        [UIView setAnimationDuration:1];
        
        if (_isFullScreen) {
            // 放大尺寸
            
            self.imageView.frame = CGRectMake(50, 0, 800, 480);
        }
        else {
            // 缩小尺寸
            self.imageView.frame = CGRectMake(870, 40+260, 30, 30);
        }
        
        // commit动画
        [UIView commitAnimations];
        
    }
    
}
@end

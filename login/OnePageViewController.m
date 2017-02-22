//
//  OnePageViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/2.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "OnePageViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "TwoViewController.h"
@interface OnePageViewController ()
@property(nonatomic,strong)TwoViewController*two;
@property(nonatomic)bool isFullScreen;
@end
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define Start_X 66.0f           // 第一个按钮的X坐标
#define Start_Y 300.0f           // 第一个按钮的Y坐标
#define Width_Space 19.0f        // 2个按钮之间的横间距
#define Height_Space 10.0f      // 竖间距
#define Button_Height 30.0f    // 高
#define Button_Width 100.0f      // 宽

#define RgbHex2UIColor(r, g, b)                 [UIColor colorWithRed:((r) / 256.0) green:((g) / 256.0) blue:((b) / 256.0) alpha:1.0]

@implementation OnePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(nextBtnClick)];
    
//    _textLb3.delegate=self;
    NSUserDefaults*anquan=[NSUserDefaults standardUserDefaults];
    [anquan removeObjectForKey:@"anquan"];
    [anquan synchronize];
    

     NSLog(@"%@",[anquan objectForKey:@"anquan"]);
    
    
     NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
    _keshi.text=[keshi objectForKey:@"keshi"];
    
    
    _chooseArray1=[[NSMutableArray alloc] init];
    _chooseArray2=[[NSMutableArray alloc] init];
    _chooseArray3=[[NSMutableArray alloc] init];
    _chooseArray4=[[NSMutableArray alloc] init];
    _chooseArray5=[[NSMutableArray alloc] init];
    _chooseArray6=[[NSMutableArray alloc] init];
     _chooseArray7=[[NSMutableArray alloc] init];
    _view1.layer.masksToBounds = YES;
    _view1.layer.cornerRadius = 4.0;
    _view1.layer.borderWidth = 1.0;
    _view1.layer.borderColor = [[UIColor clearColor] CGColor];
    _view2.layer.masksToBounds = YES;
    _view2.layer.cornerRadius = 6.0;
    _view2.layer.borderWidth = 1.0;
    
    _view3.layer.masksToBounds = YES;
    _view3.layer.cornerRadius = 4.0;
    _view3.layer.borderWidth = 1.0;
    _view3.layer.borderColor = [[UIColor clearColor] CGColor];

    _view2.layer.borderColor = [[UIColor clearColor] CGColor];
    
    [_label1 setTextColor:UIColorFromRGB(0x034f9a)];
    [_label2 setTextColor:UIColorFromRGB(0x034f9a)];
    [_label3 setTextColor:UIColorFromRGB(0x034f9a)];
    [_label4 setTextColor:UIColorFromRGB(0x034f9a)];
    
//    UIButton*button = [UIButton buttonWithType:UIButtonTypeSystem];
//    //UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
//    CGRect huge =CGRectMake(0, 0, 60, 44);
//    
//    [button setFrame:huge ];
//    
//                [button setTitle:@"<返回" forState:UIControlStateNormal];
//    
//              // [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//                [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
//    
//               self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(back:)];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        _label1.text=@"2.Number of beds:";
        _label2.text=@"3.Arterial blood collection consumables used in the department";
        _label3.text=@"3.1 Syringe specification (multiple choice):";
        _label4.text=@"3.2 Brand of arterial blood sampler and specifications(multiple choice)";
       // [_photoBtn setTitle:@"Photographing is recommended" forState:UIControlStateNormal];
        [_photoBtn setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];
        _photoBtn.lineBreakMode = 1;
        
        [_next setImage:[UIImage imageNamed:@"继续答题英文.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"英文"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        
        
//        UIButton*button = [UIButton buttonWithType:UIButtonTypeSystem];
//        //UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
//        CGRect huge =CGRectMake(0, 0, 100, 50);
//        
//        [button setFrame:huge ];
//        [button setTitle:@"< Return" forState:UIControlStateNormal];
//        //[button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
//        
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Return"
                                                                                style:UIBarButtonItemStylePlain
                                                                               target:self
                                                                               action:@selector(back:)];
       
        
       
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;

       
        [_seg setTitle:@"Within-department survey" forSegmentAtIndex:0];
         [_seg setTitle:@"Laboratory survey" forSegmentAtIndex:1];
        
        

    }
    else{
      [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB1"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        [_photoBtn setImage:[UIImage imageNamed:@"建议拍照.png"] forState:UIControlStateNormal];

    }

    
    
    
#pragma 第一个问题
    
//    NSMutableArray*oneArray=[[NSMutableArray alloc] initWithObjects:@"1ml",@"1ml",@"1ml",@"1ml",@"1ml",@"1ml",@"1.5ml",@"1.5ml",@"1.5ml",@"1.5ml",@"1.5ml",@"1.5ml",@"2ml",@"2ml",@"2ml",@"2ml",@"2ml",@"2ml",@"2.5ml",@"2.5ml",@"2.5ml",@"2.5ml",@"2.5ml",@"2.5ml",@"3ml",@"3ml",@"3ml",@"3ml",@"3ml",@"3ml",nil];
    
  NSMutableArray*oneArray=[[NSMutableArray alloc] initWithObjects:@"1ml",@"1.5ml",@"2ml",@"2.5ml",@"3ml",nil];
    
    
        for (int i=0; i<oneArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
     
        NSInteger index = i % 1;
        NSInteger page = i / 1;
            
           

        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height) style:kSSCheckBoxViewStyleBox checked:NO];
        NSString *a1 = [oneArray objectAtIndex:i];

        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change1:)];
            
            [_chooseArray2 addObject:cb];
           
            
        [_view2 addSubview:cb];
 }
    
    NSMutableArray*twoArray2=[[NSMutableArray alloc] initWithObjects:@"1ml",@"1.5ml",@"2ml",@"2.5ml",@"3ml",nil];
    
    
    for (int i=0; i<twoArray2.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        NSInteger index = i % 1;
        NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X+119, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height) style:kSSCheckBoxViewStyleBox checked:NO];
        NSString *a1 = [twoArray2 objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change1:)];
        
        [_chooseArray3 addObject:cb];
        
        
        [_view2 addSubview:cb];
    }
    
    NSMutableArray*threeArray=[[NSMutableArray alloc] initWithObjects:@"1ml",@"1.5ml",@"2ml",@"2.5ml",@"3ml",nil];
    
    
    for (int i=0; i<threeArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        NSInteger index = i % 1;
        NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X+119+119, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height) style:kSSCheckBoxViewStyleBox checked:NO];
        NSString *a1 = [threeArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change1:)];
        
        [_chooseArray4 addObject:cb];
        
        
        [_view2 addSubview:cb];
    }
    
    NSMutableArray*fourArray=[[NSMutableArray alloc] initWithObjects:@"1ml",@"1.5ml",@"2ml",@"2.5ml",@"3ml",nil];
    
    
    for (int i=0; i<fourArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        NSInteger index = i % 1;
        NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X+119+119+119, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height) style:kSSCheckBoxViewStyleBox checked:NO];
        NSString *a1 = [fourArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change1:)];
        
        [_chooseArray5 addObject:cb];
        
        
        [_view2 addSubview:cb];
    }
    
    NSMutableArray*fiveArray=[[NSMutableArray alloc] initWithObjects:@"1ml",@"1.5ml",@"2ml",@"2.5ml",@"3ml",nil];
    
    
    for (int i=0; i<fiveArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        NSInteger index = i % 1;
        NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X+119+119+119+119, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height) style:kSSCheckBoxViewStyleBox checked:NO];
        NSString *a1 = [fiveArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change1:)];
        
        [_chooseArray6 addObject:cb];
        
        
        [_view2 addSubview:cb];
    }
    
    NSMutableArray*sixArray=[[NSMutableArray alloc] initWithObjects:@"1ml",@"1.5ml",@"2ml",@"2.5ml",@"3ml",nil];
    
    
    for (int i=0; i<sixArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        NSInteger index = i % 1;
        NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X+119+119+119+119+119, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height) style:kSSCheckBoxViewStyleBox checked:NO];
        NSString *a1 = [sixArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change1:)];
        
        [_chooseArray7 addObject:cb];
        
        
        [_view2 addSubview:cb];
    }




    
    
    if ([user objectForKey:@"english"]) {
 
         _threeArray2=[[NSMutableArray alloc] initWithObjects:@"BD",@"Radiometer",@"Smith",@"Terumo",@"Wesst",@"Other",nil];
    }
    else{
    
     _threeArray2=[[NSMutableArray alloc] initWithObjects:@"BD",@"雷度",@"史密斯",@"泰尔茂",@"威世德",@"其他",nil];
    }
    
    for (int i=0; i<_threeArray2.count; i++) {
        
        NSInteger index = i % 6;
        NSInteger page = i / 6;
        
        UILabel *lblType=[[UILabel alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X+25, page  * (Button_Height + Height_Space)+Start_Y-30, Button_Width, Button_Height)];
        
        [lblType setBackgroundColor:[UIColor clearColor]];
        lblType.textColor = RgbHex2UIColor(0x82, 0x82, 0x82);
        
        [lblType setFont:[UIFont systemFontOfSize:18]];
        [lblType setText:[_threeArray2 objectAtIndex:i]];
        
        [_view2 addSubview:lblType];
        
    }

    
#pragma 第二个问题
    
    NSMutableArray*twoArray=[[NSMutableArray alloc] initWithObjects:@"1ml",@"2ml",@"3ml",@"5ml",@"10ml", nil];
    
    
    for (int i=0; i<twoArray.count; i++) {
       SSCheckBoxView* cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(66+i*120, 170, 100, 30) style:kSSCheckBoxViewStyleBox checked:NO];
        NSString *a3 = [twoArray objectAtIndex:i];
        [cb setText:a3];
        
        
        [cb setStateChangedTarget:self selector:@selector(change1:)];
        
        [_chooseArray1 addObject:cb];
        
        [_view2 addSubview:cb];
     
        
        
   


    
    
}
    
}


- (void)back:(UIButton *)button {
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if (![user objectForKey:@"english"]) {
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否退出调研问卷" delegate:self cancelButtonTitle:@"是" otherButtonTitles:@"否",nil];
    [alertView show];
     alertView.tag=1;
    }
    else{
    
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Tip" message:@"Exit survey questionnaire" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"No",nil];
        [alertView show];
        alertView.tag=1;
    }
    
    
}




-(void)change1:(SSCheckBoxView*)cbv{
 NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");


}
-(void)change2:(SSCheckBoxView*)cbv{
    
     NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
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

- (IBAction)nextBtn:(id)sender {
    
    int isok1=0;
    int isok2=0;
    
    NSMutableArray*Q1=[[NSMutableArray alloc] init];
    NSMutableArray*Q2=[[NSMutableArray alloc] init];
    NSString*str=[[NSString alloc] init];
    NSString*str2=[[NSString alloc] init];

    for(int i=0;i<[_chooseArray1 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray1 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok1=1;
            [Q1 addObject:pp.textLabel.text];
            
        }
    }
    
    for(int i=0;i<[_chooseArray2 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray2 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok2=1;
            str2=@"BD";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:pp.textLabel.text];
            [Q2 addObject:str];
            
        }
    }
    for(int i=0;i<[_chooseArray3 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray3 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok2=1;
            str2=@"雷度";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:pp.textLabel.text];
            [Q2 addObject:str];
            
        }
    }
    for(int i=0;i<[_chooseArray4 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray4 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok2=1;
            str2=@"史密斯";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:pp.textLabel.text];
            [Q2 addObject:str];
        }
    }
    for(int i=0;i<[_chooseArray5 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray5 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok2=1;
            str2=@"泰尔茂";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:pp.textLabel.text];
            [Q2 addObject:str];
        }
    }
    for(int i=0;i<[_chooseArray6 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray6 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok2=1;
            str2=@"威世德";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:pp.textLabel.text];
            [Q2 addObject:str];
            
        }
    }
    for(int i=0;i<[_chooseArray7 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray7 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok2=1;
            if (_textLb3.text.length>0) {
                str2=_textLb3.text;
            }
            else{
            str2=@"其他";
            
            }
           
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:pp.textLabel.text];
            NSLog(@"%@",str);
            
            
            [Q2 addObject:str];
            
        }
    }
    
    
  
    
    if (_textLb2.text==nil||[_textLb2.text isEqualToString:@""]) {
        
        
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
    else{
        
        
        //NSDictionary *q2 =@{@"text":_textLb2.text};
        NSDictionary *q4 =@{@"choose":Q1};
        NSDictionary *q3 =@{@"choose":Q2};
        NSDictionary *q2 =@{@"text":_textLb2.text};
        NSDictionary*num2=@{@"2":q2};
        NSDictionary*num3=@{@"3-1":q4};
        NSDictionary*num4=@{@"3-2":q3};
        
//        NSMutableArray*arr=[[NSMutableArray alloc] init];
//        [arr addObject:num2];
//        [arr addObject:num3];
//        [arr addObject:num4];
        
        NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
        if ([[choose objectForKey:@"choose"]count]==0) {
             NSMutableArray*arr=[NSMutableArray arrayWithObjects:num2,num3,num4, nil];
            
            NSArray*arr1=[NSArray arrayWithArray:arr];
            [choose setObject:arr1 forKey:@"choose"];
            [choose synchronize];
            
            
        }
        
        else{
            
            NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
            
           
            
            
            NSLog(@"%@",[choose objectForKey:@"choose"]);
            NSMutableArray *discardedItems = [NSMutableArray array];
            
            for (NSDictionary*kk in lex) {
               
                if ([kk objectForKey:@"2"]) {
                    
                    NSLog(@"%@",kk);
                   
                    [discardedItems addObject:kk];
                   
                }
                if ([kk objectForKey:@"3-1"]) {
                    
                    [discardedItems addObject:kk];
                   
                }
                if ([kk objectForKey:@"3-2"]) {
                    
                   [discardedItems addObject:kk];
                }
                
                if ([kk objectForKey:@"text"]) {
                    
                    [discardedItems addObject:kk];
                }


                
            }
            
            [lex removeObjectsInArray:discardedItems];
             NSLog(@"%@",lex);
            NSArray*arr2=[NSArray arrayWithArray:lex];
            [choose setObject:arr2 forKey:@"choose"];
            [choose synchronize];

            
            
            
            NSMutableArray*arr=[NSMutableArray arrayWithObjects:num2,num3,num4, nil];

            [arr addObjectsFromArray:[choose objectForKey:@"choose"]];
            
            
            NSArray*arr1=[NSArray arrayWithArray:arr];
            [choose setObject:arr1 forKey:@"choose"];
            [choose synchronize];
          
            NSLog(@"%@",arr);
        

        
 }
    
        
        
        
//        if (!_two) {
//            _two = [[TwoViewController alloc]init];
//        }
           // [self.navigationController pushViewController:_two animated:YES];
        
        
//        self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"??" style:UIBarButtonItemStyleBordered target:nil action:nil];
        if (!_two) {
             _two = [[TwoViewController alloc]init];
         _two= [self.storyboard instantiateViewControllerWithIdentifier:@"twoPage"];
        }
        
     
    
   [self.navigationController pushViewController:_two animated:YES];
        
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
     if (alertView.tag==2) {
    if (buttonIndex==0) {
    OnePageViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"FourPage"];
    
    [self.navigationController pushViewController:receive animated:YES];
    }
    else{
    
        _seg.selectedSegmentIndex=0;
    }
     }
   else if (alertView.tag==1) {
        if (buttonIndex==0) {
            
            OnePageViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"listPage"];
            
            [self.navigationController pushViewController:receive animated:YES];
            
            
        }
    }
}


- (IBAction)seg:(id)sender {
    
    NSInteger Index = _seg.selectedSegmentIndex;
    
    if (Index == 0) {
        NSLog(@"1");
    }else if (Index == 1){
       
        
        
        
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"如切换调查问卷，所有答案将被清空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            [alertView show];
            alertView.tag=2;
        }else{
            
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"tip" message:@"If you switch the questionnaire, all answers will be cleared" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            [alertView show];
            alertView.tag=2;
        }

        
        
        
    }

}
- (IBAction)takePhoto:(id)sender {
    
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


-(NSString *)getImageSavePath{
    //获取存放的照片
    //获取Documents文件夹目录
    NSUserDefaults *number = [NSUserDefaults standardUserDefaults];
    
     NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
    NSString*photoName=[NSString stringWithFormat:@"%ld",[[photoList objectForKey:@"photoList"] integerValue]];
    
    
    NSString*str=[[@"3_" stringByAppendingString:photoName] stringByAppendingString:@".jpg"];
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    
    NSString*numberStr=[NSString stringWithFormat:@"%@",[number objectForKey:@"number"]];
    
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    NSString *createPath = [[NSString stringWithFormat:@"%@/",documentPath] stringByAppendingString:numberStr];
    if (![[NSFileManager defaultManager]fileExistsAtPath:createPath]) {
        
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        
    }else{
        NSLog(@"有这个文件了");
    }
    
    //指定新建文件夹路径
    NSString *imageDocPath = [createPath stringByAppendingPathComponent:str];
    
  
    
    return imageDocPath;
}

-(void)initData{
    //指定新建文件夹路径
    NSString *imageDocPath = [self getImageSavePath];
    //创建ImageFile文件夹
    [[NSFileManager defaultManager] createDirectoryAtPath:imageDocPath withIntermediateDirectories:YES attributes:nil error:nil];
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
//    [self saveImage:image withName:@"/currentImage.png"];
//    
//    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"/Documents"] stringByAppendingPathComponent:@"currentImage.png"];
//    
//    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];

    
    NSString *imageDocPath = [self getImageSavePath];
    NSLog(@"%@",imageDocPath);
    
    
    //以下是保存文件到Document路径下
    //把图片转成NSData类型的数据来保存文件
    NSData *data = nil;

        data = UIImageJPEGRepresentation(image, 0.1);

    //保存
    [[NSFileManager defaultManager] createFileAtPath:imageDocPath contents:data attributes:nil];
    
    _isFullScreen = NO;
   // [_img1 setImage:savedImage];
    [_img1 setImage: [UIImage imageWithData:data]];
   _img1.tag = 100;
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

//#pragma mark - 保存图片至沙盒
//- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
//{
//    
//    //把图片转成NSData类型的数据来保存文件
//    NSData *data = nil;
//    //判断图片是不是png格式的文件
//    if (UIImagePNGRepresentation(currentImage)) {
//        //返回为png图像。
//        data = UIImagePNGRepresentation(currentImage);
//    }else {
//        //返回为JPEG图像。
//        data = UIImageJPEGRepresentation(currentImage, 0.5);
//    }
//  
//    // 获取沙盒目录
//    
//    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"/Documents"] stringByAppendingPathComponent:imageName];
//    // 将图片写入文件
//    
//    NSLog(@"%@",fullPath);
//    
//    [data writeToFile:fullPath atomically:YES];
//}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error != nil) {
        UIAlertView *fail = [[UIAlertView alloc]initWithTitle:@"提示" message:@"保存失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [fail show];
        NSLog(@"%@",error);
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"保存成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
        [self.view addSubview:alert];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    _isFullScreen = !_isFullScreen;
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:_view2];
    
    CGPoint imagePoint = _img1.frame.origin;
    //touchPoint.x ，touchPoint.y 就是触点的坐标
    
    // 触点在imageView内，点击imageView时 放大,再次点击时缩小
    if(imagePoint.x <= touchPoint.x && imagePoint.x +_img1.frame.size.width >=touchPoint.x && imagePoint.y <=  touchPoint.y && imagePoint.y+_img1.frame.size.height >= touchPoint.y)
    {
        // 设置图片放大动画
        [UIView beginAnimations:nil context:nil];
        // 动画时间
        [UIView setAnimationDuration:1];
        
        if (_isFullScreen) {
            // 放大尺寸
            
            _img1.frame = CGRectMake(50, 0, 800, 480);
        }
        else {
            // 缩小尺寸
            _img1.frame = CGRectMake(826, 84, 50, 50);
        }
        
        // commit动画
        [UIView commitAnimations];
        
    }
    
     [self.view endEditing:YES];
    
}

- (void)viewWillAppear:(BOOL)animated{

    NSMutableArray * array =[[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
    NSLog(@"%@",array);


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
            self.view.frame = CGRectMake(self.view.frame.origin.x+105, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x-105, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
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
            self.view.frame = CGRectMake(self.view.frame.origin.x-105, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x+105, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }
    else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+100 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}



@end

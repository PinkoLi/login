//
//  TwentyEightViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/6.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "TwentyEightViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "TwentyNineViewController.h"
@interface TwentyEightViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic)bool isFullScreen;
@property(nonatomic,assign)NSInteger add;
@property(nonatomic,strong)TwentyNineViewController*twentyNine;
@end
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define NUMBERS @"0123456789"

#define Start_X 40.0f           // 第一个按钮的X坐标
#define Start_Y 300.0f           // 第一个按钮的Y坐标
#define Width_Space 10.0f        // 2个按钮之间的横间距
#define Height_Space 10.0f      // 竖间距
#define Button_Height 30.0f    // 高
#define Button_Width 240.0f      // 宽
@implementation TwentyEightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _seg.selectedSegmentIndex=1;
    _view1.layer.masksToBounds = YES;
    _view1.layer.cornerRadius = 4.0;
    _view1.layer.borderWidth = 1.0;
    _view1.layer.borderColor = [[UIColor clearColor] CGColor];
    _view2.layer.masksToBounds = YES;
    _view2.layer.cornerRadius = 6.0;
    _view2.layer.borderWidth = 1.0;
    _view2.layer.borderColor = [[UIColor clearColor] CGColor];
    _view3.layer.masksToBounds = YES;
    _view3.layer.cornerRadius = 4.0;
    _view3.layer.borderWidth = 1.0;
    _view3.layer.borderColor = [[UIColor clearColor] CGColor];
    
   // [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
    [_lb1 setTextColor:UIColorFromRGB(0x034f9a)];
  
//    _text1.enabled = NO;
//    _text2.enabled = NO;
//    _text3.enabled = NO;
//    _text4.enabled = NO;
//    _text5.enabled = NO;
//    _text6.enabled = NO;
//    _text7.enabled = NO;
    
    
    
    
   
    
    _chooseArray1=[[NSMutableArray alloc] init];
    
    _add=0;
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        _lb1.text=@"67、Total number of samples randomly inspected:";
        
        
        
        
       [_photoBtn setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];
        
       
          _oneArray=[[NSMutableArray alloc] initWithObjects:@"Unaccepted samples _ air bubbles:",@"Unaccepted samples _ Clotted:",@"Unaccepted samples _ mixed with venous blood:",@"Unaccepted samples _ low blood volume (a blood volume < 0.5ml when a 1ml blood collector is used, or < 1ml when a 3ml blood collector is used)",@"Unaccepted samples _ unlabeled:",@"Unaccepted samples _ inconsistency of sample labels with the information on the laboratory test report:",@"Unaccepted samples _ laboratory test reports without the time of blood collection",@"Unaccepted samples _ no laboratory test reports:",nil];
        
        
       
        [_next setImage:[UIImage imageNamed:@"继续答题英文.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"采血耗材-检测仪器"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;
        [_seg setTitle:@"Within-department survey" forSegmentAtIndex:0];
        [_seg setTitle:@"Laboratory survey" forSegmentAtIndex:1];
    }
    else{
        
        _text.frame=CGRectMake(250, 37, 97, 30);
        
        [_photoBtn setImage:[UIImage imageNamed:@"建议拍照.png"] forState:UIControlStateNormal];
        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"不合格样本_气泡：",@"不合格样本_凝血",@"不合格样本_静脉血混入",@"不合格样本_样本血量偏少（使用1ml采血器时血量<0.5ml，3ml采血器血量<1ml）",@"不合格样本_无标识",@"不合格样本_标识与检验单信息不一致",@"不合格样本_检测单未标记采血时间",@"不合格样本_无检验单",nil];
        
//        _text1.frame=CGRectMake(240, 76, 97, 30);
//        _text2.frame=CGRectMake(240, 151, 97, 30);
//        _text3.frame=CGRectMake(292, 200, 97, 30);
//        _text4.frame=CGRectMake(790, 248, 97, 30);
//        _text5.frame=CGRectMake(292, 315, 97, 30);
//        _text6.frame=CGRectMake(412, 350, 97, 30);
//        _text7.frame=CGRectMake(415, 394, 97, 30);
//        _text8.frame=CGRectMake(292, 443, 97, 30);
        
        [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"采血耗材-检测仪器"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
    }

    
    
#pragma 第一个问题
    
    
    
    
    
    for (int i=0; i<_oneArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
                NSInteger index = i % 1;
                NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width-100 + Width_Space) + Start_X-30,  page*(Button_Height + Height_Space+20)+Start_Y-230, Button_Width+750, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
      
         cb.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        cb.tag=++_add;
        [cb setStateChangedTarget:self selector:@selector(change67:)];
        
        [_chooseArray1 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
    }
    
    [_view2 bringSubviewToFront:_text1];
    [_view2 bringSubviewToFront:_text2];
    [_view2 bringSubviewToFront:_text3];
    [_view2 bringSubviewToFront:_text4];
    [_view2 bringSubviewToFront:_text5];
    [_view2 bringSubviewToFront:_text6];
    [_view2 bringSubviewToFront:_text7];
     [_view2 bringSubviewToFront:_text8];

    [_text1 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text2 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text3 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text4 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text5 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text6 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text7 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text8 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];


}

-(void)change67:(SSCheckBoxView*)cbv{
    
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
//    if(_tmpBtn== cbv) {
//        //上次点击过的按钮，不做处理
//    } else{
//        //本次点击的按钮设为红色
//        cbv.checked=YES;
//        //将上次点击过的按钮设为黑色
//        _tmpBtn.checked=NO;
//    }
//    _tmpBtn= cbv;
    
//    
//    if (_text1.text.length>0) {
//        for (SSCheckBoxView*cb in _chooseArray1) {
//            
//            if (cb.tag==2) {
//                cb.checked=YES;
//            }
//        }
//    }
    
    
//    if ([cbv.textLabel.text isEqualToString:@"不合格样本气泡："]) {
//        _text1.enabled = YES;
//       
//    }
//    else{
//        _text1.enabled = NO;
//        //_text1.text=@"";
//       
//    }
//    if ([cbv.textLabel.text isEqualToString:@"不合格样本凝血"]) {
//        _text2.enabled = YES;
//        
//    }
//    else{
//        _text2.enabled = NO;
//        //_text2.text=@"";
//        
//    }
//    if ([cbv.textLabel.text isEqualToString:@"不合格样本静脉血混入"]) {
//        _text3.enabled = YES;
//        
//    }
//    else{
//        _text3.enabled = NO;
//        //_text3.text=@"";
//        
//    }
//    if ([cbv.textLabel.text isEqualToString:@"不合格样本无标识"]) {
//        _text4.enabled = YES;
//        
//    }
//    else{
//        _text4.enabled = NO;
//        //_text4.text=@"";
//        
//    }
//    if ([cbv.textLabel.text isEqualToString:@"不合格样本标识与检验单信息不一致"]) {
//        _text5.enabled = YES;
//        
//    }
//    else{
//        _text5.enabled = NO;
//        //_text5.text=@"";
//        
//    }
//    if ([cbv.textLabel.text isEqualToString:@"不合格样本检测单未标记采血时间"]) {
//        _text6.enabled = YES;
//        
//    }
//    else{
//        _text6.enabled = NO;
//        //_text6.text=@"";
//        
//    }
//    if ([cbv.textLabel.text isEqualToString:@"不合格样本无检验单"]) {
//        _text7.enabled = YES;
//        
//    }
//    else{
//        _text7.enabled = NO;
//        //_text7.text=@"";
//        
//    }


    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textFieldDidChange :(UITextField *)theTextField{
    
   
    
//    if (_text.text.length==0) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"请优先填写抽查样本总数" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
//        [alert show];
//        return;
//    }
//    else{
//        
//        if ((_text1.text.intValue+_text2.text.intValue+_text3.text.intValue+_text4.text.intValue+_text5.text.intValue+_text6.text.intValue+_text7.text.intValue)>_text.text.intValue) {
//            
//            NSLog(@"%d",(_text1.text.intValue+_text2.text.intValue+_text3.text.intValue+_text4.text.intValue+_text5.text.intValue+_text6.text.intValue+_text7.text.intValue));
//            
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"所有单项数量大于总样本数量" delegate:nil cancelButtonTitle:@"请修改" otherButtonTitles: nil];
//            [alert show];
//            
//        }
//    }
    
    
    if (_text1.text.length>0) {
        
       
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==1) {
                cb.checked=YES;
            }
        }
    }
    else{
    
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==1) {
                cb.checked=NO;
            }
        }
    }
    if (_text2.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==2) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==2) {
                cb.checked=NO;
            }
        }
    }

    if (_text3.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==3) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==3) {
                cb.checked=NO;
            }
        }
    }

    if (_text4.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==5) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==5) {
                cb.checked=NO;
            }
        }
    }
    
    if (_text8.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==4) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==4) {
                cb.checked=NO;
            }
        }
    }


    if (_text5.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==6) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==6) {
                cb.checked=NO;
            }
        }
    }

    if (_text6.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==7) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==7) {
                cb.checked=NO;
            }
        }
    }

    if (_text7.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==8) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==8) {
                cb.checked=NO;
            }
        }
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if ([user objectForKey:@"123"]) {
            TwentyEightViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"sixPage"];
            
            [self.navigationController pushViewController:receive animated:YES];
            
            
        }else{
            TwentyEightViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"onePage"];
            
            [self.navigationController pushViewController:receive animated:YES];
            
        }

    }
    else{
        
        _seg.selectedSegmentIndex=1;
    }
}


- (IBAction)seg:(id)sender {
    
    NSInteger Index = _seg.selectedSegmentIndex;
    
    if (Index == 1) {
        NSLog(@"2");
    }else if (Index == 0){
        
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"如切换调查问卷，所有答案将被清空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            [alertView show];
            
        }else{
            
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"tip" message:@"If you switch the questionnaire, all answers will be cleared" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            [alertView show];
            
        }

        
    }
    
}



- (IBAction)nextBtn:(id)sender {
    
    
    
  
        
    if (_text1.text.intValue>_text.text.intValue||_text2.text.intValue>_text.text.intValue||_text3.text.intValue>_text.text.intValue||_text4.text.intValue>_text.text.intValue||_text5.text.intValue>_text.text.intValue||_text6.text.intValue>_text.text.intValue||_text7.text.intValue>_text.text.intValue||_text8.text.intValue>_text.text.intValue) {
            
            NSLog(@"%d",(_text1.text.intValue+_text2.text.intValue+_text3.text.intValue+_text4.text.intValue+_text5.text.intValue+_text6.text.intValue+_text7.text.intValue));
            
        
        
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"单项数量大于总样本数量" delegate:nil cancelButtonTitle:@"请修改" otherButtonTitles: nil];
            [alert show];

           
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"error" message:@" Number of individual items greater than total sample size " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }

        
        
            return;
        
        
            
        }


    
    
    int isok1=0;
    
    
    NSString*str2=[[NSString alloc] init];
    NSString*str=[[NSString alloc] init];
   
    
    
    NSMutableArray*Q1=[[NSMutableArray alloc] init];
   
    
    
    for(int i=0;i<[_chooseArray1 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray1 objectAtIndex:i];
        
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:0]])
        {
            
            str2=@"不合格样本气泡";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text1.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:1]])
        {
            
            str2=@"不合格样本凝血";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text2.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:2]])
        {
            
            str2=@"不合格样本静脉血混入";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text3.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:3]])
        {
            
            str2=@"不合格样本样本血量偏少：使用1ml采血器时血量<0.5ml，3ml采血器血量<1ml";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text8.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }

        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:4]])
        {
            
            str2=@"不合格样本无标识";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text4.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:5]])
        {
            
            str2=@"不合格样本标识与检验单信息不一致";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text5.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:6]])
        {
            
            str2=@"不合格样本检测单未标记采血时间";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text6.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:7]])
        {
            
            str2=@"不合格样本无检验单";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text7.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        
       


        
        
    }
//    
    if (isok1==1) {
    
        if ([_chooseStr isEqualToString:@"不合格样本_气泡："]) {
            if (_text1.text==nil||[_text1.text isEqualToString:@""]) {
                isok1=0;
                
            }
        }
            if ([_chooseStr isEqualToString:@"不合格样本_凝血"]) {
                if (_text2.text==nil||[_text2.text isEqualToString:@""]) {
                    isok1=0;
                    
                }
            }
        
                if ([_chooseStr isEqualToString:@"不合格样本_静脉血混入"]) {
                    if (_text3.text==nil||[_text3.text isEqualToString:@""]) {
                        isok1=0;
                        
                    }
                }
                    if ([_chooseStr isEqualToString:@"不合格样本_无标识"]) {
                        if (_text4.text==nil||[_text4.text isEqualToString:@""]) {
                            isok1=0;
                            
                        }
                    }
                        if ([_chooseStr isEqualToString:@"不合格样本_标识与检验单信息不一致"]) {
                            if (_text5.text==nil||[_text5.text isEqualToString:@""]) {
                                isok1=0;
                                
                            }
                        }
                            if ([_chooseStr isEqualToString:@"不合格样本_检测单未标记采血时间"]) {
                                if (_text6.text==nil||[_text6.text isEqualToString:@""]) {
                                    isok1=0;
                                    
                                }
                            }
                                if ([_chooseStr isEqualToString:@"不合格样本_无检验单"]) {
                                    if (_text7.text==nil||[_text7.text isEqualToString:@""]) {
                                        isok1=0;
                                        
                                    }
                                }

    
    
    }
        
        

    
    
    
   
    
    
    if (_text.text==nil||[_text.text isEqualToString:@""]) {
        
        
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
        NSString*str2=[[NSString alloc] init];
               NSString*str=[[NSString alloc] init];
               
               str2=@"抽查样本总数";
                           str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text.text];
               
                           [Q1 addObject:str];
        NSDictionary *q1 =@{@"choose":Q1};
       
        
        NSDictionary*num1=@{@"67":q1};
       
        
        
        //        NSMutableArray*arr=[[NSMutableArray alloc] init];
        //        [arr addObject:num2];
        //        [arr addObject:num3];
        //        [arr addObject:num4];
        
        NSUserDefaults *shiyan = [NSUserDefaults standardUserDefaults];
        if ([[shiyan objectForKey:@"shiyan"]count]==0) {
            NSMutableArray*arr=[NSMutableArray arrayWithObjects:num1, nil];
            
            NSArray*arr1=[NSArray arrayWithArray:arr];
            [shiyan setObject:arr1 forKey:@"shiyan"];
            [shiyan synchronize];
            
            
        }
        
        else{
            
            NSMutableArray*lex=[NSMutableArray arrayWithArray:[shiyan objectForKey:@"shiyan"]];
            
            
            
            
            NSLog(@"%@",[shiyan objectForKey:@"shiyan"]);
            NSMutableArray *discardedItems = [NSMutableArray array];
            
            for (NSDictionary*kk in lex) {
                
                if ([kk objectForKey:@"67"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }
                
                
                
            }
            
            [lex removeObjectsInArray:discardedItems];
            NSLog(@"%@",lex);
            NSArray*arr2=[NSArray arrayWithArray:lex];
            [shiyan setObject:arr2 forKey:@"shiyan"];
            [shiyan synchronize];
            
            
            
            
            NSMutableArray*arr=[NSMutableArray arrayWithObjects: num1, nil];
            
            [arr addObjectsFromArray:[shiyan objectForKey:@"shiyan"]];
            
            
            NSArray*arr1=[NSArray arrayWithArray:arr];
            [shiyan setObject:arr1 forKey:@"shiyan"];
            [shiyan synchronize];
            
            
            
            
            
        }
        
        NSLog(@"%@",[shiyan objectForKey:@"shiyan"]);
        
//        TwentyEightViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"29Page"];
//        
//        [self.navigationController pushViewController:receive animated:YES];
        if (!_twentyNine) {
            
            _twentyNine= [self.storyboard instantiateViewControllerWithIdentifier:@"29Page"];
        }
        
        
        
        [self.navigationController pushViewController:_twentyNine animated:YES];
        
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
    
    
//    NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
//    NSString*photoName=[NSString stringWithFormat:@"%d",[[photoList objectForKey:@"photoList2"] integerValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *date = [formatter stringFromDate:[NSDate date]];
    
     NSString*str=[[@"67_" stringByAppendingString:date] stringByAppendingString:@".jpg"];
    
    
    
    
    
    
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
    NSString *imageDocPath = [self getImageSavePath];
    NSLog(@"%@",imageDocPath);
    
    
    //以下是保存文件到Document路径下
    //把图片转成NSData类型的数据来保存文件
    NSData *data = nil;
    //判断图片是不是png格式的文件
    //    if (UIImagePNGRepresentation(image)) {
    //        //返回为png图像。
    //        data = UIImagePNGRepresentation(image);
    //    }else {
    //        //返回为JPEG图像。
    data = UIImageJPEGRepresentation(image, 0.1);
    //    }
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
//    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
//    // 获取沙盒目录
//    
//    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
//    // 将图片写入文件
//    
//    [imageData writeToFile:fullPath atomically:NO];
//}

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
            _img1.frame = CGRectMake(812, 27, 50, 50);
        }
        
        // commit动画
        [UIView commitAnimations];
        
    }
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
    if (textField==_text||textField==_text1||textField==_text2) {
        
    }
    else if (textField==_text3){
    
    
        [UIView beginAnimations:@"Animation" context:nil];
        //设置动画的间隔时间
        [UIView setAnimationDuration:0.20];
        //??使用当前正在运行的状态开始下一段动画
        [UIView setAnimationBeginsFromCurrentState: YES];
        //设置视图移动的位移
        double version = [[UIDevice currentDevice].systemVersion doubleValue];
        if(version<8.0){
            if(self.interfaceOrientation==UIDeviceOrientationLandscapeLeft){
                self.view.frame = CGRectMake(self.view.frame.origin.x+255, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
                
            }  else{
                self.view.frame = CGRectMake(self.view.frame.origin.x-255, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            }
            
        }else{
            
            self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-200 , self.view.frame.size.width, self.view.frame.size.height);
        }
        //设置动画结束
        [UIView commitAnimations];

    
    
    }
    
        
        
    
    else{
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
            self.view.frame = CGRectMake(self.view.frame.origin.x+255, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x-255, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-350 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
        
    }
}
//在UITextField 编辑完成调用方法
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
    if (textField==_text||textField==_text1||textField==_text2) {
        
    }
    
    else if (textField==_text3){
        
        
        [UIView beginAnimations:@"Animation" context:nil];
        //设置动画的间隔时间
        [UIView setAnimationDuration:0.20];
        //??使用当前正在运行的状态开始下一段动画
        [UIView setAnimationBeginsFromCurrentState: YES];
        //设置视图移动的位移
        double version = [[UIDevice currentDevice].systemVersion doubleValue];
        if(version<8.0){
            if(self.interfaceOrientation==UIDeviceOrientationLandscapeLeft){
                self.view.frame = CGRectMake(self.view.frame.origin.x+255, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
                
            }  else{
                self.view.frame = CGRectMake(self.view.frame.origin.x-255, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            }
            
        }else{
            
            self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+200 , self.view.frame.size.width, self.view.frame.size.height);
        }
        //设置动画结束
        [UIView commitAnimations];
        
        
        
    }

    else{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //??使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if(version<8.0){
        if(self.interfaceOrientation==UIDeviceOrientationLandscapeLeft){
            self.view.frame = CGRectMake(self.view.frame.origin.x-255, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x+255, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }
    else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+350 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
        
    }
}

- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
    NSCharacterSet*cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    NSString*filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basicTest = [string isEqualToString:filtered];
    if(!basicTest) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                       message:@"请输入数字"
                                                      delegate:nil
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil];
        
        [alert show];
        return NO;
        
    }
    return YES;
}

@end

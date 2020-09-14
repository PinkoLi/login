//
//  SevenViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/3.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "TwentyTwoViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "TwentyThreeViewController.h"
#import "TwentyFourViewController.h"
#import "TwentyTwo2ViewController.h"

@interface TwentyTwoViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn2;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn3;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn4;

@property(nonatomic,strong)TwentyThreeViewController*twentythree;
@property(nonatomic,strong)TwentyFourViewController*twentyfour;
@property(nonatomic,strong)TwentyTwo2ViewController*twentytwo2;

@property(nonatomic)bool isFullScreen;
@end
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define Start_X 40.0f           // 第一个按钮的X坐标
#define Start_Y 300.0f           // 第一个按钮的Y坐标
#define Width_Space 10.0f        // 2个按钮之间的横间距
#define Height_Space 10.0f      // 竖间距
#define Button_Height 30.0f    // 高
#define Button_Width 240.0f      // 宽
@implementation TwentyTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
    _keshi.text=[keshi objectForKey:@"keshi"];
    
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
    [_lb2 setTextColor:UIColorFromRGB(0x034f9a)];
    [_lb3 setTextColor:UIColorFromRGB(0x034f9a)];
    [_lb4 setTextColor:UIColorFromRGB(0x034f9a)];

    
    
  
    
    _chooseArray1=[[NSMutableArray alloc] init];
    _chooseArray2=[[NSMutableArray alloc] init];
    _chooseArray3=[[NSMutableArray alloc] init];
    _chooseArray4=[[NSMutableArray alloc] init];

    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        _lb1.text=@"50、If Open catheter, was the diluent in the front end of the catheter discarded before blood collection? ";
        _lb2.text=@"51、If the diluent was discarded, the volume of the waste liquid discarded was";
        _lb3.text=@"52、If Catheter, was the catheter rinsed as required after blood collection?";
        
        
         [_photoBtn setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];
        
        
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"<5ml",@"5-10ml",@">10ml",nil];
        
        _threeArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"NO",nil];
        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"NO",nil];
        
        [_next setImage:[UIImage imageNamed:@"继续答题英文.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"英文3"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;
        [_seg setTitle:@"Within-department survey" forSegmentAtIndex:0];
        [_seg setTitle:@"Laboratory survey" forSegmentAtIndex:1];
    }
    else{
         [_photoBtn setImage:[UIImage imageNamed:@"建议拍照.png"] forState:UIControlStateNormal];
        
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"<5ml",@"5-10ml",@">10ml",nil];

        _threeArray=[[NSMutableArray alloc] initWithObjects:@"回输",@"废弃",nil];

        _oneArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否",nil];
        _fourArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否",nil];

        
        [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB3"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
    }

    
    
#pragma 第一个问题
    
   
    
    
    
    
    for (int i=0; i<_oneArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        //        NSInteger index = i % 3;
        //        NSInteger page = i / 3;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-130 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y-250, Button_Width, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change50:)];
        
        [_chooseArray1 addObject:cb];
        [_view2 addSubview:cb];
        
         NSUserDefaults *fengbi = [NSUserDefaults standardUserDefaults];
        if ([[fengbi objectForKey:@"fengbi"]isEqualToString:@"1"]) {
            cb.hidden=YES;
            _lb1.hidden=YES;
            _img1.hidden=YES;
            _btn1.hidden=YES;
            
        }
        else{
            
            cb.hidden=NO;
            _lb1.hidden=NO;
            _img1.hidden=NO;
            _btn1.hidden=NO;
        }

        
        
        
        
    }
    
#pragma 第二个问题
    
   
    
    
    
    
    for (int i=0; i<_twoArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-100 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y-110, Button_Width-100, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_twoArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change51:)];
        
        [_chooseArray2 addObject:cb];
        [_view2 addSubview:cb];
        _lb2.hidden=YES;
        cb.hidden=YES;
        
        
        
        
        
        
    }
    
#pragma 第三个问题
    
    
    
    
    
    for (int i=0; i<_threeArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-100 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y+20, Button_Width-100, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_threeArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change52:)];
        
        [_chooseArray3 addObject:cb];
        [_view2 addSubview:cb];
        
//        _lb3.hidden=YES;
//        cb.hidden=YES;
//        _btn1.hidden=YES;
//        _img1.hidden=YES;
        
       NSUserDefaults *fengbi = [NSUserDefaults standardUserDefaults];
                   if (![[fengbi objectForKey:@"fengbi"]isEqualToString:@"1"]) {
                       cb.hidden=YES;
                       _lb3.hidden=YES;
                        _img1.hidden=YES;
                       _btn1.hidden=YES;

                       
                   }
                   else{
                       
                       cb.hidden=NO;
                       _lb3.hidden=NO;
                        _img1.hidden=NO;
                       _btn1.hidden=NO;

                      
                   }
        
        
        
    }
    
    #pragma 第四个问题
     
    
     
     
     
     
     for (int i=0; i<_fourArray.count; i++) {
         
         //        float x = i%5;
         //
         //        float y = i/5;
         
         
         
         
         
          SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-100 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y+160, Button_Width-100, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
         NSString *a1 = [_fourArray objectAtIndex:i];
         
         [cb setText:a1];
         
         
         [cb setStateChangedTarget:self selector:@selector(change49:)];
         
         [_chooseArray4 addObject:cb];
         [_view2 addSubview:cb];
      
         
         
         
         
         
         
     }
    
}

-(void)change50:(SSCheckBoxView*)cbv{
    
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
    if(_tmpBtn== cbv) {
        //上次点击过的按钮，不做处理
    } else{
        //本次点击的按钮设为红色
        cbv.checked=YES;
        //将上次点击过的按钮设为黑色
        _tmpBtn.checked=NO;
    }
    _tmpBtn= cbv;
    
    if (cbv.checked==YES&&[cbv.textLabel.text isEqualToString:[_oneArray firstObject]]) {
        NSLog(@"1111111");
        
        for (SSCheckBoxView*pp in _chooseArray2) {
            
            pp.hidden=NO;
            _lb2.hidden=NO;
        }
    }
    
    else{
        
        for (SSCheckBoxView*pp in _chooseArray2) {
            
            pp.hidden=YES;
            _lb2.hidden=YES;
        }
        
    }
    
    
    
    if (cbv.checked==YES&&[cbv.textLabel.text isEqualToString:[_oneArray lastObject]]) {
        NSLog(@"1111111");
        
        for (SSCheckBoxView*pp in _chooseArray2) {
            
            pp.hidden=YES;
            _lb2.hidden=YES;
        }
    }
    else{
        for (SSCheckBoxView*pp in _chooseArray2) {
            
            pp.hidden=NO;
            _lb2.hidden=NO;
        }
        
        
    }
    
    
    if (cbv.checked==NO){
        
        for (SSCheckBoxView*pp in _chooseArray2) {
            
            pp.hidden=YES;
            _lb2.hidden=YES;
        }
//        for (SSCheckBoxView*pp in _chooseArray3) {
//            
//            pp.hidden=YES;
//            _lb3.hidden=YES;
//        }
    }
    
}

-(void)change51:(SSCheckBoxView*)cbv{
    
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
    if(_tmpBtn2== cbv) {
        //上次点击过的按钮，不做处理
    } else{
        //本次点击的按钮设为红色
        cbv.checked=YES;
        //将上次点击过的按钮设为黑色
        _tmpBtn2.checked=NO;
    }
    _tmpBtn2= cbv;
    
}
-(void)change52:(SSCheckBoxView*)cbv{
    
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
    if(_tmpBtn3== cbv) {
        //上次点击过的按钮，不做处理
    } else{
        //本次点击的按钮设为红色
        cbv.checked=YES;
        //将上次点击过的按钮设为黑色
        _tmpBtn3.checked=NO;
    }
    _tmpBtn3= cbv;
    
}
-(void)change49:(SSCheckBoxView*)cbv{
    
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
    if(_tmpBtn4== cbv) {
        //上次点击过的按钮，不做处理
    } else{
        //本次点击的按钮设为红色
        cbv.checked=YES;
        //将上次点击过的按钮设为黑色
        _tmpBtn4.checked=NO;
    }
    _tmpBtn4= cbv;
    
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



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        TwentyTwoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"FourPage"];
        
        [self.navigationController pushViewController:receive animated:YES];
    }
    else{
        
        _seg.selectedSegmentIndex=0;
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
            
        }else{
            
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"tip" message:@"If you switch the questionnaire, all answers will be cleared" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            [alertView show];
            
        }
        
    }
    
}

- (IBAction)nextBtn:(id)sender {
    
    int isok1=0;
    int isok2=0;
    int isok3=0;
    int isok4=0;

    
    
    
    
    NSMutableArray*Q1=[[NSMutableArray alloc] init];
    NSMutableArray*Q2=[[NSMutableArray alloc] init];
    NSMutableArray*Q3=[[NSMutableArray alloc] init];
    NSMutableArray*Q4=[[NSMutableArray alloc] init];

    
    
    for(int i=0;i<[_chooseArray1 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray1 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok1=1;
            [Q1 addObject:pp.textLabel.text];
            
        }
    }
    
    for(int i=0;i<[_chooseArray3 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray3 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok3=1;
            [Q3 addObject:pp.textLabel.text];
            
        }
    }
    for(int i=0;i<[_chooseArray4 count];i++)
       {
           
           SSCheckBoxView* pp=[_chooseArray4 objectAtIndex:i];
           
           if(pp.checked==1)
           {
               
               isok4=1;
               [Q4 addObject:pp.textLabel.text];
               
           }
       }
    
    
//        if (!isok3) {
//
//
//        //||_radioGroup1.sValue==nil||_radioGroup2.sValue==nil||_radioGroup3.sValue==nil||_radioGroup4.sValue==nil||_radioGroup5.sValue==nil||_radioGroup6.sValue==nil
//
//        //NSLog(@"%@",);
////            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
////            if (![user objectForKey:@"english"]) {
////                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请填写完整" message:@"请选择对应的选项" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
////                [alert show];
////            }else{
////
////                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please complete the form" message:@"Please select the option" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
////                [alert show];
////            }
//
//
//
//    }
    
      //  else{
            int a=0;
    
    for (SSCheckBoxView*pp in _chooseArray1) {
        
        if (pp.checked==YES&&[pp.textLabel.text isEqualToString:[_oneArray firstObject]]) {
            a=1;
            
            for(int i=0;i<[_chooseArray2 count];i++)
            {
                
                SSCheckBoxView* pp=[_chooseArray2 objectAtIndex:i];
                
                if(pp.checked==1)
                {
                    
                    isok2=1;
                
                    [Q2 addObject:pp.textLabel.text];
                    
                    
                    
                }
            }
            
        }
}
            if (a==1) {
                
            
                if (!isok2||!isok4) {
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
        NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
    
        NSDictionary *q1 =@{@"choose":Q1};
        NSDictionary *q2 =@{@"choose":Q2};
        NSDictionary *q3 =@{@"choose":Q3};
        NSDictionary *q4 =@{@"choose":Q4};

        
        NSDictionary*num1=@{@"49":q1};
        NSDictionary*num2=@{@"50":q2};
        NSDictionary*num3=@{@"51":q3};
        NSDictionary*num4=@{@"52":q4};

        
        
        
        
        NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
        
        
        
        
        NSLog(@"%@",[choose objectForKey:@"choose"]);
        NSMutableArray *discardedItems = [NSMutableArray array];
        
        for (NSDictionary*kk in lex) {
            
            if ([kk objectForKey:@"50"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"51"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"52"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"49"]) {
                          
                          NSLog(@"%@",kk);
                          
                          [discardedItems addObject:kk];
                          
                      }
            
            
            
            
            
        }
        
        [lex removeObjectsInArray:discardedItems];
        NSLog(@"%@",lex);
        NSArray*arr2=[NSArray arrayWithArray:lex];
        [choose setObject:arr2 forKey:@"choose"];
        [choose synchronize];
        
        
        
        
        NSMutableArray*arr=[NSMutableArray arrayWithObjects:num1,num2,num3,num4,nil];
        
        [arr addObjectsFromArray:[choose objectForKey:@"choose"]];
        
        
        NSArray*arr1=[NSArray arrayWithArray:arr];
        [choose setObject:arr1 forKey:@"choose"];
        [choose synchronize];
        NSLog(@"111111111111111%@",arr);
    
        
        
        
//        if ([zhushe objectForKey:@"zhushe"]||[anquan objectForKey:@"anquan"]) {
////            TwentyTwoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"23Page"];
////
////            [self.navigationController pushViewController:receive animated:YES];
//
//
//            if (!_twentythree) {
//
//                _twentythree= [self.storyboard instantiateViewControllerWithIdentifier:@"23Page"];
//            }
//
//
//
//            [self.navigationController pushViewController:_twentythree animated:YES];
//        }
//        else{
////            TwentyTwoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"24Page"];
////
////            [self.navigationController pushViewController:receive animated:YES];
//
//            if (!_twentyfour) {
//
//                _twentyfour= [self.storyboard instantiateViewControllerWithIdentifier:@"24Page"];
//            }
//
//
//
//            [self.navigationController pushViewController:_twentyfour animated:YES];
//        }

    if (!_twentytwo2) {
        
        _twentytwo2= [self.storyboard instantiateViewControllerWithIdentifier:@"22-1Page"];
    }
    
    
    
    [self.navigationController pushViewController:_twentytwo2 animated:YES];
    }
        
}
    else{
        NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
        
        
        
            NSDictionary *q1 =@{@"choose":Q1};
            //NSDictionary *q2 =@{@"choose":Q2};
            NSDictionary *q3 =@{@"choose":Q3};
        NSDictionary *q4 =@{@"choose":Q4};

            
            NSDictionary*num1=@{@"49":q1};
            //NSDictionary*num2=@{@"51":q2};
            NSDictionary*num3=@{@"51":q3};
            NSDictionary*num4=@{@"52":q4};
        
            
            
            
            
            NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
            
            
            
            
            NSLog(@"%@",[choose objectForKey:@"choose"]);
            NSMutableArray *discardedItems = [NSMutableArray array];
            
            for (NSDictionary*kk in lex) {
                
                if ([kk objectForKey:@"51"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }
                                if ([kk objectForKey:@"52"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }
                if ([kk objectForKey:@"49"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }
                
                
                
                
                
            }
            
            [lex removeObjectsInArray:discardedItems];
            NSLog(@"%@",lex);
            NSArray*arr2=[NSArray arrayWithArray:lex];
            [choose setObject:arr2 forKey:@"choose"];
            [choose synchronize];
            
            
            
            
            NSMutableArray*arr=[NSMutableArray arrayWithObjects:num1,num3,num4,nil];
            
            [arr addObjectsFromArray:[choose objectForKey:@"choose"]];
            
            
            NSArray*arr1=[NSArray arrayWithArray:arr];
            [choose setObject:arr1 forKey:@"choose"];
            [choose synchronize];
            NSLog(@"111111111111111%@",arr);
        
        
    
        
        
//        if ([zhushe objectForKey:@"zhushe"]||[anquan objectForKey:@"anquan"]) {
////            TwentyTwoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"23Page"];
////
////            [self.navigationController pushViewController:receive animated:YES];
//
//
//            if (!_twentythree) {
//
//                _twentythree= [self.storyboard instantiateViewControllerWithIdentifier:@"23Page"];
//            }
//
//
//
//            [self.navigationController pushViewController:_twentythree animated:YES];
//        }
//        else{
////            TwentyTwoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"24Page"];
////
////            [self.navigationController pushViewController:receive animated:YES];
//
//
//            if (!_twentyfour) {
//
//                _twentyfour= [self.storyboard instantiateViewControllerWithIdentifier:@"24Page"];
//            }
//
//
//
//            [self.navigationController pushViewController:_twentyfour animated:YES];
//        }

        
        if (!_twentytwo2) {
            
            _twentytwo2= [self.storyboard instantiateViewControllerWithIdentifier:@"22-1Page"];
        }
        
        
        
        [self.navigationController pushViewController:_twentytwo2 animated:YES];
            
            
            
        
        
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
//    NSString*photoName=[NSString stringWithFormat:@"%d",[[photoList objectForKey:@"photoList"] integerValue]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *date = [formatter stringFromDate:[NSDate date]];
    NSString*str=[[@"52_" stringByAppendingString:date] stringByAppendingString:@".jpg"];
    
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
            _img1.frame = CGRectMake(818, 327, 50, 50);
        }
        
        // commit动画
        [UIView commitAnimations];
        
    }
    
}
@end

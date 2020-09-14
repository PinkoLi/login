//
//  sixteenViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/4.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "sixteenViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "seventeenViewController.h"
#import "TwentyOneViewController.h"
#import "TwentyThreeViewController.h"
#import "TwentyFourViewController.h"

@interface sixteenViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn2;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn3;
@property(nonatomic,strong)seventeenViewController*seventeen;
@property(nonatomic,strong)TwentyOneViewController*twentyone;
@property(nonatomic,strong)TwentyThreeViewController*twentythree;
@property(nonatomic,strong)TwentyFourViewController*twentyfour;


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
@implementation sixteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
    _keshi.text=[keshi objectForKey:@"keshi"];
    
    _text1.delegate=self;
    
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
    
   
    [_lb1 setTextColor:UIColorFromRGB(0x034f9a)];
    [_lb2 setTextColor:UIColorFromRGB(0x034f9a)];
    [_lb3 setTextColor:UIColorFromRGB(0x034f9a)];
    
    
    
    
    
   
    
    _chooseArray1=[[NSMutableArray alloc] init];
    _chooseArray2=[[NSMutableArray alloc] init];
    _chooseArray3=[[NSMutableArray alloc] init];
    
    NSUserDefaults *map = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *BD = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@",[map objectForKey:@"map"]);
    NSLog(@"%@",[BD objectForKey:@"BD"]);
    
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        _lb1.text=@"37、If BD pre-set arterial blood collector was used, was the collector used by first pushing the pintle to the bottom and then drawing back to the correct pre-set position?";
        _lb1.lineBreakMode = UILineBreakModeWordWrap;
        _lb1.numberOfLines = 0;
        _lb2.text=@"38、Blood collection site";
        _lb3.text=@"39、Method of blood collection";
        
        
        
        
        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"Yes, the pintle was pushed to the bottom and then drawn back to the correct position",@"Yes, the pintle was pushed to the bottom but not drawn back to the correct position",@"No, the pintle was not pushed to the bottom but drawn back to the correct position",@"No, the pintle was neither pushed to the bottom nor drawn back to the correct position",nil];
       _twoArray=[[NSMutableArray alloc] initWithObjects:@"Radial artery",@"Brachial artery",@"Femoral artery",@"Arteria dorsalis pedis",@"Other",nil];
         _threeArray=[[NSMutableArray alloc] initWithObjects:@"Puncture",@"By catheter",nil];
        
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
        
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"桡动脉",@"肱动脉",@"股动脉",@"足背动脉",@"头皮动脉",@"股静脉",@"PICC",@"CVC",@"静脉留置针",@"其他部位",nil];
        _threeArray=[[NSMutableArray alloc] initWithObjects:@"动脉穿刺采血",@"动脉导管采血",@"静脉穿刺采血",@"静脉导管采血",nil];
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"未推到底，有拉到正确位置",@"未推到底，未拉到正确位置",@"有推到底，未拉到正确位置",@"有推到底，再拉到正确位置",nil];
        
        
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
        
                NSInteger index = i % 1;
                NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width + 50+Width_Space) + Start_X,  page*(Button_Height + Height_Space)+Start_Y-210, Button_Width+380, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
         cb.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        
        [cb setStateChangedTarget:self selector:@selector(change37:)];
        
        [_chooseArray1 addObject:cb];
        [_view2 addSubview:cb];
        
        if ([[map objectForKey:@"map"]isEqualToString:@"1"]) {
            _lb1.hidden=YES;
            cb.hidden=YES;
            _img1.hidden=YES;
            
        }
        else{
            _lb1.hidden=NO;
            cb.hidden=NO;
             _img1.hidden=NO;
        
        }
        NSLog(@"%@",[BD objectForKey:@"BD"]);
    
        if (![[BD objectForKey:@"BD"]isEqualToString:@"1"]) {
            _lb1.hidden=YES;
            cb.hidden=YES;
             _img1.hidden=YES;
            
        }
        else{
            _lb1.hidden=NO;
            cb.hidden=NO;
             _img1.hidden=NO;
            
        }
        
        
        
        
        
        
        
        
    }
    
#pragma 第二个问题
    
    
    
    
    
    
    for (int i=0; i<_twoArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        NSInteger index = i % 4;
        NSInteger page = i / 4;
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width + Width_Space-30) + Start_X,  page*(Button_Height + Height_Space)+Start_Y+30, Button_Width-30, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_twoArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change38:)];
        
        [_chooseArray2 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
        
        
    }
    
#pragma 第三个问题
    
    
    
    
    
    
    for (int i=0; i<_threeArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-80 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y+170, Button_Width-80, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_threeArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change39:)];
        
        [_chooseArray3 addObject:cb];
        
        [_view2 addSubview:cb];
        
        
        
        
        
        
        
    }
    [_view2 bringSubviewToFront:_text1];

}


-(void)change37:(SSCheckBoxView*)cbv{
    
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
    
}

-(void)change38:(SSCheckBoxView*)cbv{
    
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
    if (cbv.checked==YES&&[cbv.textLabel.text isEqualToString:[_twoArray lastObject]]) {
        _text1.enabled = YES;
    }
    else if (cbv.checked==NO&&[cbv.textLabel.text isEqualToString:[_twoArray lastObject]]){
        
        _text1.enabled = NO;
        _text1.text=@"";
    }
    else{
        
        _text1.text=@"";
        
    }

    
}
-(void)change39:(SSCheckBoxView*)cbv{
    
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
        sixteenViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"FourPage"];
        
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
    NSUserDefaults *map = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *BD = [NSUserDefaults standardUserDefaults];
    NSUserDefaults*zhushe=[NSUserDefaults standardUserDefaults];
    NSUserDefaults*anquan=[NSUserDefaults standardUserDefaults];


    NSLog(@"%@",[map objectForKey:@"map"]);
    
    NSLog(@"%@",[BD objectForKey:@"BD"]);
    
    if (![[map objectForKey:@"map"]isEqualToString:@"1"]&&[BD objectForKey:@"BD"]) {
    
    
    int isok1=0;
    int isok2=0;
    int isok3=0;
    
    
    
    NSMutableArray*Q1=[[NSMutableArray alloc] init];
    NSMutableArray*Q2=[[NSMutableArray alloc] init];
    NSMutableArray*Q3=[[NSMutableArray alloc] init];
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
        
        if (pp.checked==1&&[pp.textLabel.text isEqualToString:[_twoArray lastObject]]) {
            
            isok2=1;
            
            str=[[pp.textLabel.text stringByAppendingString:@"(" ] stringByAppendingString:_text1.text];
            str2=pp.textLabel.text;

            [Q2 addObject:str];
        }
        
        if (pp.checked==1&&![pp.textLabel.text isEqualToString:[_twoArray lastObject]] )
        {
            
            isok2=1;
            [Q2 addObject:pp.textLabel.text];
            str2=pp.textLabel.text;
            
        }
        
       

        
    }
        
        if (isok2==1) {
            if ([str2 isEqualToString:[_twoArray lastObject]]) {
                if (_text1.text==nil||[_text1.text isEqualToString:@""]) {
                    isok2=0;
                }
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
        
        if (pp.checked==1&&[pp.textLabel.text isEqualToString:[_threeArray firstObject]]) {
              NSUserDefaults *caixue = [NSUserDefaults standardUserDefaults];
            [caixue setObject:@"chuanci" forKey:@"caixue"];
            [caixue synchronize];
        }
        else if (pp.checked==1&&[pp.textLabel.text isEqualToString:[_threeArray objectAtIndex:1]]) {
              NSUserDefaults *caixue = [NSUserDefaults standardUserDefaults];
            [caixue setObject:@"daoguan" forKey:@"caixue"];
            [caixue synchronize];
        }
        else if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_threeArray lastObject]]){
            NSUserDefaults *caixue = [NSUserDefaults standardUserDefaults];
            [caixue removeObjectForKey:@"caixue"];
            [caixue synchronize];
        
        }
    }
    if (!isok1||!isok2||!isok3) {
        
        
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
        
        NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
        
        
        NSDictionary *q1 =@{@"choose":Q1};
        NSDictionary *q2 =@{@"choose":Q2};
        NSDictionary *q3 =@{@"choose":Q3};
        
        NSDictionary*num1=@{@"37":q1};
        NSDictionary*num2=@{@"38":q2};
        NSDictionary*num3=@{@"39":q3};
        
        
        
        
        NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
        
        
        
        
        NSLog(@"%@",[choose objectForKey:@"choose"]);
        NSMutableArray *discardedItems = [NSMutableArray array];
        
        for (NSDictionary*kk in lex) {
            
            if ([kk objectForKey:@"37"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"38"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"39"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            
            
            
            
            
        }
        
        [lex removeObjectsInArray:discardedItems];
        NSLog(@"%@",lex);
        NSArray*arr2=[NSArray arrayWithArray:lex];
        [choose setObject:arr2 forKey:@"choose"];
        [choose synchronize];
        
        
        
        
        NSMutableArray*arr=[NSMutableArray arrayWithObjects:num1,num2,num3,nil];
        
        [arr addObjectsFromArray:[choose objectForKey:@"choose"]];
        
        
        NSArray*arr1=[NSArray arrayWithArray:arr];
        [choose setObject:arr1 forKey:@"choose"];
        [choose synchronize];
        NSLog(@"111111111111111%@",arr);

         NSUserDefaults *caixue = [NSUserDefaults standardUserDefaults];
       // NSUserDefaults *gongju = [NSUserDefaults standardUserDefaults];

        if ([[caixue objectForKey:@"caixue"] isEqualToString:@"chuanci"]) {
//            sixteenViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"seventeenPage"];
//            
//            [self.navigationController pushViewController:receive animated:YES];

        
            if (!_seventeen) {
                
                _seventeen= [self.storyboard instantiateViewControllerWithIdentifier:@"seventeenPage"];
            }
            
            [caixue removeObjectForKey:@"caixue"];
            [caixue synchronize];
            
            [self.navigationController pushViewController:_seventeen animated:YES];
}
        else if ([[caixue objectForKey:@"caixue"] isEqualToString:@"daoguan"]) {
        //            sixteenViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"seventeenPage"];
        //
        //            [self.navigationController pushViewController:receive animated:YES];

                if (!_twentyone) {
                        
                        _twentyone= [self.storyboard instantiateViewControllerWithIdentifier:@"21Page"];
                    }
                    
                    [caixue removeObjectForKey:@"caixue"];
                    [caixue synchronize];
                    
                    [self.navigationController pushViewController:_twentyone animated:YES];
        }
        else{
        
//        sixteenViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"21Page"];
//        
//        [self.navigationController pushViewController:receive animated:YES];
            
            
            NSLog(@"%@",[zhushe objectForKey:@"zhushe"]);
            
            
            
            if ([[zhushe objectForKey:@"zhushe"]isEqualToString:@"0"]||[anquan objectForKey:@"anquan"]) {
                if (!_twentythree) {
                    
                    _twentythree= [self.storyboard instantiateViewControllerWithIdentifier:@"23Page"];
                }
                
                [caixue removeObjectForKey:@"caixue"];
                [caixue synchronize];
                
                [self.navigationController pushViewController:_twentythree animated:YES];
                
            }else{
                if (!_twentyfour) {
                    
                    _twentyfour= [self.storyboard instantiateViewControllerWithIdentifier:@"24Page"];
                }
                
                [caixue removeObjectForKey:@"caixue"];
                [caixue synchronize];
                
                [self.navigationController pushViewController:_twentyfour animated:YES];
                
            }

            
        }
        
    }
    }else{
    
       
        int isok2=0;
        int isok3=0;
        
        
        
      
        NSMutableArray*Q2=[[NSMutableArray alloc] init];
        NSMutableArray*Q3=[[NSMutableArray alloc] init];
        
         NSString*str=[[NSString alloc] init];
        NSString*str2=[[NSString alloc] init];

        
        
        
        
        for(int i=0;i<[_chooseArray2 count];i++)
        {
            
            SSCheckBoxView* pp=[_chooseArray2 objectAtIndex:i];
            
            if (pp.checked==1&&[pp.textLabel.text isEqualToString:[_twoArray lastObject]]) {
                
                isok2=1;
                str2=pp.textLabel.text;

                str=[[pp.textLabel.text stringByAppendingString:@"(" ] stringByAppendingString:_text1.text];
                [Q2 addObject:str];
            }
            
            if (pp.checked==1&&![pp.textLabel.text isEqualToString:[_twoArray lastObject]] )
            {
                
                isok2=1;
                [Q2 addObject:pp.textLabel.text];
                str2=pp.textLabel.text;

            }
            
           
            
            
        }
            if (isok2==1) {
        if ([str2 isEqualToString:[_twoArray lastObject]]) {
            if (_text1.text==nil||[_text1.text isEqualToString:@""]) {
                isok2=0;
            }
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
            
            if (pp.checked==1&&[pp.textLabel.text isEqualToString:[_threeArray firstObject]]) {
                NSUserDefaults *caixue = [NSUserDefaults standardUserDefaults];
                [caixue setObject:@"chuanci" forKey:@"caixue"];
                [caixue synchronize];
            }
         else if (pp.checked==1&&[pp.textLabel.text isEqualToString:[_threeArray objectAtIndex:1]]) {
                           NSUserDefaults *caixue = [NSUserDefaults standardUserDefaults];
                           [caixue setObject:@"daoguan" forKey:@"caixue"];
                           [caixue synchronize];
                       }
            else if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_threeArray lastObject]]){
                NSUserDefaults *caixue = [NSUserDefaults standardUserDefaults];
                [caixue removeObjectForKey:@"caixue"];
                [caixue synchronize];
                
            }
        }
        if (!isok2||!isok3) {
            
            
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
            
            NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
            
            
            
            NSDictionary *q2 =@{@"choose":Q2};
            NSDictionary *q3 =@{@"choose":Q3};
            
           
            NSDictionary*num2=@{@"38":q2};
            NSDictionary*num3=@{@"39":q3};
            
            
            
            
            NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
            
            
            
            
            NSLog(@"%@",[choose objectForKey:@"choose"]);
            NSMutableArray *discardedItems = [NSMutableArray array];
            
            for (NSDictionary*kk in lex) {
                               if ([kk objectForKey:@"38"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }
                if ([kk objectForKey:@"39"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }
                
                if ([kk objectForKey:@"37"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }

                
                
                
            }
            
            [lex removeObjectsInArray:discardedItems];
            NSLog(@"%@",lex);
            NSArray*arr2=[NSArray arrayWithArray:lex];
            [choose setObject:arr2 forKey:@"choose"];
            [choose synchronize];
            
            
            
            
            NSMutableArray*arr=[NSMutableArray arrayWithObjects:num2,num3,nil];
            
            [arr addObjectsFromArray:[choose objectForKey:@"choose"]];
            
            
            NSArray*arr1=[NSArray arrayWithArray:arr];
            [choose setObject:arr1 forKey:@"choose"];
            [choose synchronize];
            NSLog(@"111111111111111%@",arr);
            
            NSUserDefaults *caixue = [NSUserDefaults standardUserDefaults];
            NSLog(@"caixue:%@",caixue);
            if ([[caixue objectForKey:@"caixue"] isEqual:@"chuanci"]) {
//                sixteenViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"seventeenPage"];
//                
//                [self.navigationController pushViewController:receive animated:YES];

            
                
                if (!_seventeen) {
                    
                    _seventeen= [self.storyboard instantiateViewControllerWithIdentifier:@"seventeenPage"];
                }
                [caixue removeObjectForKey:@"caixue"];
                [caixue synchronize];
                
                
                [self.navigationController pushViewController:_seventeen animated:YES];
}
            else if ([[caixue objectForKey:@"caixue"] isEqual:@"daoguan"]) {
            //                sixteenViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"seventeenPage"];
            //
            //                [self.navigationController pushViewController:receive animated:YES];

                        
                            
                            if (!_twentyone) {
                                
                                _twentyone= [self.storyboard instantiateViewControllerWithIdentifier:@"21Page"];
                            }
                            
                            [caixue removeObjectForKey:@"caixue"];
                            [caixue synchronize];
                            
                            [self.navigationController pushViewController:_twentyone animated:YES];
            }
            else{
                
//                sixteenViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"21Page"];
//                
//                [self.navigationController pushViewController:receive animated:YES];

                
//                if (!_twentythree) {
//
//                    _twentythree= [self.storyboard instantiateViewControllerWithIdentifier:@"23Page"];
//                }
//
//
//                [caixue removeObjectForKey:@"caixue"];
//                [caixue synchronize];
//
//                [self.navigationController pushViewController:_twentythree animated:YES];

                NSLog(@"%@",[zhushe objectForKey:@"zhushe"]);
                
                if ([[zhushe objectForKey:@"zhushe"]isEqualToString:@"0"]||[anquan objectForKey:@"anquan"]) {
                               if (!_twentythree) {
                                   
                                   _twentythree= [self.storyboard instantiateViewControllerWithIdentifier:@"23Page"];
                               }
                               
                               [caixue removeObjectForKey:@"caixue"];
                               [caixue synchronize];
                               
                               [self.navigationController pushViewController:_twentythree animated:YES];
                               
                           }else{
                               if (!_twentyfour) {
                                   
                                   _twentyfour= [self.storyboard instantiateViewControllerWithIdentifier:@"24Page"];
                               }
                               
                               [caixue removeObjectForKey:@"caixue"];
                               [caixue synchronize];
                               
                               [self.navigationController pushViewController:_twentyfour animated:YES];
                               
                           }
            }
            
        }
    
    
    }

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
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-200 , self.view.frame.size.width, self.view.frame.size.height);
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
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+200 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}

@end

//
//  nightViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/3.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "nightViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "tenViewController.h"
@interface nightViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn2;
@property(nonatomic,strong)tenViewController*ten;
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
@implementation nightViewController

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
    
  
    [_lb1 setTextColor:UIColorFromRGB(0x034f9a)];
    [_lb2 setTextColor:UIColorFromRGB(0x034f9a)];
    
    
   
    
    _chooseArray1=[[NSMutableArray alloc] init];
    _chooseArray2=[[NSMutableArray alloc] init];
    _lb2.hidden=YES;
    _image.hidden=YES;
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        _lb1.text=@"20、Was evaluation of the blood collection site and the blood vessel performed, for example, collateral circulation, skin status, blood collection site, etc.?";
        _lb1.lineBreakMode = UILineBreakModeWordWrap;
        _lb1.numberOfLines = 0;
        _lb2.text=@"21、Was Allen's test performed on the radial artery?";
       
        
        
        
        
        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"NO",nil];
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"NO",@"The blood collection site is not on the radial artery",nil];
        
        [_next setImage:[UIImage imageNamed:@"继续答题英文.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"英文2"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;
        [_seg setTitle:@"Within-department survey" forSegmentAtIndex:0];
        [_seg setTitle:@"Laboratory survey" forSegmentAtIndex:1];
        
    }
    else{
        
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否",@"未评估桡动脉",nil];
       
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否",nil];
        
        [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB2"ofType:@"png"];
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
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-80 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y-250, Button_Width+300, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change20:)];
        
        [_chooseArray1 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
    }
    
#pragma 第二个问题
    
   
    
    
    
    
    for (int i=0; i<_twoArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-80 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y+100, Button_Width+300, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_twoArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change21:)];
        
        [_chooseArray2 addObject:cb];
        [_view2 addSubview:cb];
        cb.hidden=YES;
        
        
        
        
        
        
        
    }

}


-(void)change20:(SSCheckBoxView*)cbv{
    
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
    
    if (cbv.checked==YES&&[cbv.textLabel.text isEqualToString:_oneArray.firstObject]) {
        NSLog(@"1111111");
        
        for (SSCheckBoxView*pp in _chooseArray2) {
            
            pp.hidden=NO;
            _lb2.hidden=NO;
            _image.hidden=NO;
        }
    }
    
    else{
        
        for (SSCheckBoxView*pp in _chooseArray2) {
            
            pp.hidden=YES;
            pp.checked=NO;
            _lb2.hidden=YES;
            _image.hidden=YES;
        }
        
    }

    
}
-(void)change21:(SSCheckBoxView*)cbv{
    
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
    
    
    
    for(int i=0;i<[_chooseArray1 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray1 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok1=1;
            [Q1 addObject:pp.textLabel.text];
            
        }
    }
    
    if (!isok1) {
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请填写完整" message:@"请选择对应的选项" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
            [alert show];
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please complete the form" message:@"Please select the option" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }

       
        
        
        
    }else{
    
    for (SSCheckBoxView*pp in _chooseArray1) {
        
        if (pp.checked==YES&&[pp.textLabel.text isEqualToString:[_oneArray firstObject]]) {
            
            for(int i=0;i<[_chooseArray2 count];i++)
            {
                
                SSCheckBoxView* pp=[_chooseArray2 objectAtIndex:i];
                
                if(pp.checked==1)
                {
                    
                    isok2=1;
                    [Q2 addObject:pp.textLabel.text];
                    
                    
                    }
               
                
                
            }
            
            if (!isok2) {
                
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
                
                NSDictionary*num1=@{@"20":q1};
                NSDictionary*num2=@{@"21":q2};
                
                
                
                
                
                NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
                
                
                
                
                NSLog(@"%@",[choose objectForKey:@"choose"]);
                NSMutableArray *discardedItems = [NSMutableArray array];
                
                for (NSDictionary*kk in lex) {
                    
                    if ([kk objectForKey:@"20"]) {
                        
                        NSLog(@"%@",kk);
                        
                        [discardedItems addObject:kk];
                        
                    }
                    if ([kk objectForKey:@"21"]) {
                        
                        NSLog(@"%@",kk);
                        
                        [discardedItems addObject:kk];
                        
                    }
                    
                    
                    
                    
                    
                }
                
                [lex removeObjectsInArray:discardedItems];
                NSLog(@"%@",lex);
                NSArray*arr2=[NSArray arrayWithArray:lex];
                [choose setObject:arr2 forKey:@"choose"];
                [choose synchronize];
                
                
                
                
                NSMutableArray*arr=[NSMutableArray arrayWithObjects:num1,num2,nil];
                
                [arr addObjectsFromArray:[choose objectForKey:@"choose"]];
                
                
                NSArray*arr1=[NSArray arrayWithArray:arr];
                [choose setObject:arr1 forKey:@"choose"];
                [choose synchronize];
                NSLog(@"111111111111111%@",[choose objectForKey:@"choose"]);
                
                
                
                nightViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"tenPage"];
                
                [self.navigationController pushViewController:receive animated:YES];
            }
            
        }
        
        
        
        
        else  if (pp.checked==YES&&[pp.textLabel.text isEqualToString:[_oneArray lastObject]]) {
            
            
            NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
            
            
            NSDictionary *q1 =@{@"choose":Q1};
          
            
            NSDictionary*num1=@{@"20":q1};
            
            
            
            
            
            NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
            
            
            
            
            NSLog(@"%@",[choose objectForKey:@"choose"]);
            NSMutableArray *discardedItems = [NSMutableArray array];
            
            for (NSDictionary*kk in lex) {
                
                if ([kk objectForKey:@"20"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }
                if ([kk objectForKey:@"21"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }
                
                
                
                
                
            }
            
            [lex removeObjectsInArray:discardedItems];
            NSLog(@"%@",lex);
            NSArray*arr2=[NSArray arrayWithArray:lex];
            [choose setObject:arr2 forKey:@"choose"];
            [choose synchronize];
            
            
            
            
            NSMutableArray*arr=[NSMutableArray arrayWithObjects:num1,nil];
            
            [arr addObjectsFromArray:[choose objectForKey:@"choose"]];
            
            
            NSArray*arr1=[NSArray arrayWithArray:arr];
            [choose setObject:arr1 forKey:@"choose"];
            [choose synchronize];
            NSLog(@"111111111111111%@",[choose objectForKey:@"choose"]);
            
            
//            nightViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"tenPage"];
//            
//            [self.navigationController pushViewController:receive animated:YES];
            if (!_ten) {
                
                _ten= [self.storyboard instantiateViewControllerWithIdentifier:@"tenPage"];
            }
            
            
            
            [self.navigationController pushViewController:_ten animated:YES];
           
            
        }
        
       
        
        
        
    }
        
    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        nightViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"FourPage"];
        
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
@end

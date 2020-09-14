//
//  ThirtyViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/6.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "ThirtyViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
@interface ThirtyViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn2;
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
@implementation ThirtyViewController

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
    
   
    [_lb1 setTextColor:UIColorFromRGB(0x034f9a)];
    [_lb2 setTextColor:UIColorFromRGB(0x034f9a)];
  
    
    
       
    _chooseArray1=[[NSMutableArray alloc] init];
    _chooseArray2=[[NSMutableArray alloc] init];
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        _lb1.text=@"71、Were the samples mixed again before being loaded for testing?";
        _lb2.text=@"72、Was one or two drops of blood in the front end of the sample discarded again before the sample as loaded for testing?";
       
        _lb2.lineBreakMode = UILineBreakModeWordWrap;
        _lb2.numberOfLines = 0;
        
        
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"NO",nil];
        
       
        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"NO",nil];
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
        
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否",nil];
        
       
        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否",nil];
        
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
        
        //        NSInteger index = i % 3;
        //        NSInteger page = i / 3;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-100 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y-250, Button_Width-100, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change71:)];
        
        [_chooseArray1 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
    }
    
#pragma 第二个问题
    
    
    
    
    
    for (int i=0; i<_twoArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-100 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y-100, Button_Width-100, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_twoArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change72:)];
        
        [_chooseArray2 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
        
    }

   
}

-(void)change71:(SSCheckBoxView*)cbv{
    
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

-(void)change72:(SSCheckBoxView*)cbv{
    
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
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if ([user objectForKey:@"123"]) {
            ThirtyViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"sixPage"];
            
            [self.navigationController pushViewController:receive animated:YES];
            
            
        }else{
            ThirtyViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"onePage"];
            
            [self.navigationController pushViewController:receive animated:YES];
            
        }
    }
    else{
        
        _seg.selectedSegmentIndex=0;
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
    
    
    
    for(int i=0;i<[_chooseArray2 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray2 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok2=1;
            [Q2 addObject:pp.textLabel.text];
            
        }
    }
    
        if (!isok1||!isok2) {
        
        
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
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
            NSUserDefaults *number = [NSUserDefaults standardUserDefaults];
            
            //NSDictionary *q2 =@{@"text":_textLb2.text};
            NSDictionary *q1 =@{@"choose":Q1};
            NSDictionary *q2 =@{@"choose":Q2};
//            NSDictionary *q3 =@{@"name":[user objectForKey:@"name"]};
//            NSDictionary *q4 =@{@"keshi":[keshi objectForKey:@"keshi"]};
//            NSDictionary *q5 =@{@"number":[number objectForKey:@"number"]};
            
            NSString*b=[self shuffledAlphabet];
           // NSDictionary *q6 =@{@"pid":b};
            
            
            NSDictionary*num1=@{@"71":q1};
            NSDictionary*num2=@{@"72":q2};
//            NSDictionary*num3=@{@"name":q3};
//            NSDictionary*num4=@{@"keshi":q4};
//            NSDictionary*num5=@{@"number":q5};
//            NSDictionary*num6=@{@"pid":q6};
            
            
            //        NSMutableArray*arr=[[NSMutableArray alloc] init];
            //        [arr addObject:num2];
            //        [arr addObject:num3];
            //        [arr addObject:num4];
            
            NSUserDefaults *shiyan = [NSUserDefaults standardUserDefaults];
            NSUserDefaults *shiyanshi = [NSUserDefaults standardUserDefaults];
            if ([[shiyan objectForKey:@"shiyan"]count]==0) {
                NSMutableArray*arr=[NSMutableArray arrayWithObjects:num1,num2, nil];
                
                NSArray*arr1=[NSArray arrayWithArray:arr];
                [shiyan setObject:arr1 forKey:@"shiyan"];
                [shiyan synchronize];
                
                
            }
            
            else{
                
                NSMutableArray*lex=[NSMutableArray arrayWithArray:[shiyan objectForKey:@"shiyan"]];
                
                
                
                
                NSLog(@"%@",[shiyan objectForKey:@"shiyan"]);
                NSMutableArray *discardedItems = [NSMutableArray array];
                
                for (NSDictionary*kk in lex) {
                    
                    if ([kk objectForKey:@"71"]) {
                        
                        NSLog(@"%@",kk);
                        
                        [discardedItems addObject:kk];
                        
                    }
                    if ([kk objectForKey:@"72"]) {
                        
                        [discardedItems addObject:kk];
                        
                    }
                    
                    
                    
                }
                
                [lex removeObjectsInArray:discardedItems];
                NSLog(@"%@",lex);
                NSArray*arr2=[NSArray arrayWithArray:lex];
                [shiyan setObject:arr2 forKey:@"shiyan"];
                [shiyan synchronize];
                
                
                
                
                NSMutableArray*arr=[NSMutableArray arrayWithObjects: num1,num2,nil];
                
                [arr addObjectsFromArray:[shiyan objectForKey:@"shiyan"]];
                
                
                NSArray*arr1=[NSArray arrayWithArray:arr];
                [shiyan setObject:arr1 forKey:@"shiyan"];
                [shiyan synchronize];
                
                //[shiyanshi removeObjectForKey:@"shiyanshi"];

                
                
                
                if ([[shiyanshi objectForKey:@"shiyanshi"]count]==0) {
//                    NSMutableArray* allArr=[NSMutableArray arrayWithObject:arr];
//                    NSMutableArray* allArr2=[NSMutableArray arrayWithObject:allArr];
//
//                    NSArray*arr=[NSArray arrayWithArray:allArr2];
//                    // NSArray*arr=[NSArray arrayWithArray:[choose objectForKey:@"choose"]];
//                    [shiyanshi setObject:arr forKey:@"shiyanshi"];
//                     [shiyan removeObjectForKey:@"shiyan"];
//                    [shiyanshi synchronize];
//                    [shiyan synchronize];
                    
                    
                    
                 
                    
                    
                    NSString*local=@"0";
                    NSString*userid=[user objectForKey:@"userid"];
                    NSDictionary*data=@{@"number":[number objectForKey:@"number"],@"keshi":[keshi objectForKey:@"keshi"],@"uino":b,@"local":local,@"userid":userid,@"survey_data":arr1};
                    
                    
                   // NSArray*department=[shiyanshi objectForKey:@"shiyanshi"];
                     NSMutableArray* allArr=[NSMutableArray new];
                   // [allArr addObject:department];
                    [allArr addObject:data];
                    
                    
                    NSArray*department2=[NSArray arrayWithArray:allArr];
                    
                    [shiyanshi setObject:department2 forKey:@"shiyanshi"];                    [shiyan removeObjectForKey:@"shiyan"];
                    [shiyanshi synchronize];
                    [shiyan synchronize];

                    
                }
                
                else{
                    
                    
//                    NSMutableArray* allArr=[NSMutableArray arrayWithObject:arr];
//
//                    NSMutableArray* allArr2=[NSMutableArray arrayWithObject:allArr];
//
//                    NSLog(@"%@",allArr);
//
//                    [allArr2 addObjectsFromArray:[shiyanshi objectForKey:@"shiyanshi"]];
//
//
//
//                    NSArray*arr=[NSArray arrayWithArray:allArr2];
//                    [shiyanshi setObject:arr forKey:@"shiyanshi"];
//                    [shiyan removeObjectForKey:@"shiyan"];
//
//                    [shiyanshi synchronize];
//                    [shiyan synchronize];
                 
                   
                    NSString*local=@"0";
                    NSString*userid=[user objectForKey:@"userid"];
                    NSDictionary*data=@{@"number":[number objectForKey:@"number"],@"keshi":[keshi objectForKey:@"keshi"],@"uino":b,@"local":local,@"userid":userid,@"survey_data":arr1};
                    NSArray*department=[shiyanshi objectForKey:@"shiyanshi"];
                     NSMutableArray* allArr=[NSMutableArray new];
                    [allArr addObjectsFromArray:department];
                    [allArr addObject:data];
                    NSArray*department2=[NSArray arrayWithArray:allArr];
                    
                    [shiyanshi setObject:department2 forKey:@"shiyanshi"];
                    
                    
                    [shiyan removeObjectForKey:@"shiyan"];
                    [shiyanshi synchronize];
                    [shiyan synchronize];
                    
                    
                    
                }

                
                
            }
            
           
            NSLog(@"%@",[shiyanshi objectForKey:@"shiyanshi"]);
            
            ThirtyViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"listPage"];
            
            [self.navigationController pushViewController:receive animated:YES];
            
        }
}



- (NSString *)shuffledAlphabet {
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [alphabet length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [alphabet getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSUInteger j = (arc4random_uniform(numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    // Turn the result back into a string
    NSString *result = [NSString stringWithCharacters:characters length:numberOfCharacters];
    free(characters);
    return result;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

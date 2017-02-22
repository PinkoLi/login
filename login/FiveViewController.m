//
//  FiveViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/2.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "FiveViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "SixViewController.h"
@interface FiveViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn2;
@property(nonatomic,strong)SixViewController*six;
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
@implementation FiveViewController

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
    
     _text1.enabled = NO;
    _text2.enabled=NO;
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        _lb1.text=@"9、Place loaded";
        _lb2.text=@"10、Collected by (multiple choice)";
       
        
        
        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"Department",@" ICU",@"Emergency",@"Respiratory",@"Anesthesiology",@"Other",nil];
         _twoArray=[[NSMutableArray alloc] initWithObjects:@"Doctor",@"Nurse",@"Other(e.g., technician)",nil];
        
        [_next setImage:[UIImage imageNamed:@"继续答题英文.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"英文"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;
        [_seg setTitle:@"Within-department survey" forSegmentAtIndex:0];
        [_seg setTitle:@"Laboratory survey" forSegmentAtIndex:1];
    }
    else{
        
       _oneArray=[[NSMutableArray alloc] initWithObjects:@"检验科",@"重症",@"急诊",@"呼吸",@"麻醉",@"其他",nil];
         _twoArray=[[NSMutableArray alloc] initWithObjects:@"医生",@"护士",@"其他（如技术人员)",nil];
        
        [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB1"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;

    }

    
    
#pragma 第一个问题
    
   
    
    
    
    
    for (int i=0; i<_oneArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
                NSInteger index = i % 3;
                NSInteger page = i / 3;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width-30 + Width_Space-30) + Start_X,  page*(Button_Height + Height_Space)+Start_Y-220, Button_Width+50, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change9:)];
        
        [_chooseArray1 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
    }
    
#pragma 第二个问题
    
   
    
    
    
    
    for (int i=0; i<_twoArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-100 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y-100, Button_Width+50, Button_Height) style:kSSCheckBoxViewStyleBox checked:NO];
        NSString *a1 = [_twoArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change10:)];
        
        [_chooseArray2 addObject:cb];
        [_view2 addSubview:cb];

        
        
        
        
        
        
    }

    [_view2 bringSubviewToFront:_text1];
    [_view2 bringSubviewToFront:_text2];

}



-(void)change9:(SSCheckBoxView*)cbv{
    
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
    
    if (cbv.checked==YES&&[cbv.textLabel.text isEqualToString:[_oneArray lastObject]]) {
        _text1.enabled = YES;
    }
    else if (cbv.checked==NO&&[cbv.textLabel.text isEqualToString:[_oneArray lastObject]]){
        
        _text1.enabled = NO;
        _text1.text=@"";
    }
    else{
        
        _text1.text=@"";
        
    }

    
}

-(void)change10:(SSCheckBoxView*)cbv{
    
//    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
//    
//    if(_tmpBtn2== cbv) {
//        //上次点击过的按钮，不做处理
//    } else{
//        //本次点击的按钮设为红色
//        cbv.checked=YES;
//        //将上次点击过的按钮设为黑色
//        _tmpBtn2.checked=NO;
//    }
//    _tmpBtn2= cbv;
    
    
    if (cbv.checked==YES&&[cbv.textLabel.text isEqualToString:[_twoArray lastObject]]) {
        _text2.enabled = YES;
    }
    else if (cbv.checked==NO&&[cbv.textLabel.text isEqualToString:[_twoArray lastObject]]){
        
        _text2.enabled = NO;
        _text2.text=@"";
    }
    else{
        
        _text2.text=@"";
        
    }

    
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
        
        if(pp.checked==1&&![pp.textLabel.text isEqualToString:[_oneArray lastObject]])
        {
            
            isok1=1;
            [Q1 addObject:pp.textLabel.text];
            _chooseStr=pp.textLabel.text;
            
        }
        
        if (pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray lastObject]]) {
            
            isok1=1;
            _chooseStr=pp.textLabel.text;
            str=[[pp.textLabel.text stringByAppendingString:@"(" ] stringByAppendingString:_text1.text];
            [Q1 addObject:str];
        }

    }
    for(int i=0;i<[_chooseArray2 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray2 objectAtIndex:i];
        
        if(pp.checked==1&&![pp.textLabel.text isEqualToString:[_twoArray lastObject]])
        {
            
            isok2=1;
            [Q2 addObject:pp.textLabel.text];
            _chooseStr2=pp.textLabel.text;
            
        }
        
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_twoArray lastObject]])
        {
            
            isok2=1;
           
            _chooseStr2=pp.textLabel.text;
            
            str2=[[pp.textLabel.text stringByAppendingString:@"(" ] stringByAppendingString:_text2.text];
            [Q2 addObject:str2];
            
        }
    }
    if (isok1==1) {
        if ([_chooseStr isEqualToString:[_oneArray lastObject]]) {
            if (_text1.text==nil||[_text1.text isEqualToString:@""]) {
                isok1=0;
            }
        }
    }
    if (isok2==1) {
        if ([_chooseStr2 isEqualToString:[_twoArray lastObject]]) {
            if (_text2.text==nil||[_text2.text isEqualToString:@""]) {
                isok2=0;
            }
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
        NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
        
        
        NSDictionary *q1 =@{@"choose":Q1};
        NSDictionary *q2 =@{@"choose":Q2};
      
        
        NSDictionary*num1=@{@"9":q1};
        NSDictionary*num2=@{@"10":q2};
       
        
        
        
        
        NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
        
        
        
        
        NSLog(@"%@",[choose objectForKey:@"choose"]);
        NSMutableArray *discardedItems = [NSMutableArray array];
        
        for (NSDictionary*kk in lex) {
            
            if ([kk objectForKey:@"9"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"10"]) {
                
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
        NSLog(@"111111111111111%@",arr);

        

        if (!_six) {
            
            _six= [self.storyboard instantiateViewControllerWithIdentifier:@"sixPage"];
        }
        
        
        
        [self.navigationController pushViewController:_six animated:YES];
    
//    FiveViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"sixPage"];
//    
//    [self.navigationController pushViewController:receive animated:YES];
        
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
            self.view.frame = CGRectMake(self.view.frame.origin.x+215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x-215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-220 , self.view.frame.size.width, self.view.frame.size.height);
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
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+220 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        FiveViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"FourPage"];
        
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

//
//  ThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/2.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "ThreeViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "FourViewController.h"
@interface ThreeViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn2;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn3;

@property(nonatomic,strong)FourViewController*four;
@property(nonatomic)bool isFullScreen;
@property(nonatomic,assign)NSInteger a;
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
@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _img1.tag = 10000;
    _img2.tag = 10001;
    NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
    _keshi.text=[keshi objectForKey:@"keshi"];
    
    NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@",[choose objectForKey:@"choose"]);
    
    _chooseArray1=[[NSMutableArray alloc] init];
    _chooseArray2=[[NSMutableArray alloc] init];
    _chooseArray3=[[NSMutableArray alloc] init];
    
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
    [_lb4 setTextColor:UIColorFromRGB(0x034f9a)];
    
   
    
   
    
    _text1.enabled = NO;
    _text2.enabled = NO;
    _text3.enabled = NO;
    _text4.enabled = NO;
    _text5.enabled = NO;
    _text6.enabled = NO;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        _lb1.text=@"5、If any syringe was used, how was heparin prepared for rinsing the syringe:";
        _lb2.text=@"5.1、Type of heparin:";
         _lb3.text=@"5.2、Method of preparation:";
         _lb4.text=@"5.3、Frequency of preparation:";
        
       [_photoBtn setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];
         [_photoBtn2 setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"Heparin sodium aqueous",@"Heparin lithium aqueous",@"Freeze-dried heparin + normal saline",nil];
         _twoArray=[[NSMutableArray alloc] initWithObjects:@"If heparin sodium/lithium aqueous     ml of     IU heparin solution+        ml of normal saline",@"If freeze-dried heparin           g of freeze-dried heparin+        ml of normal saline",nil];
         _threeArray=[[NSMutableArray alloc] initWithObjects:@"Prepared for single use",@" Prepared for multiple use",@"Other",nil];
        
        [_next setImage:[UIImage imageNamed:@"继续答题英文.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"英文"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        
        
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;
        [_seg setTitle:@"Within-department survey" forSegmentAtIndex:0];
        [_seg setTitle:@"Laboratory survey" forSegmentAtIndex:1];
        
        for (int i=0; i<_twoArray.count; i++) {
            
            //        float x = i%5;
            //
            //        float y = i/5;
            
            NSInteger index = i % 1;
            NSInteger page = i / 1;
            
            
            
            SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width + Width_Space) + Start_X-40,  page*(Button_Height + Height_Space)+Start_Y-30, Button_Width+800, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
            NSString *a1 = [_twoArray objectAtIndex:i];
            
            [cb setText:a1];
            
            
            [cb setStateChangedTarget:self selector:@selector(change502:)];
            [_chooseArray2 addObject:cb];
            
            [_view2 addSubview:cb];
            
            
            
            
            
            
            
            
        }

       
    }
    else{
        
         [_photoBtn setImage:[UIImage imageNamed:@"建议拍照.png"] forState:UIControlStateNormal];
         [_photoBtn2 setImage:[UIImage imageNamed:@"建议拍照.png"] forState:UIControlStateNormal];
    
     _oneArray=[[NSMutableArray alloc] initWithObjects:@"肝素钠溶液",@"肝素锂溶液",@"冻干肝素+生理盐水",nil];
          _threeArray=[[NSMutableArray alloc] initWithObjects:@"一次一配",@"一配多次使用",@"其他",nil];
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"如肝素钠/锂溶液                  IU               ml肝素溶液+                 ml生理盐水",@"如冻干肝素                  克冻干肝素+                   ml生理盐水",nil];
        
       
      
        _text1.frame=CGRectMake(230, 277, 77, 30);
         _text2.frame=CGRectMake(370, 277, 49, 30);
         _text3.frame=CGRectMake(546, 277, 76, 30);
         _text4.frame=CGRectMake(197, 315, 55, 30);
         _text5.frame=CGRectMake(415, 315, 55, 30);
        
   

        [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB1"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        
       
        for (int i=0; i<_twoArray.count; i++) {
            
            //        float x = i%5;
            //
            //        float y = i/5;
            
            NSInteger index = i % 1;
            NSInteger page = i / 1;
            
            
            
            SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width + Width_Space) + Start_X,  page*(Button_Height + Height_Space)+Start_Y-30, Button_Width+800, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
            NSString *a1 = [_twoArray objectAtIndex:i];
            
            [cb setText:a1];
            
            
            [cb setStateChangedTarget:self selector:@selector(change502:)];
            [_chooseArray2 addObject:cb];
            
            [_view2 addSubview:cb];
            
            
            
            
            
            
            
            
        }

    }

    
    
    
    
#pragma 第一个问题
    
   
    
    
    
    
    for (int i=0; i<_oneArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        NSInteger index = i % 1;
        NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width + Width_Space) + Start_X,  page*(Button_Height + Height_Space)+Start_Y-200, Button_Width+200, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change501:)];
        [_chooseArray1 addObject:cb];

        [_view2 addSubview:cb];
        
        
        
        
        
        
        
        
    }
    
   
    
#pragma 第二个问题
    
   
    
    
    
    
    
    
#pragma 第三个问题
    
 
    
    
    
    
    for (int i=0; i<_threeArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
       
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width + Width_Space+40) + Start_X,  (Button_Height + Height_Space)+Start_Y+100, Button_Width+40, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_threeArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change503:)];
        [_chooseArray3 addObject:cb];

        [_view2 addSubview:cb];
        
        
        
        
        
        
    }
    
    
    [_view2 bringSubviewToFront:_text1];
    [_view2 bringSubviewToFront:_text2];
    [_view2 bringSubviewToFront:_text3];
    [_view2 bringSubviewToFront:_text4];
    [_view2 bringSubviewToFront:_text5];
    [_view2 bringSubviewToFront:_text6];
   



}
-(void)change501:(SSCheckBoxView*)cbv{
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
-(void)change502:(SSCheckBoxView*)cbv{
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
    
    if ([cbv.textLabel.text isEqualToString:[_twoArray firstObject]]) {
        _text1.enabled = YES;
        _text2.enabled = YES;
        _text3.enabled = YES;
    }
    else{
        
        _text1.enabled = NO;
        _text1.text=@"";
        _text2.enabled = NO;
        _text2.text=@"";
        _text3.enabled = NO;
        _text3.text=@"";
    }
    
    if ([cbv.textLabel.text isEqualToString:[_twoArray lastObject]]) {
        _text4.enabled = YES;
        _text5.enabled = YES;
        
    }
    else{
        
        _text4.enabled = NO;
        _text4.text=@"";
        _text5.enabled = NO;
        _text5.text=@"";
       
    }


    
    
}
-(void)change503:(SSCheckBoxView*)cbv{
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
    
    if ([cbv.textLabel.text isEqualToString:[_threeArray lastObject]]) {
        _text6.enabled = YES;
       
        
    }
    else{
        
        _text6.enabled = NO;
        _text6.text=@"";
        
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
    int isok3=0;
    
    
    NSMutableArray*Q1=[[NSMutableArray alloc] init];
    NSMutableArray*Q2=[[NSMutableArray alloc] init];
    NSMutableArray*Q3=[[NSMutableArray alloc] init];
    NSString*str2=[[NSString alloc] init];
    NSString*str=[[NSString alloc] init];
   // NSString*str3=[[NSString alloc] init];
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
        
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_twoArray firstObject]])
        {
            
          //  str3=@"如肝素钠/锂溶液 IU ml肝素溶液+ ml生理盐水";
            
            str=[[[[[[@"如肝素钠/锂溶液" stringByAppendingString:_text1.text] stringByAppendingString:@"IU"] stringByAppendingString:_text2.text] stringByAppendingString:@"ml肝素溶液+"] stringByAppendingString:_text3.text] stringByAppendingString:@"ml生理盐水"];
            
//            str=[[[[str3 stringByAppendingString:@"("] stringByAppendingString:_text1.text] stringByAppendingString:_text2.text] stringByAppendingString:_text3.text];
            isok2=1;
            
            [Q2 addObject:str];
            _chooseStr2=pp.textLabel.text;
            
        }
        
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_twoArray lastObject]])
        {
            
           // str3=@"如冻干肝素 克冻干肝素+ ml生理盐水";
            
            str=[[[[@"如冻干肝素" stringByAppendingString:_text4.text] stringByAppendingString:@"克冻干肝素+"] stringByAppendingString:_text5.text] stringByAppendingString:@"ml生理盐水"];
            
            isok2=1;
            
           [Q2 addObject:str];
            _chooseStr2=pp.textLabel.text;
            
        }
        
        if (isok2==1) {
            if ([_chooseStr2 isEqualToString:[_twoArray firstObject]]) {
                if (_text1.text==nil||[_text1.text isEqualToString:@""]||_text2.text==nil||[_text2.text isEqualToString:@""]||_text3.text==nil||[_text3.text isEqualToString:@""]) {
                    isok2=0;
                   
                }
            }
            else  if ([_chooseStr2 isEqualToString:[_twoArray lastObject]]) {
                if (_text4.text==nil||[_text4.text isEqualToString:@""]||_text5.text==nil||[_text5.text isEqualToString:@""]) {
                    isok2=0;
                    
                }
            }

        }
    }
    for(int i=0;i<[_chooseArray3 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray3 objectAtIndex:i];
        
        if(pp.checked==1&&![pp.textLabel.text isEqualToString:[_threeArray lastObject]])
        {
            
            isok3=1;
            [Q3 addObject:pp.textLabel.text];
            _chooseStr2=pp.textLabel.text;
            
        }
        
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_threeArray lastObject]])
        {
            
            isok3=1;
            
            _chooseStr2=pp.textLabel.text;
            
            str2=[[pp.textLabel.text stringByAppendingString:@"(" ] stringByAppendingString:_text6.text];
            [Q3 addObject:str2];
            
        }
    }
    
    if (isok3==1) {
        if ([_chooseStr2 isEqualToString:[_threeArray lastObject]]) {
            if (_text6.text==nil||[_text6.text isEqualToString:@""]) {
                isok3=0;
            }
        }
    }

    
    if (isok1==100) {
        
        
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
        
//        NSString * detailStr=[Q2 objectAtIndex:0];
//       
//        detailStr = [detailStr stringByReplacingOccurrencesOfString:@" " withString:@""];
//        NSLog(@"%@",detailStr);
//        [Q2 removeAllObjects];
//        [Q2 addObject:detailStr];
        
        
        NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
        
//       NSString* string = [NSString stringWithFormat:@"%@,%@,%@,%@,%@",_text1.text,_text2.text,_text3.text,_text4.text,_text5.text ];
        NSDictionary *q1 =@{@"choose":Q1};
        NSDictionary *q2 =@{@"choose":Q2};
        NSDictionary *q3 =@{@"choose":Q3};
        
        NSDictionary*num1=@{@"5.1":q1};
         NSDictionary*num2=@{@"5.2":q2};
         NSDictionary*num3=@{@"5.3":q3};
        
        
        
        
        NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
        
        
        
        
        NSLog(@"%@",[choose objectForKey:@"choose"]);
        NSMutableArray *discardedItems = [NSMutableArray array];
        
        for (NSDictionary*kk in lex) {
            
            if ([kk objectForKey:@"5.1"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"5.2"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"5.3"]) {
                
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

        

    
//    ThreeViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"FourPage"];
//    
//    [self.navigationController pushViewController:receive animated:YES];
        
        
        if (!_four) {
            
            _four= [self.storyboard instantiateViewControllerWithIdentifier:@"fivePage"];
        }
        
        
        
        [self.navigationController pushViewController:_four animated:YES];
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
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-260 , self.view.frame.size.width, self.view.frame.size.height);
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
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+260 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}

- (IBAction)takePhoto1:(id)sender {
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
    _a=0;
  
    
}

- (IBAction)takePhoto2:(id)sender {
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
    _a=1;
}

-(NSString *)getImageSavePath{
    //获取存放的照片
    //获取Documents文件夹目录
    NSUserDefaults *number = [NSUserDefaults standardUserDefaults];
    
    
    if (_a==0) {
       
        
//        NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
//        NSString*photoName=[NSString stringWithFormat:@"%d",[[photoList objectForKey:@"photoList"] integerValue]];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *date = [formatter stringFromDate:[NSDate date]];
        _str=[[@"5-1_" stringByAppendingString:date] stringByAppendingString:@".jpg"];
    }
    else{
       
        
//        NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
//        NSString*photoName=[NSString stringWithFormat:@"%d",[[photoList objectForKey:@"photoList"] integerValue]];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *date = [formatter stringFromDate:[NSDate date]];
        _str=[[@"5-2_" stringByAppendingString:date] stringByAppendingString:@".jpg"];
    }
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
    NSString *imageDocPath = [createPath stringByAppendingPathComponent:_str];
    
    
    
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
    
   
    
    //UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:imageDocPath];
    
    _isFullScreen = NO;
    
    if (_a==0) {
         [_img1 setImage:[UIImage imageWithData:data]];
    }else{
    
        [_img2 setImage:[UIImage imageWithData:data]];
    
    }
    _img1.tag=100;
    _img2.tag=101;
   
   
    
    
    
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

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    
//    
//    
//    _isFullScreen = !_isFullScreen;
//    UITouch *touch = [touches anyObject];
//    
//    CGPoint touchPoint = [touch locationInView:_view2];
//    
//   
//    
//    
//    CGPoint imagePoint = _img1.frame.origin;
//    //touchPoint.x ，touchPoint.y 就是触点的坐标
//    
//    // 触点在imageView内，点击imageView时 放大,再次点击时缩小
//    
//    
//    
//    
//    if(imagePoint.x <= touchPoint.x && imagePoint.x +_img1.frame.size.width >=touchPoint.x && imagePoint.y <=  touchPoint.y && imagePoint.y+_img1.frame.size.height >= touchPoint.y)
//    {
//        // 设置图片放大动画
//        [UIView beginAnimations:nil context:nil];
//        // 动画时间
//        [UIView setAnimationDuration:1];
//        
//        if (_isFullScreen) {
//            // 放大尺寸
//            
//            _img1.frame = CGRectMake(50, 0, 800, 480);
//        }
//        else {
//            // 缩小尺寸
//            _img1.frame = CGRectMake(814, 27, 50, 50);
//        }
//        
//        // commit动画
//        [UIView commitAnimations];
//        
//    }
//    
//}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        ThreeViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"FourPage"];
        
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
    
}@end
